import 'package:FinalOutput/global.dart';
import 'package:FinalOutput/model/login_model.dart';
import 'package:FinalOutput/ui/login_screen.dart';
import 'package:FinalOutput/ui/widgets/button_widget.dart';
import 'package:FinalOutput/ui/widgets/textfield_widget.dart';
import 'package:FinalOutput/ui/widgets/wave_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<LoginModel>(context);
    final size = MediaQuery.of(context).size;
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    return Scaffold(
      backgroundColor: Global.white,
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height - 200,
            color: Global.deepPurple,
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeOutQuad,
            top: keyboardOpen ? -size.height / 3.7 : 0.0,
            child: WaveWidget(
              size: size,
              yOffset: size.height / 3.0,
              color: Global.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Sign Up',
                    style: TextStyle(
                      color: Global.white,
                      fontSize: 60.0,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextFieldWidget(
                  hintText: 'First Name',
                  obscureText: false,
                  prefixIconData: Icons.account_box_outlined,
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFieldWidget(
                  hintText: 'Last Name',
                  obscureText: false,
                  prefixIconData: Icons.account_box_outlined,
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFieldWidget(
                  hintText: 'Email',
                  obscureText: false,
                  prefixIconData: Icons.mail_outline,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextFieldWidget(
                      hintText: 'Password',
                      obscureText: model.isVisible ? false : true,
                      prefixIconData: Icons.lock_outline,
                      suffixIconData: model.isVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        TextFieldWidget(
                          hintText: 'Confirm Password',
                          obscureText: model.isVisible ? false : true,
                          prefixIconData: Icons.lock_outline,
                          suffixIconData: model.isVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                  },
                  child: ButtonWidget(
                    title: 'Register',
                    hasBorder: true,
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
