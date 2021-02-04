import 'package:FinalOutput/global.dart';
import 'package:FinalOutput/model/login_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final IconData prefixIconData;
  final IconData suffixIconData;
  final bool obscureText;
  final Function onChanged;

  TextFieldWidget({
    this.hintText,
    this.prefixIconData,
    this.suffixIconData,
    this.obscureText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<LoginModel>(context);
    return TextFormField(
      onChanged: onChanged,
      obscureText: obscureText,
      cursorColor: Global.deepPurple,
      style: TextStyle(
        color: Global.deepPurple,
        fontSize: 14.0,
      ),
      decoration: InputDecoration(
        labelText: hintText,
        prefixIcon: Icon(
          prefixIconData,
          size: 18,
          color: Global.deepPurple,
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
        suffixIcon: GestureDetector(
          onTap: () {
            model.isVisible = !model.isVisible;
          },
          child: Icon(
            suffixIconData,
            size: 18,
            color: Global.deepPurple,
          ),
        ),
        labelStyle: TextStyle(color: Global.deepPurple),
        focusColor: Global.deepPurple,
      ),
    );
  }
}
