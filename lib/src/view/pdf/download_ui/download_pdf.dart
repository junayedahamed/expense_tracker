import 'package:expence_tracker/src/view/pdf/widgets/my_custom_button.dart';
import 'package:flutter/material.dart';

class PdfDownloadUi extends StatelessWidget {
  const PdfDownloadUi({super.key});

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
          onPressed: () {},
        ),
        DownloadUploadButton(
          buttonName: "PDF",
          iconpath: "assets/icons/dpf_download.svg",
          onPressed: () {},
        ),
      ],
    );
  }
}
