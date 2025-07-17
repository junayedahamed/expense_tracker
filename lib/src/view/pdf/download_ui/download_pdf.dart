import 'package:expence_tracker/src/database/transaction_dao.dart';
import 'package:expence_tracker/src/repositories/pdf_functionalities/pdf_download_functionalities.dart';
import 'package:expence_tracker/src/view/pdf/widgets/my_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PdfDownloadUi extends StatelessWidget {
  PdfDownloadUi({super.key});

  final PdfDownloadFunctionalities pdf = PdfDownloadFunctionalities();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          "Actions:",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        DownloadUploadButton(
          buttonName: "Upload",
          iconpath: "assets/icons/upload_cloud.svg",
          onPressed: () {
            // log(transations.toString());
          },
        ),
        DownloadUploadButton(
          buttonName: "PDF",
          iconpath: "assets/icons/dpf_download.svg",
          onPressed: () async {
            // // log(DateTime.now().second.toString());
            // final data = await context
            //     .read<TransactionsDao>()
            //     .getAllTransectionItems();
            // // final data = List.generate(10, (index) {
            // //   return "count $index";
            // // });
            // if (data.isEmpty) {
            //   ScaffoldMessenger.of(
            //     context,
            //   ).showSnackBar(SnackBar(content: Text("no data yet")));
            //   return;
            // }
            // ScaffoldMessenger.of(
            //   context,
            // ).showSnackBar(SnackBar(content: Text("Wait for 3 seconds")));
            // Future.delayed(Duration(seconds: 3));
            // pdf.downloadPDF(data, context);
            final scaffoldMessenger = ScaffoldMessenger.of(context);

            final dao = context.read<TransactionsDao>();

            final data = await dao.getAllTransectionItems();

            if (data.isEmpty) {
              // if (Platform.isAndroid) {
              //   log(Platform.version);
              //   var androidInfo = await DeviceInfoPlugin().androidInfo;
              //   var release = int.parse(androidInfo.version.release);
              //   var sdkInt = androidInfo.version.sdkInt;
              //   var manufacturer = androidInfo.manufacturer;
              //   var model = androidInfo.model;
              //   log('Android $release (SDK $sdkInt), $manufacturer $model');
              // }
              scaffoldMessenger.showSnackBar(
                SnackBar(content: Text("no data yet")),
              );
              return;
            }

            // scaffoldMessenger.showSnackBar(
            //   SnackBar(content: Text("Wait for 3 seconds")),
            // );

            // await Future.delayed(Duration(seconds: 3));
            pdf.downloadPDF(
              data,
              // ignore: use_build_context_synchronously
              context,
            );
          },
        ),
      ],
    );
  }
}
