import 'package:flutter/material.dart';

class Test1 extends StatelessWidget {
  const Test1({Key? key}) : super(key: key);

  void f(String str1, {required String str3, String? str4}) {}

  @override
  Widget build(BuildContext context) {
    var result = f('str1', str3: '', str4: null);
    bool type = true;

    return MaterialApp(
      home: Scaffold(
        body: Container(
            color: Colors.blue,
            child: Center(
              child: Text(type ? 'true' : 'false'),
            )),
      ),
    );
  }

  void funtionTest() {
    late String s1;
    s1 = '';





  }


}
