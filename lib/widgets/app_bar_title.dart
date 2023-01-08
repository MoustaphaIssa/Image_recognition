import 'package:flutter/material.dart';
import 'package:projet/res/custom_colors.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/logo2.png',
          height: 20,
        ),
        const SizedBox(width: 8),
        const Text(
          'Le Hangar App',
          style: TextStyle(
            color: CustomColors.firebaseYellow,
            fontSize: 18,
          ),
        ),
        /*Text(
          ' Authentication',
          style: TextStyle(
            color: CustomColors.firebaseOrange,
            fontSize: 18,
          ),
        ),*/
      ],
    );
  }
}
