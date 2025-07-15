import 'package:expence_tracker/src/database/transaction_dao.dart';
import 'package:expence_tracker/src/view/pdf/download_ui/download_pdf.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BarChartView extends StatelessWidget {
  BarChartView({super.key});
  final List<String> viewType = ["Daily", "Weekly", "Monthly", "Yearly"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(height: 200),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text("Choose View Type"),
            //     SizedBox(
            //       width: 150,
            //       child: DropdownButtonFormField<String>(
            //         decoration: InputDecoration(
            //           border: OutlineInputBorder(),
            //           contentPadding: EdgeInsets.symmetric(horizontal: 10),
            //         ),
            //         value: viewType[0],
            //         items: viewType.map((String value) {
            //           return DropdownMenuItem<String>(
            //             value: value,
            //             child: Text(value, style: TextStyle(fontSize: 12)),
            //           );
            //         }).toList(),
            //         onChanged: (String? newValue) {
            //           // Handle the change in view type
            //         },
            //       ),
            //     ),
            //   ],
            // ),
            Text(
              "History 📊",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
            SizedBox(height: 20),
            StreamBuilder(
              stream: context
                  .read<TransactionsDao>()
                  .watchAllTransectionItems(),
              builder: (context, snapshot) {
                final allData = snapshot.data;
                if (snapshot.hasError) {
                  return Center(child: Text("Error occoured"));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return LinearProgressIndicator();
                }

                if (allData == null) {
                  return Center(child: Text("No Data found"));
                }
                if (allData.isEmpty) {
                  return Center(child: Text("No Data found"));
                }
                return SizedBox(
                  height: 500,
                  child: BarChart(
                    BarChartData(
                      barTouchData: BarTouchData(
                        touchTooltipData: BarTouchTooltipData(
                          direction: TooltipDirection.auto,
                        ),
                      ),
                      barGroups: allData.map((data) {
                        return BarChartGroupData(
                          x: data.createdAt!.hour,

                          barRods: [
                            BarChartRodData(
                              borderDashArray: [1, 1],
                              backDrawRodData: BackgroundBarChartRodData(
                                show: true,
                                toY: data.amount.abs(),
                                color: Colors.red.shade300,
                              ),
                              fromY: 0,
                              toY: data.amount.abs(),
                              width: 16,
                              borderRadius: BorderRadius.zero,
                              // toY: data.amount,
                              color: data.isExp == false
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                );
                // log(allData.toString());
                // return Text("data");
              },
            ),
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
