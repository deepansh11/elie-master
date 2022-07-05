import 'package:auto_route/auto_route.dart';
import 'package:elie_web/Database/Locator.dart';
import 'package:elie_web/Database/Product.dart';
import 'package:elie_web/Utils/Constants.dart';
import 'package:elie_web/Utils/TextFieldWidget_BottomLine.dart';
import 'package:flutter/material.dart';

class OverlaySearch extends StatefulWidget {
  OverlaySearch(this.tap, this.focus);
  final FocusNode focus;

  final tap;
  @override
  _CountriesFieldState createState() => _CountriesFieldState();
}

class _CountriesFieldState extends State<OverlaySearch> {
  late final FocusNode _focusNode;
  TextEditingController controller = TextEditingController();
  late OverlayEntry _overlayEntry;

  final LayerLink _layerLink = LayerLink();
  List<Product> tempList = [];

  OverlayEntry _createOverlayEntry(screenSize) {
    return OverlayEntry(
        builder: (context) => Positioned(
              top: 0,
              right: 10,
              width: Responsive.responsiveNumber(265, 300, screenSize),
              height: 50.0 * (tempList.length),
              child: CompositedTransformFollower(
                link: this._layerLink,
                showWhenUnlinked: false,
                offset: Offset(0.0, 60.0),
                child: Material(
                  color: Color(0xff242424),
                  elevation: 4.0,
                  child: Container(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: controller.text.isEmpty ? 0 : tempList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(
                            tempList[index].productTitle,
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: Text('Rs ' + tempList[index].salePrice.toString(), style: TextStyle(color: Colors.white)),
                          onTap: () {
                            context.router.pushNamed('/ProductDescPage/${tempList[index].id}');
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
    _focusNode = widget.focus;
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        this._overlayEntry = this._createOverlayEntry(MediaQuery.of(context).size);
        Overlay.of(context)!.insert(this._overlayEntry);
      } else {
        widget.tap(false);
        this._overlayEntry.remove();
        tempList = [];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return CompositedTransformTarget(
      link: this._layerLink,
      child: isMobile(screenSize)
          ? buildSearchField()
          : TextFieldWidgetBottomLine(
              textColor: Colors.white,
              focus: this._focusNode,
              hintText: 'Search',
              controller: controller,
              onChange: (value) {
                tempList = [];
                for (Product item in getItSearchBar.listOfProducts) {
                  if (item.productTitle.toString().toLowerCase().contains(value.toString().toLowerCase())) {
                    tempList.add(item);
                  }
                }
                setState(() {});
              },
            ),
    );
  }

  Widget buildSearchField() {
    final color = highLcolor;

    return TextField(
      controller: controller,
      focusNode: this._focusNode,
      onChanged: (value) {
        tempList = [];
        for (Product item in getItSearchBar.listOfProducts) {
          if (item.productTitle.toString().toLowerCase().contains(value.toString().toLowerCase())) {
            tempList.add(item);
          }
        }
        setState(() {});
      },
      style: TextStyle(color: color),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        hintText: 'Search',
        hintStyle: TextStyle(color: color),
        prefixIcon: Icon(Icons.search, color: color),
        filled: true,
        fillColor: Colors.white12,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
      ),
    );
  }
}
