import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';

Future<void> importSettings() async {
  try {
    /// Use FilePicker to pick files in Flutter Web
    FilePickerResult? pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx'],
      allowMultiple: false,
    );

    /// file might be picked
    if (pickedFile != null) {
      var bytes = pickedFile.files.single.bytes;
      var excel = Excel.decodeBytes(bytes!);
      for (var table in excel.tables.keys) {
        print(table); //sheet Name
        print(excel.tables[table]?.maxColumns);
        print(excel.tables[table]?.maxRows);
        for (var row in excel.tables[table]!.rows) {
          print('$row');
        }
      }
    }
  } catch (e) {
    print('Error during file picking: $e');
    // Handle the error appropriately
  }
}
