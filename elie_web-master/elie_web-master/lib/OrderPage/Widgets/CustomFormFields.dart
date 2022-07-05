import 'package:elie_web/Utils/Constants.dart';
import 'package:flutter/material.dart';

class CustomTextFormFeildColumn extends StatelessWidget {
  CustomTextFormFeildColumn({
    required this.title,
    required this.maxLine,
    required this.controller,
  });

  final title;
  final maxLine;
  final controller;

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
          controller: controller,
          maxLines: maxLine,
          autofocus: false,
          style: TextStyle(fontSize: 18.0, color: Colors.white),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: title,
            filled: true,
            fillColor: highLcolor,
            contentPadding: const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: highLcolor),
              borderRadius: BorderRadius.circular(10.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomTextFormFeildRow extends StatelessWidget {
  CustomTextFormFeildRow({
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
                fillColor: highLcolor,
                contentPadding: const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: highLcolor),
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
