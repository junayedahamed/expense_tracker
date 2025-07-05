import 'package:expence_tracker/src/repositories/add_money_repo/add_money.dart';
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
            ),
            constraints: BoxConstraints(
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Avilable Balance",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          BlocBuilder<UpdateIncomingOutgingData, double>(
                            builder: (context, state) => Text(
                              state.toString(),
                              style: const TextStyle(fontSize: 18),
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
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlocBuilder<UpdateIncomingOutgingData, double>(
                        builder: (context, state) => Row(
                          children: [
                            // ...List.generate(5, (index) {

                            //   return Icon(
                            //     value >= 0 && value <= 5000
                            //         ? CupertinoIcons.star_fill
                            //         : CupertinoIcons.star,
                            //     size: 18,
                            //     color: value >= 0 && value <= 5000
                            //         ? Colors.amber
                            //         : null,
                            //   );
                            // }),
                            Icon(
                              CupertinoIcons.star_fill,
                              size: 18,
                              color: Colors.amber,
                            ),
                            Icon(
                              context
                                          .read<UpdateIncomingOutgingData>()
                                          .costedMoneyOnApp >=
                                      5000
                                  ? CupertinoIcons.star_fill
                                  : CupertinoIcons.star,
                              size: 18,
                              color:
                                  context
                                          .read<UpdateIncomingOutgingData>()
                                          .costedMoneyOnApp >=
                                      5000
                                  ? Colors.amber
                                  : null,
                            ),
                            Icon(
                              context
                                          .read<UpdateIncomingOutgingData>()
                                          .costedMoneyOnApp >=
                                      10000
                                  ? CupertinoIcons.star_fill
                                  : CupertinoIcons.star,
                              size: 18,
                              color:
                                  context
                                          .read<UpdateIncomingOutgingData>()
                                          .costedMoneyOnApp >=
                                      10000
                                  ? Colors.amber
                                  : null,
                            ),
                            Icon(
                              context
                                          .read<UpdateIncomingOutgingData>()
                                          .costedMoneyOnApp >=
                                      20000
                                  ? CupertinoIcons.star_fill
                                  : CupertinoIcons.star,
                              size: 18,
                              color:
                                  context
                                          .read<UpdateIncomingOutgingData>()
                                          .costedMoneyOnApp >=
                                      20000
                                  ? Colors.amber
                                  : null,
                            ),
                            Icon(
                              context
                                          .read<UpdateIncomingOutgingData>()
                                          .costedMoneyOnApp >=
                                      35000
                                  ? CupertinoIcons.star_fill
                                  : CupertinoIcons.star,
                              size: 18,
                              color:
                                  context
                                          .read<UpdateIncomingOutgingData>()
                                          .costedMoneyOnApp >=
                                      35000
                                  ? Colors.amber
                                  : null,
                            ),
                          ],
                        ),
                      ),
                      BlocBuilder<UpdateIncomingOutgingData, double>(
                        builder: (context, state) => RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "CT: ",
                                style: TextStyle(color: Colors.black),
                              ),

                              TextSpan(
                                text:
                                    context
                                            .read<UpdateIncomingOutgingData>()
                                            .costedMoneyOnApp >
                                        5000
                                    ? "Epic".toUpperCase()
                                    : "General".toUpperCase(),
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SvgPicture.asset(
                        "assets/icons/wallet.svg",
                        height: 25,
                        width: 25,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
