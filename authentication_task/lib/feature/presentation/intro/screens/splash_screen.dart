import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 
    5), () {
    //  Navigator.pushReplacement(
       // context,
       // MaterialPageRoute(builder: (context) { }),
     // );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Column(
      children: [
        
        Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 
               //   ),
                 // DelayedWidget(
                  //  delayDuration: const Duration(milliseconds: 700),
                   // animationDuration: Durations.long2,
                  //  animation: DelayedAnimations.SLIDE_FROM_RIGHT,
                  //  child: Shimmer.fromColors(
                  //    period: Durations.extralong4,
                   //   direction: ShimmerDirection.rtl,
                   //   baseColor: Theme.of(context).colorScheme.onSurface,
                   //   highlightColor: Theme.of(context).colorScheme.surfaceTint,
                     // child:
                       const Text(
                        "الـگو",
                        style: TextStyle(
                          fontSize: 100,
                          height: 7,
                          fontFamily: "dana",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                  //  ),
                 // ),
                ],
              ),
      
      ],
     ),
      
      );
  }
}