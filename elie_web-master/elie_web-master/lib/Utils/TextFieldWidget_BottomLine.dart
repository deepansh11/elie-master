import 'package:elie_web/Utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidgetBottomLine extends StatelessWidget {
  TextFieldWidgetBottomLine({
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
    this.focus,
    this.mandatory = true,
    this.onChange,
  });
  final labelText;
  final hintText;
  final onPress;
  var mandatory;
  var focus;
  TextEditingController controller;
  final inputType;
  final inputFormator;
  final fill;
  final fillColor;
  final textColor;
  var focusBorderColor;
  var enableBorderColor;
  final onChange;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          if (mandatory) {
            return 'Please fill this field';
          }
          return null;
        }
        return null;
      },
      focusNode: focus,
      style: TextStyle(color: textColor, fontSize: Responsive.responsiveNumber(16.0, 22.0, screenSize)),
      textCapitalization: TextCapitalization.characters,
      cursorColor: highLcolor,
      //for accepting numbers only
      keyboardType: inputType,
      inputFormatters: inputFormator,
      onChanged: onChange,

      //onTap
      onTap: () {
        onPress();
        FocusManager.instance.primaryFocus?.unfocus();
      },

      controller: controller,
      decoration: InputDecoration(
        filled: fill,
        fillColor: fillColor,
        labelText: labelText,
        labelStyle: TextStyle(
            color: highLcolorLight, fontSize: Responsive.responsiveNumber(16.0, 21.0, screenSize), fontFamily: 'NT', fontWeight: FontWeight.normal),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: focusBorderColor != null ? focusBorderColor : highLcolorDark, width: 1.0),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: enableBorderColor != null ? enableBorderColor : highLcolorDark, width: 1.0),
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white54, fontSize: Responsive.responsiveNumber(16.0, 21.0, screenSize), fontFamily: 'NT'),
      ),
    );
  }
}
