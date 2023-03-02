import 'dart:io';
import 'dart:typed_data';

import 'package:open_filex/open_filex.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfApi {
  static Future<File> getSaveDoc(
      {required String fileName, required pw.Document pdf}) async {
    Uint8List bytes = await pdf.save();
    Directory dir = Directory.systemTemp;
    File file = File('${dir.path}/$fileName.pdf');
    await file.writeAsBytes(bytes);
    return file;
  }

  static Future<void> openFile(File file) async {
    String url = file.path;
    await OpenFilex.open(url, type: 'application/pdf');
  }
}
