import 'package:expence_tracker/src/view/home/bottom_nav_bar/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreenWallet extends StatefulWidget {
  const SplashScreenWallet({super.key});

  @override
  State<SplashScreenWallet> createState() => _SplashScreenWalletState();
}

class _SplashScreenWalletState extends State<SplashScreenWallet>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1, milliseconds: 500),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      navigate();
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void navigate() async {
    await Future.delayed(Duration(milliseconds: 1500));

    if (mounted) {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => MyNavigationBar()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LottieBuilder.asset(
          'assets/icons/Wallet.json',

          controller: controller,
          onLoaded: (p0) {
            controller.forward();
          },
          height: 350,
          // width: ,
        ),
      ),
    );
  }
}
