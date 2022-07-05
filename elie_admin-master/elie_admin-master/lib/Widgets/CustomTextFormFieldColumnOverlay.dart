import 'package:elie_admin/Database/Expert.dart';
import 'package:elie_admin/Database/Locator.dart';
import 'package:elie_admin/Database/Service.dart';
import 'package:elie_admin/Screen/Widgets/CustomFormFields.dart';
import 'package:flutter/material.dart';

class CustomTextFormFieldColumnOverlay extends StatefulWidget {
  CustomTextFormFieldColumnOverlay({
    required this.title,
    required this.controller,
    required this.maxLine,
    this.onTap,
    required this.items,
    this.height,
  });
  final title;
  final controller;
  final maxLine;
  final onTap;

  final List items;
  final height;
  @override
  _CustomTextFormFieldColumnOverlayState createState() => _CustomTextFormFieldColumnOverlayState();
}

class _CustomTextFormFieldColumnOverlayState extends State<CustomTextFormFieldColumnOverlay> {
  late final FocusNode focusNode;
  TextEditingController controller = TextEditingController();
  late OverlayEntry _overlayEntry;
  var filteredHeight;
  final LayerLink _layerLink = LayerLink();
  late List items;
  var itemId;
  late String buttonText;
  GlobalKey keyTextField = GlobalKey();
  var size;

  OverlayEntry _createOverlayEntry(screenSize) {
    print(widget.items.runtimeType);
    return OverlayEntry(
        builder: (context) => Positioned(
              bottom: 0.0,
              right: 0.0,
              width: size,
              height: filteredHeight ?? widget.height ?? 150,
              child: CompositedTransformFollower(
                link: this._layerLink,
                showWhenUnlinked: false,
                offset: Offset(0.0, 90.0),
                child: Material(
                  color: Color(0xff242424),
                  elevation: 4.0,
                  child: Container(
                    width: size,
                    child: ListView.builder(
                      controller: ScrollController(),
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: (items[index] is List<dynamic>) ? Text(items[index][0]) : Text(items[index]),
                          onTap: () {
                            if (widget.items is List<List<dynamic>>) {
                              //expert&service
                              widget.onTap(items[index][0], items[index][1]);
                              widget.controller.text = items[index][0];
                            } else {
                              //normal
                              widget.onTap(items[index]);
                              widget.controller.text = items[index];
                            }

                            focusNode.unfocus();
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ));
  }

  @override
  void initState() {
    super.initState();
    itemId = null;
    items = [];

    focusNode = FocusNode();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        print(focusNode);
        this._overlayEntry = this._createOverlayEntry(MediaQuery.of(context).size);
        Overlay.of(context)!.insert(this._overlayEntry);
      } else {
        this._overlayEntry.remove();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    items = widget.items;
    return CompositedTransformTarget(
        link: this._layerLink,
        child: LayoutBuilder(
          builder: (c, cc) {
            size = cc.maxWidth;
            return CustomTextFormFieldColumn(
              key: keyTextField,
              focusNode: focusNode,
              controller: widget.controller,
              maxLine: widget.maxLine,
              title: widget.title,
              onChange: (v) {
                items = [];
                if (v.isEmpty) {
                  filteredHeight = null;
                  items = widget.items;
                } else {
                  items = [];
                  print(widget.items);
                  if (widget.items is List<List<dynamic>>) {
                    for (var d in widget.items) {
                      if (d[0].toString().toLowerCase().contains(v.toString().toLowerCase())) {
                        items.add(d);
                      }
                    }
                  } else {
                    for (var d in widget.items) {
                      if (d.toString().toLowerCase().contains(v.toString().toLowerCase())) {
                        items.add(d);
                      }
                    }
                  }

                  filteredHeight = (items.length * 50) > 170 ? 170 : items.length * 50;
                }
                setState(() {});
              },
            );
          },
        ));
  }
}
