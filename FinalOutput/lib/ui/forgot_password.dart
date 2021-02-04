import 'package:FinalOutput/global.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Global.deepPurple,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Global.white),
        elevation: 0,
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          child: Text('FORGOT PASSWORD'),
        ),
      ),
    );
  }
}
