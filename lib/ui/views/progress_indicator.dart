

import 'package:flutter/material.dart';

class ProgressIndicatorTest extends StatelessWidget {
  const ProgressIndicatorTest({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            child: CircularProgressIndicator(color: Colors.white,),
          ),
        ],
      ),
    );
  }
}