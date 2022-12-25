import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/screens/score_screen.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({
    Key? key,
  }) : super(key: key);

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();

    animationController = AnimationController(duration: const Duration(seconds: 60), vsync: this);
    animation = Tween<double>(begin: 1, end: 0).animate(animationController)
      ..addListener(() {
        setState(() {});
      });
    animationController.forward().whenComplete(name);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void name() {
    Future.delayed(
      const Duration(milliseconds: 12),
      () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return const ScoreScreen();
          },
        ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 35,
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF3F4768), width: 3), borderRadius: BorderRadius.circular(50)),
          child: Stack(children: [
            LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  width: constraints.maxWidth * animation.value,
                  decoration: BoxDecoration(gradient: kSecondGradient, borderRadius: BorderRadius.circular(50)),
                );
              },
            ),
            Positioned.fill(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("${(animation.value * 60).round()} saniye "), SvgPicture.asset("assets/icons/clock.svg")],
              ),
            ))
          ]),
        )
      ],
    );
  }
}
