import 'package:FinalOutput/global.dart';
import 'package:FinalOutput/ui/forgot_password.dart';
import 'package:FinalOutput/ui/home_view.dart';
import 'package:FinalOutput/ui/signup_screen.dart';
import 'package:FinalOutput/ui/widgets/wave_widget.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void validate() {
    if (formKey.currentState.validate()) {
      Navigator.push(
          context, new MaterialPageRoute(builder: (context) => HomeView()));
    } else {
      print("Not Validated");
    }
  }

  String validatepass(value) {
    if (value.isEmpty) {
      return "Required";
    } else if (value.length < 8) {
      return "Should Be Atleast 8 Characters";
    } else if (value.length > 16) {
      return "Should Not Be More Than 15 Characters";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
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
                Text('Welcome',
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
            padding: EdgeInsets.all(30.0),
            child: Center(
              child: Form(
                // ignore: deprecated_member_use
                //autovalidate: true,
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(5),
                              child: Icon(
                                Icons.mail_outline,
                                color: Global.deepPurple,
                                size: 18,
                              ),
                            ),
                            filled: true,
                            enabledBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Global.deepPurple),
                            ),
                            labelText: "Email",
                            labelStyle: TextStyle(color: Global.deepPurple)),
                        validator: MultiValidator([
                          RequiredValidator(errorText: "Required"),
                          EmailValidator(errorText: "Not a Valid Email"),
                        ])),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(5),
                              child: Icon(
                                Icons.lock_outline,
                                color: Global.deepPurple,
                                size: 18,
                              ),
                            ),
                            filled: true,
                            enabledBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Global.deepPurple),
                            ),
                            labelText: "Password",
                            labelStyle: TextStyle(color: Global.deepPurple)),
                        validator: validatepass,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 250.0),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => ForgotPassword()));
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Global.deepPurple,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: SizedBox(
                          width: 300,
                          height: 50,
                          child: RaisedButton(
                              onPressed: validate,
                              child: Text('Login'),
                              color: Global.deepPurple,
                              textColor: Global.white),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30.0),
                      child: SizedBox(
                        width: 300,
                        height: 50,
                        child: RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => SignUpScreen()));
                            },
                            child: Text('Sign Up'),
                            color: Global.white,
                            textColor: Global.deepPurple),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
