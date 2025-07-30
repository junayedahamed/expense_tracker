import 'package:expence_tracker/src/database/transaction_dao.dart';
import 'package:expence_tracker/src/view/pdf/download_ui/download_pdf.dart';
import 'package:expence_tracker/src/view/stats/bar_chart_view/dev/dev_tile_builder.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class BarChartView extends StatelessWidget {
  const BarChartView({super.key});

  // final List<String> viewType = ["Daily", "Weekly", "Monthly", "Yearly"];

  @override
  Widget build(BuildContext context) {
    // final controller = context.watch<StreamViewController>();
    // String selected = "Daily";
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
            //       width: 130,
            //       height: 40,
            //       child: DropdownButtonFormField<String>(
            //         decoration: InputDecoration(
            //           border: OutlineInputBorder(),
            //           contentPadding: EdgeInsets.symmetric(horizontal: 10),
            //         ),
            //         value: context.read<StreamViewController>().state,
            //         items: viewType.map((String value) {
            //           return DropdownMenuItem<String>(
            //             value: value.toLowerCase(),
            //             child: Text(
            //               value,
            //               style: TextStyle(
            //                 fontSize: 12,
            //                 fontWeight: FontWeight.w500,
            //               ),
            //             ),
            //           );
            //         }).toList(),
            //         onChanged: (String? newValue) {
            //           if (newValue != null) {
            //             context.read<StreamViewController>().selector(newValue);
            //           }
            //         },
            //       ),
            //     ),
            //   ],
            // ),
            Row(
              children: [
                Text(
                  "Transaction History ",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                ),
                SvgPicture.asset(
                  'assets/icons/pie.svg',
                  height: 25,
                  width: 25,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).iconTheme.color ?? Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            //pie chart  view
            StreamBuilder(
              stream: context
                  .read<TransactionsDao>()
                  .watchAlltransactionItems(),
              builder: (context, snapshot) {
                final allData = snapshot.data;
                if (snapshot.hasError) {
                  return Center(child: Text("Error occoured"));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (allData == null) {
                  return Center(child: Text("No Data found"));
                }
                if (allData.isEmpty) {
                  return Center(child: Text("No Data found"));
                }

                final add = allData
                    .where((item) {
                      return item.categoty.toLowerCase() == 'add';
                    })
                    .fold(0.0, (previousValue, element) {
                      return previousValue + element.amount;
                    });
                final cloth = allData
                    .where((item) {
                      return item.categoty.toLowerCase() == 'cloth';
                    })
                    .fold(0.0, (previousValue, element) {
                      return previousValue + element.amount;
                    });
                final medicine = allData
                    .where((item) {
                      return item.categoty.toLowerCase() == 'medicine';
                    })
                    .fold(0.0, (previousValue, element) {
                      return previousValue + element.amount;
                    });
                final entertainment = allData
                    .where((item) {
                      return item.categoty.toLowerCase() == 'entertainment';
                    })
                    .fold(0.0, (previousValue, element) {
                      return previousValue + element.amount;
                    });
                final others = allData
                    .where((item) {
                      return item.categoty.toLowerCase() == 'others';
                    })
                    .fold(0.0, (previousValue, element) {
                      return previousValue + element.amount;
                    });
                final food = allData
                    .where((item) {
                      return item.categoty.toLowerCase() == 'food';
                    })
                    .fold(0.0, (previousValue, element) {
                      return previousValue + element.amount;
                    });
                // log(add.toString());
                final Map<double, Color> data = {
                  food: Colors.orange,
                  add: Colors.green,
                  medicine: Colors.red,
                  entertainment: Colors.purple,
                  others: Colors.grey,
                  cloth: Colors.yellow,
                };
                final Map<double, String> categories = {
                  food: "Food",
                  add: "Add",
                  medicine: "Medicine",
                  entertainment: "Entertainment",
                  others: "Others",

                  cloth: "Cloth",
                };
                return SizedBox(
                  height: 250,
                  child: PieChart(
                    PieChartData(
                      centerSpaceRadius: 0,

                      titleSunbeamLayout: true,
                      sections: List.generate(data.length, (index) {
                        // log(
                        //   "${categories[index]} ${data.keys.toList()[index].abs()}",
                        // );
                        // log(index.toString());
                        return PieChartSectionData(
                          titleStyle: TextStyle(color: Colors.black),
                          radius: 120,
                          color: data.values.toList()[index],

                          title: categories.values.toList()[index],
                          value: data.keys.toList()[index].abs(),
                        );
                      }),
                    ),
                  ),
                );
                // log(allData.toString());
                // return Text("data");
              },
            ),

            //
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Divider(thickness: 2),
            ),
            SizedBox(height: 10),
            PdfDownloadUi(),
            SizedBox(height: 40),

            //Dev Info
            DeveloperInformation(),
          ],
        ),
      ),
    );
  }
}
