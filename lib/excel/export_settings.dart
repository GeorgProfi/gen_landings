import 'package:gen_landings/excel/excel_params.dart';

import 'package:universal_html/html.dart' as html;
import 'package:flutter/material.dart';
import 'package:excel/excel.dart';


void exportSettings(List<Widget> widgets) {
  var excel = Excel.createExcel();
  int curWidgetIndex = 1;

  for (Widget widget in widgets) {
    int sheetRow = 1;
    String widgetString = widget.toString();
    Sheet sheet = excel['$widgetString $curWidgetIndex'];

    Map<String, dynamic> currentParams = params[widgetString]!;

    // Set widget information
    curWidgetIndex++;

    // Set parameter values
    bool repeat = false;
    int countsRepeat = 0;

    for (String key in currentParams.keys) {
      dynamic value = currentParams[key];

      if (key == "shouldRepeat") {
        repeat = true;
        countsRepeat = value;
      }

      if (value != null) {
        setCellValue(sheet, "A", sheetRow, TextCellValue(key));
        String curValueLetter = "B";
        setCellValue(
            sheet, curValueLetter, sheetRow, TextCellValue(value.toString()));

        // Handle repetition
        if (repeat && key != "shouldRepeat") {
          for (int i = 1; i < countsRepeat; i++) {
            curValueLetter = getNextLetterCombination(curValueLetter);
            setCellValue(sheet, curValueLetter, sheetRow,
                TextCellValue(value.toString()));
          }
        }
      }

      sheetRow++;
    }
  }
  excel.delete("Sheet1");

  // Serialize Excel document to bytes
  var excelBytes = excel.encode();

  // Create download link
  var blob = html.Blob([excelBytes]);
  var url = html.Url.createObjectUrlFromBlob(blob);
  var anchor = html.AnchorElement(href: url)
    ..target = 'blank'
    ..download = 'example.xlsx';

  // Trigger download
  html.document.body?.append(anchor);
  anchor.click();

  // Revoke object URL
  html.Url.revokeObjectUrl(url);
}

void setCellValue(Sheet sheet, String column, int row, dynamic value) {
  sheet.cell(CellIndex.indexByString("$column$row")).value = value;
}
