import 'package:expence_tracker/src/database/transaction_dao.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class StarAndCustomerType extends StatelessWidget {
  const StarAndCustomerType({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: context.read<TransactionsDao>().expenceValues(),
      builder: (context, asyncSnapshot) {
        final value = asyncSnapshot.data?.abs() ?? 0;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    CupertinoIcons.star_fill,
                    size: 18,
                    color: Colors.amber,
                  ),
                  Icon(
                    value >= 5000
                        ? CupertinoIcons.star_fill
                        : CupertinoIcons.star,
                    size: 18,
                    color: value >= 5000 ? Colors.amber : Colors.black,
                  ),
                  Icon(
                    value >= 10000
                        ? CupertinoIcons.star_fill
                        : CupertinoIcons.star,
                    size: 18,
                    color: value >= 10000 ? Colors.amber : Colors.black,
                  ),
                  Icon(
                    value >= 20000
                        ? CupertinoIcons.star_fill
                        : CupertinoIcons.star,
                    size: 18,
                    color: value >= 20000 ? Colors.amber : Colors.black,
                  ),
                  Icon(
                    value >= 35000
                        ? CupertinoIcons.star_fill
                        : CupertinoIcons.star,
                    size: 18,
                    color: value >= 35000 ? Colors.amber : Colors.black,
                  ),
                ],
              ),

              //   },
              // ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "CT: ",
                      style: const TextStyle(color: Colors.black, fontSize: 12),
                    ),

                    TextSpan(
                      text: value >= 5000 && value < 10000
                          ? "Elite".toUpperCase()
                          : value > 5000 && value <= 10000
                          ? "Legendary".toUpperCase()
                          : value > 10000 && value <= 20000
                          ? "Master"
                          : value > 20000
                          ? "Epic".toUpperCase()
                          : "General".toUpperCase(),
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ],
                ),
              ),

              SvgPicture.asset(
                "assets/icons/wallet.svg",
                height: 25,
                width: 25,
              ),
            ],
          ),
        );
      },
    );
  }
}
