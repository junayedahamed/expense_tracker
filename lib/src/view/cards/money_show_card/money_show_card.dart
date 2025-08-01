import 'package:expence_tracker/src/database/transaction_dao.dart';
import 'package:expence_tracker/src/view/cards/money_show_card/widget/star_and_customer_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MoneyShowCard extends StatelessWidget {
  const MoneyShowCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Card(
          // surfaceTintColor: Colors.amber,
          child: StreamBuilder<double>(
            stream: context.read<TransactionsDao>().averageItemLength(),
            builder: (context, snapshot) {
              var value = snapshot.data ?? 0;

              return GestureDetector(
                onHorizontalDragEnd: (details) {
                  // context.read<CardGradientHandler>().changeGradient(details);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      colors: [
                        Colors.green.shade500,
                        Colors.greenAccent.shade400,
                        Colors.lightGreenAccent,
                      ],
                    ),
                    // : SweepGradient(
                    //     colors: [
                    //       Colors.green.shade500,
                    //       Colors.greenAccent.shade400,
                    //       Colors.lightGreenAccent,
                    //     ],
                    //   ),
                  ),
                  constraints: const BoxConstraints(
                    maxWidth: 400,
                    maxHeight: 200,
                    minHeight: 150,
                    minWidth: 200,
                  ),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              spacing: 5,
                              children: [
                                const Text(
                                  "Avilable Balance",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  overflow: TextOverflow.ellipsis,
                                  value.toString(),
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Spacer(),
                      SvgPicture.asset(
                        "assets/icons/bg_tag.svg",
                        height: 100,
                        width: 100,
                        colorFilter: ColorFilter.mode(
                          CupertinoColors.separator,
                          BlendMode.srcIn,
                        ),
                      ),
                      Spacer(),

                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 10),
                      //   child: Row(
                      //     // crossAxisAlignment: CrossAxisAlignment.start,
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       // BlocBuilder<UpdateIncomingOutgingData, double>(
                      //       //   builder: (context, state) {
                      //       //     var value = context
                      //       //         .read<UpdateIncomingOutgingData>()
                      //       //         .costedMoneyOnApp;
                      //       Row(
                      //         children: [
                      //           const Icon(
                      //             CupertinoIcons.star_fill,
                      //             size: 18,
                      //             color: Colors.amber,
                      //           ),
                      //           Icon(
                      //             value >= 5000
                      //                 ? CupertinoIcons.star_fill
                      //                 : CupertinoIcons.star,
                      //             size: 18,
                      //             color: value >= 5000
                      //                 ? Colors.amber
                      //                 : Colors.black,
                      //           ),
                      //           Icon(
                      //             value >= 10000
                      //                 ? CupertinoIcons.star_fill
                      //                 : CupertinoIcons.star,
                      //             size: 18,
                      //             color: value >= 10000
                      //                 ? Colors.amber
                      //                 : Colors.black,
                      //           ),
                      //           Icon(
                      //             value >= 20000
                      //                 ? CupertinoIcons.star_fill
                      //                 : CupertinoIcons.star,
                      //             size: 18,
                      //             color: value >= 20000
                      //                 ? Colors.amber
                      //                 : Colors.black,
                      //           ),
                      //           Icon(
                      //             value >= 35000
                      //                 ? CupertinoIcons.star_fill
                      //                 : CupertinoIcons.star,
                      //             size: 18,
                      //             color: value >= 35000
                      //                 ? Colors.amber
                      //                 : Colors.black,
                      //           ),
                      //         ],
                      //       ),

                      //       //   },
                      //       // ),
                      //       // BlocBuilder<UpdateIncomingOutgingData, double>(
                      //       //   builder: (context, state) {
                      //       //     var value2 = context
                      //       //         .read<UpdateIncomingOutgingData>()
                      //       //         .costedMoneyOnApp;

                      //       //     return RichText(
                      //       //       text: TextSpan(
                      //       //         children: [
                      //       //           TextSpan(
                      //       //             text: "CT: ",
                      //       //             style: const TextStyle(
                      //       //               color: Colors.black,
                      //       //               fontSize: 12,
                      //       //             ),
                      //       //           ),

                      //       //           TextSpan(
                      //       //             text: value2 >= 5000 && value2 < 10000
                      //       //                 ? "Elite".toUpperCase()
                      //       //                 : value2 > 5000 && value2 <= 10000
                      //       //                 ? "Legendary".toUpperCase()
                      //       //                 : value2 > 10000 && value2 <= 20000
                      //       //                 ? "Master"
                      //       //                 : value2 > 20000
                      //       //                 ? "Epic".toUpperCase()
                      //       //                 : "General".toUpperCase(),
                      //       //             style: TextStyle(
                      //       //               color: Colors.black,
                      //       //               fontSize: 12,
                      //       //             ),
                      //       //           ),
                      //       //         ],
                      //       //       ),
                      //       //     );
                      //       //   },
                      //       // ),
                      //       SvgPicture.asset(
                      //         "assets/icons/wallet.svg",
                      //         height: 25,
                      //         width: 25,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      StarAndCustomerType(),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
