import 'package:elie_admin/Responsive%20Dashboard/constants.dart';
import 'package:flutter/material.dart';

class CustomTextFormFieldColumn extends StatelessWidget {
  CustomTextFormFieldColumn({
    Key? key,
    required this.title,
    required this.maxLine,
    required this.controller,
    this.onTap,
    this.focusNode,
    this.onChange,
    this.ob = false,
  }) : super(key: key);

  final title;
  final maxLine;
  final controller;
  final onTap;
  final onChange;
  final focusNode;
  var ob;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "$title",
            style: TextStyle(fontSize: 18),
          ),
        ),
        TextField(
          onChanged: (v) {
            onChange(v);
          },
          onTap: () {
            if (onTap != null) {
              onTap();
            }
          },
          focusNode: focusNode,
          controller: controller,
          maxLines: maxLine,
          autofocus: false,
          obscureText: ob,
          style: TextStyle(fontSize: 18.0, color: Colors.white),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: title,
            filled: true,
            fillColor: secondaryColor,
            contentPadding: const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
              borderRadius: BorderRadius.circular(4.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomTextFormFieldRow extends StatelessWidget {
  CustomTextFormFieldRow({
    Key? key,
    required this.title,
    required this.controller,
  }) : super(key: key);

  final title;
  final controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "$title",
              style: TextStyle(fontSize: 18),
            ),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              autofocus: false,
              style: TextStyle(fontSize: 15.0, color: Colors.white),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: title,
                filled: true,
                fillColor: secondaryColor,
                contentPadding: const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
