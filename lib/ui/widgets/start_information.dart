import 'package:flutter/material.dart';

class StartInformation extends StatelessWidget {
  const StartInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      child: Image.asset('assets/images/bear_market.png'),
    );
  }
}
