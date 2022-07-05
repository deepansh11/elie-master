import 'package:elie_web/Utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({
    this.labelText,
    this.hintText,
    this.onPress,
    required this.controller,
    this.inputType,
    this.inputFormator,
    this.fill,
    this.fillColor,
    this.textColor,
    this.focusBorderColor,
    this.enableBorderColor,
  });
  final labelText;
  final hintText;
  final onPress;
  TextEditingController controller;
  final inputType;
  final inputFormator;
  final fill;
  final fillColor;
  final textColor;
  var focusBorderColor;
  var enableBorderColor;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return TextField(
      style: TextStyle(color: textColor, fontSize: Responsive.responsiveNumber(16.0, 22.0, screenSize)),
      textCapitalization: TextCapitalization.characters,
      cursorColor: highLcolor,
      //for accepting numbers only
      keyboardType: inputType,
      inputFormatters: inputFormator,

      //onTap
      onTap: onPress,

      controller: controller,
      decoration: InputDecoration(
        filled: fill,
        fillColor: fillColor,
        labelText: labelText,
        labelStyle: TextStyle(color: highLcolorLight, fontSize: Responsive.responsiveNumber(16.0, 19.0, screenSize)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: focusBorderColor != null ? focusBorderColor : highLcolorDark, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(7.0))),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: enableBorderColor != null ? enableBorderColor : highLcolorDark, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(7.0))),
        hintText: hintText,
        hintStyle: TextStyle(color: highLcolor, fontSize: Responsive.responsiveNumber(16.0, 19.0, screenSize)),
      ),
    );
  }
}
