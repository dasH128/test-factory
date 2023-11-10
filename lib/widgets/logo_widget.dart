import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          height: 200.0,
          width: 400,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/home.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
