import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:gen_landings/excel/excel_params.dart';
import 'dart:html' as html;

Future<int> importSettings() async {
  try {
    FilePickerResult? pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx'],
      allowMultiple: false,
    );
    int countParams = 0;
    if (pickedFile != null) {
      var bytes = pickedFile.files.single.bytes;
      var excel = Excel.decodeBytes(bytes!);
      for (var table in excel.tables.keys) {
        List<String> tableIdentifier = table.split(" ");
        String tableName = tableIdentifier[0];
        String tableIndex = tableIdentifier[1];
        if (params.keys.contains(tableName) &&
            excel.tables[table]?.maxRows == params[tableName]?.length) {
          Map<String, dynamic> currentParams =
              extractParamsFromSheet(excel.tables[table]!, tableName);

          currentParams['name'] = tableName;
          html.window.localStorage['widget $tableIndex'] =
              currentParams.toString();
          countParams++;
        }
      }

      return countParams;
    }

    return 0;
  } catch (e) {
    print('Error during file picking: $e');
    return 0;
  }
}

Map<String, dynamic> extractParamsFromSheet(Sheet sheet, String tableName) {
  Map<String, dynamic> currentParams = {};
  int currentRowSheet = 1;
  int repeat = 1;

  Map<String, dynamic> configParams = params[tableName]!;

  for (String key in configParams.keys.toList()) {
    String cellValue = sheet
        .cell(CellIndex.indexByString("A$currentRowSheet"))
        .value
        .toString();

    if (cellValue == key) {
      String currentColumnLetter = "B";

      for (int i = 1; i <= repeat; i++) {
        dynamic value = sheet
            .cell(
                CellIndex.indexByString("$currentColumnLetter$currentRowSheet"))
            .value;
        currentColumnLetter = getNextLetterCombination(currentColumnLetter);
        if (repeat < 1) {
          return {};
        }

        if (repeat > 1 && i == 1) {
          currentParams[key] = [value];
        } else if (repeat == 1) {
          currentParams[key] = value;
        }

        if (i > 1) {
          currentParams[key].add(value);
        }
      }
      if (key == "shouldRepeat") {
        repeat = int.tryParse(sheet
            .cell(CellIndex.indexByString("B$currentRowSheet"))
            .value
            .toString())!;
      }
    } else {
      return {};
    }

    currentRowSheet++;
  }

  return currentParams;
}
