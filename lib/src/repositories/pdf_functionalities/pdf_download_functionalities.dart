import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:expence_tracker/src/database/database.dart';
import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';

class PdfDownloadFunctionalities {
  Future<bool> getPermission(int androidVersion) async {
    if (androidVersion <= 12) {
      final status = await Permission.storage.request();
      if (status.isGranted) {
        return true;
      }

      return false;
    } else {
      // final status = await Permission.manageExternalStorage.request();
      // if (status.isGranted) {
      //   return true;
      // }

      // return false;

      return true;
    }
  }

  Future<void> downloadPDF(List<TransactionItem> data, context) async {
    final pdf = pw.Document();

    // Load Unicode font
    final fontData = await rootBundle.load('assets/fonts/noto_font.ttf');
    final ttf = pw.Font.ttf(fontData.buffer.asByteData());

    final imageData = await rootBundle.load('assets/icons/verified.png');
    final image = pw.MemoryImage(imageData.buffer.asUint8List());

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,

        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.start,

                    children: [
                      pw.Text(
                        "Expense Tracker",
                        style: pw.TextStyle(
                          font: ttf,
                          fontSize: 25,
                          color: PdfColors.black,
                          fontBold: pw.Font.courierBold(),
                        ),
                      ),
                      pw.SizedBox(width: 2),
                      pw.Stack(
                        alignment: pw.Alignment.center,
                        children: [
                          pw.Center(
                            child: pw.Container(
                              height: 25,
                              width: 25,
                              decoration: pw.BoxDecoration(
                                shape: pw.BoxShape.circle,
                                // color: PdfColors.blue,
                              ),
                              child: pw.Image(image),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  pw.Center(
                    child: pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      children: [
                        pw.Center(
                          child: pw.Text(
                            "Developed by Junayed",
                            style: pw.TextStyle(
                              fontSize: 18,
                              font: ttf,
                              color: PdfColors.black,
                              fontBold: pw.Font.courierBold(),
                            ),
                          ),
                        ),
                        pw.Text(
                          "Exported at: ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}",
                          style: pw.TextStyle(
                            fontSize: 16,
                            font: ttf,
                            color: PdfColors.black,
                            fontBold: pw.Font.courierBold(),
                          ),
                        ),
                        pw.Text(
                          " ${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}",
                          style: pw.TextStyle(
                            fontSize: 16,
                            font: ttf,
                            color: PdfColors.black,
                            fontBold: pw.Font.courierBold(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              pw.Divider(),
              pw.ListView.builder(
                itemBuilder: (context, index) {
                  return pw.RichText(
                    text: pw.TextSpan(
                      children: [
                        pw.TextSpan(text: data[index].sourceDetails),
                        pw.TextSpan(text: " ${data[index].amount}"),
                        pw.TextSpan(text: " ${data[index].createdAt}"),
                      ],
                    ),
                  );
                },
                itemCount: data.length,
              ),
            ],
          );
        },
      ),
    );

    final pdfBytes = await pdf.save();

    // Save to Downloads folder of android
    if (Platform.isAndroid) {
      var androidInfo = await DeviceInfoPlugin().androidInfo;
      var release = int.parse(androidInfo.version.release);
      if (await getPermission(release)) {
        final downloadsPath = '/storage/emulated/0/Download';
        var file = File('$downloadsPath/J_ExP_tracker_Alltransaction.pdf');
        if (await file.exists()) {
          file = File(
            '$downloadsPath/J_ExP_tracker_Alltransaction${DateTime.now().millisecondsSinceEpoch}.pdf',
          );
        }
        await file.writeAsBytes(pdfBytes);

        log(
          '✅ PDF saved to Downloads folder at: $downloadsPath/J_ExP_All_Transaction.pdf',
        );

        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Pdf Download Successful")));
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Permission denied")));
      }
    }

    // ios document save

    if (Platform.isIOS) {
      await FileSaver.instance.saveFile(
        name: "J_ExP_All_Transaction.pdf",
        bytes: pdfBytes,
        fileExtension: "pdf",
        mimeType: MimeType.pdf,
      );
    }
  }
}
