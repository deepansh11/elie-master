import 'package:elie_admin/Utils/Constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.title,
    this.ifsc = false,
    this.type,
    this.line = 1,
    this.mandate = false,
    this.visible = false,
    this.onSuffixPress,
    required this.cont,
  }) : super(key: key);

  final String title;

  final bool ifsc;
  final TextInputType? type;

  final int line;
  final bool mandate;

  final bool visible;

  final Function? onSuffixPress;

  final TextEditingController cont;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        validator: (value) {
          if ((value == null || value.isEmpty) && mandate == true) {
            return 'Please enter $title';
          }
          return null;
        },
        obscureText:
            type == TextInputType.visiblePassword && !visible ? true : false,
        maxLines: line,
        textCapitalization:
            ifsc ? TextCapitalization.characters : TextCapitalization.none,
        controller: cont,
        style: TextStyle(
          color: whiteSmoke.withOpacity(1),
        ),
        decoration: InputDecoration(
          // suffixIcon: onSuffixPress != null
          //     ? IconButton(
          //         icon: Icon(
          //           // Based on passwordVisible state choose the icon
          //           !visible ? Icons.visibility_off : Icons.visibility,
          //           color: whiteSmoke,
          //         ),
          //         onPressed: () =>
          //             onSuffixPress != null ? onSuffixPress!() : null)
          //     : null,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: whiteSmoke.withOpacity(1))),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: whiteSmoke.withOpacity(1)),
          ),
          labelText: title,
          labelStyle: TextStyle(
            fontSize: 18,
            color: whiteSmoke.withOpacity(1),
          ),
        ),
        keyboardType: type,
      ),
    );
  }
}
