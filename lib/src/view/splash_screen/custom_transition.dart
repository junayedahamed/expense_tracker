import 'package:flutter/material.dart';

class CustomTransition {
  static Route createRoute(
    Widget page,
    Offset offset,
    int transititionDurationMs,
  ) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: Duration(milliseconds: transititionDurationMs),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final begin = offset;
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));

        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }
}

// class Page2 extends StatelessWidget {
//   const Page2({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: const Center(child: Text('Page 2')),
//     );
//   }
// }
