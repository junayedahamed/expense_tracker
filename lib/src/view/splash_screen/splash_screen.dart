import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:expence_tracker/src/view/home/bottom_nav_bar/bottom_nav.dart';
import 'package:expence_tracker/src/view/splash_screen/custom_transition.dart';
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
  // late AnimatedTextController textcontroller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1, milliseconds: 300),
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
    await Future.delayed(Duration(milliseconds: 1300));

    if (mounted) {
      Navigator.of(context).push(
        CustomTransition.createRoute(MyNavigationBar(), Offset(1.0, 0.0), 1300),
      );
      // Navigator.of(context).push(
      //   PageRouteBuilder(
      //     transitionDuration: Duration(milliseconds: 500),
      //     pageBuilder: (context, animation, secondaryAnimation) =>
      //         MyNavigationBar(),
      //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //       const begin = Offset(1.0, 0.0); // Slide from right
      //       const end = Offset.zero;
      //       const curve = Curves.easeInOut;

      //       final tween = Tween(
      //         begin: begin,
      //         end: end,
      //       ).chain(CurveTween(curve: curve));
      //       final offsetAnimation = animation.drive(tween);

      //       return SlideTransition(position: offsetAnimation, child: child);
      //     },
      //   ),
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.topStart,
        children: [
          Center(
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

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 104),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80.0),
                child: AnimatedTextKit(
                  controller: AnimatedTextController(),
                  isRepeatingAnimation: false,
                  animatedTexts: [
                    TypewriterAnimatedText(
                      "XPENSO",

                      speed: Duration(milliseconds: 80),
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
