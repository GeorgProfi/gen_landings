import 'package:gen_landings/excel_params.dart';

import 'package:universal_html/html.dart' as html;
import 'package:flutter/material.dart';
import 'package:excel/excel.dart';

void exportSettings(List<Widget> widgets) {
  var excel = Excel.createExcel();
  var sheet = excel['Sheet1'];
  int q = 1;
  for (Widget widget in widgets) {
    // Получение ключа виджета
    String widgetSt = widget.toString();
    Map<String, dynamic> curParams = params[widgetSt];
    for (String key in curParams.keys) {
      dynamic value = curParams[key];
      if (key == "shouldRepeat") {
        if (value != null) {
          sheet.cell(CellIndex.indexByString("A$q")).value = TextCellValue(key);

          sheet.cell(CellIndex.indexByString("B$q")).value =
              TextCellValue(value.toString());
        }
      } else {
        if (value != null) {
          sheet.cell(CellIndex.indexByString("A$q")).value = TextCellValue(key);

          if (value is int) {
            print(value);
            sheet.cell(CellIndex.indexByString("B$q")).value =
                DoubleCellValue(value.toDouble());
          } else {
            sheet.cell(CellIndex.indexByString("B$q")).value =
                TextCellValue(value.toString());
          }
        }
      }
      q += 1;
    }
    // Проверка, является ли ключ ValueKey
  }
  // Добавление данных в таблицу

  // Сериализация Excel-документа в байты
  var excelBytes = excel.encode();

  // Создание и установка ссылки для скачивания
  var blob = html.Blob([excelBytes]);
  var url = html.Url.createObjectUrlFromBlob(blob);
  var anchor = html.AnchorElement(href: url)
    ..target = 'blank'
    ..download = 'example.xlsx';

  // Активация клика по ссылке для скачивания
  html.document.body?.append(anchor);
  anchor.click();

  // Удаление ссылки после скачивания
  html.Url.revokeObjectUrl(url);
}
