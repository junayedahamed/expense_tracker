import 'package:expence_tracker/src/database/transaction_dao.dart';
import 'package:expence_tracker/src/repositories/pdf_functionalities/pdf_download_functionalities.dart';
import 'package:expence_tracker/src/view/pdf/download_ui/delete_all_confirmation.dart';
import 'package:expence_tracker/src/view/pdf/widgets/my_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PdfDownloadUi extends StatelessWidget {
  PdfDownloadUi({super.key});

  final PdfDownloadFunctionalities pdf = PdfDownloadFunctionalities();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 15,
        children: [
          Text(
            "Actions:",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          DownloadUploadButton(
            buttonName: "Delte all",
            iccolor: Colors.red,
            textcolor: Colors.red,
            iconpath: "assets/icons/delete.svg",
            onPressed: () {
              var conf = showDialog(
                context: context,
                builder: (context) => DeleteAllConfirmation(),
              );

              conf.then((v) {
                if (!v) {
                  return;
                }

                // ignore: use_build_context_synchronously
                context.read<TransactionsDao>().deleteAlltransaction();
              });
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

              final data = await dao.getAlltransactionItems();

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
      ),
    );
  }
}
