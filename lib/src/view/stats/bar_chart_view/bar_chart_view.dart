import 'package:expence_tracker/src/view/pdf/download_ui/download_pdf.dart';
import 'package:expence_tracker/src/view/stats/widgets/daily_chart.dart';
import 'package:flutter/material.dart';

class BarChartView extends StatelessWidget {
  BarChartView({super.key});

  final List<String> viewType = ["Daily", "Weekly", "Monthly", "Yearly"];

  @override
  Widget build(BuildContext context) {
    String selected = "Daily";
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(height: 200),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Choose View Type"),
                SizedBox(
                  width: 130,
                  height: 40,
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    ),
                    value: selected,
                    items: viewType.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        // setState(() {
                        //   selected = newValue;
                        // });
                        // log(selected);
                      }
                    },
                  ),
                ),
              ],
            ),
            Text(
              "History 📊",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
            SizedBox(height: 20),
            DailyChart(),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Divider(thickness: 2),
            ),
            SizedBox(height: 10),
            PdfDownloadUi(),
            SizedBox(height: 20),

            //Dev Info
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
            //   child: Container(
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(16),
            //       border: Border.all(
            //         width: 2,
            //         color: Theme.of(context).iconTheme.color ?? Colors.black,
            //       ),
            //       color:
            //           MediaQuery.of(context).platformBrightness ==
            //               Brightness.light
            //           ? Colors.blueGrey
            //           : Colors.transparent,
            //     ),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Padding(
            //           padding: const EdgeInsets.symmetric(horizontal: 4.0),
            //           child: Text(
            //             "Developer Info",
            //             style: TextStyle(
            //               fontSize: 20,
            //               fontWeight: FontWeight.w600,
            //             ),
            //           ),
            //         ),
            //         ExpansionTile(
            //           leading: SvgPicture.asset(
            //             'assets/icons/dev.svg',
            //             colorFilter: ColorFilter.mode(
            //               Theme.of(context).iconTheme.color ?? Colors.white,
            //               BlendMode.srcIn,
            //             ),
            //           ),
            //           shape: RoundedRectangleBorder(
            //             // borderRadius: BorderRadiusGeometry.circular(16),
            //           ),
            //           title: Text("About Developer"),

            //           children: [
            //             Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [

            //               ],
            //             )
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
