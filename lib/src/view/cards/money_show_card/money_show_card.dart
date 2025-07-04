import 'package:flutter/material.dart';
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
            constraints: BoxConstraints(maxWidth: 400, maxHeight: 200),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Data",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          Text("500000", style: TextStyle(fontSize: 18)),
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
                      Row(
                        children: [
                          ...List.generate(5, (index) {
                            return Icon(Icons.star_outline);
                          }),
                        ],
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "CT: ",
                              style: TextStyle(color: Colors.black),
                            ),

                            TextSpan(
                              text: "General".toUpperCase(),
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),

                      SvgPicture.asset(
                        "assets/icons/wallet.svg",
                        height: 30,
                        width: 30,
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
