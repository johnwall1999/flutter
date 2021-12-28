import 'package:flutter/material.dart';

class CapLoadingLogo extends StatefulWidget {

  @override
  CapLoadingLogoState createState() => CapLoadingLogoState();

}

class CapLoadingLogoState extends State<CapLoadingLogo> with TickerProviderStateMixin {

  final String src = "assets/images/loading.png" ;

  late final AnimationController _controller = AnimationController(
    duration: const Duration( milliseconds: 800 ),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SizedBox.expand(
    child: Center(
      child: FadeTransition(
        opacity: _animation,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(75),
            child: SizedBox(
              width: 150 ,
              height: 150 ,
              child: Image.asset( src ),
          ),
        ),
      )
    ) ,
  ) ;

}