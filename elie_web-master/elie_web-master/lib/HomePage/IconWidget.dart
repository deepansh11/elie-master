import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:elie_web/Utils/Constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../Anu/Address/SavedAddress.dart';
import '../Database/Locator.dart';
import '../DateNightTime/lib/constants.dart';
import '../DateNightTime/lib/daynight_timepicker.dart';
import '../Services/GetLocation.dart';
import '../Utils/TextFieldWidget.dart';

class IconWidget extends StatefulWidget {
  IconWidget({Key? key, required this.items, required this.iconPath, this.link, required this.focusNode}) : super(key: key);
  final items;
  final iconPath;
  final link;
  FocusNode focusNode;

  @override
  _IconWidgetState createState() => _IconWidgetState();
}

class _IconWidgetState extends State<IconWidget> {
  var width = 110.0;
  bool hover = false;
  OverlayEntry? entry;
  late LayerLink layerLink;
  List itemList = [];
  var locResponse;
  late DateTime date;
  var time = '';

  //controllers
  TextEditingController cityTextFeild = TextEditingController();
  TextEditingController stateTextFeild = TextEditingController();
  TextEditingController landmarkTextFeild = TextEditingController();
  TextEditingController houseNumberTextFeild = TextEditingController();
  TextEditingController postalTextFeild = TextEditingController();
  final RoundedLoadingButtonController btController = RoundedLoadingButtonController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    itemList = widget.items;
    layerLink = widget.link;
    widget.focusNode.addListener(() {
      if (widget.focusNode.hasFocus) {
        showOverlay();
        setState(() {});
      } else {
        hover = false;
        entry!.remove();
        setState(() {});
      }
      width = hover ? 250 : 110;
    });
  }

  showOverlay() {
    final overlay = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    print(size.width);
    var screenSize = MediaQuery.of(context).size;

    List<Widget> items = itemList
        .map((e) => ListTile(
              onTap: () async {
                if (itemList.toString().contains('Salon')) {
                  getItCart.setSpa(false);
                } else if (itemList.toString().contains('Spa')) {
                  getItCart.setSpa(true);
                }
                if (e == 'At Salon' || e == 'At Spa') {
                  context.router.pushNamed('/LocationPage');
                  FocusScope.of(context).unfocus();
                } else {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  if (prefs.get("userPhone") != null) {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              contentPadding: EdgeInsets.all(0),
                              backgroundColor: Colors.transparent,
                              content: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    child: Icon(Icons.close),
                                    onTap: () => Navigator.pop(context),
                                  ),
                                  Container(
                                      decoration: BoxDecoration(
                                        gradient: kGradiantBackground,
                                      ),
                                      child: SavedAddress(prefs, screenSize, true),
                                      height: screenSize.height / 1.15,
                                      width: screenSize.width / 1),
                                ],
                              ),
                            ));
                    FocusScope.of(context).unfocus();
                  } else {
                    context.router.pushNamed('/LoginPage');
                  }
                }
              },
              title: Center(
                child: Text(
                  e,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ))
        .toList();

    entry = OverlayEntry(
      builder: (context) {
        print(items.length);
        print(layerLink.leaderSize?.width);
        var screenSize = MediaQuery.of(context).size;
        return Positioned(
          height: items.length * 60,
          width: Responsive.responsiveNumber(MediaQuery.of(context).size.width - 16, MediaQuery.of(context).size.width / 2, screenSize),
          child: CompositedTransformFollower(
            link: layerLink,
            showWhenUnlinked: false,
            offset: Offset(Responsive.responsiveNumber(0.0, 200.0, screenSize), size.height.toDouble()),
            child: Material(
              color: Colors.transparent,
              child: Container(
                width: 300,
                height: items.length * 50,
                decoration: BoxDecoration(
                  color: Color(0xff141414),
                  border: Border.all(color: highLcolorDark),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: items,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );

    overlay?.insert(entry!);
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return InkWell(
      focusNode: widget.focusNode,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        hover = !hover;
        if (hover) {
          widget.focusNode.requestFocus();
        } else {
          FocusScope.of(context).unfocus();
        }
        width = hover ? 250 : 110;
        setState(() {});
      },
      child: AnimatedContainer(
        width: isMobile(screenSize) ? 110 : width,
        height: 110,
        decoration: BoxDecoration(
            color: Color(0xff141414),
            borderRadius: BorderRadius.all(
              Radius.circular(100),
            )),
        duration: Duration(milliseconds: 150),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Image.asset(
            widget.iconPath,
            height: 50,
            width: 50,
            color: highLcolor,
          ),
        ),
      ),
    );
  }

  TextStyle chooseAddMain() => TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
  TextStyle chooseAddValue() => TextStyle(
        color: Colors.white,
      );
}
