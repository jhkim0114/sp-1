import 'package:flutter/material.dart';

class DevModeView extends StatelessWidget {
  const DevModeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.blue,
      width: 200,
      height: 800,
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('dev mode'),
          Text('mode1')
        ],
      ),
    );
  }
}
