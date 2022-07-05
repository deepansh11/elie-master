import 'package:dio/dio.dart';
import 'package:elie_admin/Database/API.dart';
import 'package:elie_admin/Utils/Constants.dart';
import 'package:flutter/material.dart';

class OverlayExpert extends StatefulWidget {
  OverlayExpert(this.statusText, this.orderId, this.list);
  final statusText;
  final orderId;
  final list;

  @override
  _OverlayExpertState createState() => _OverlayExpertState();
}

class _OverlayExpertState extends State<OverlayExpert> {
  late final FocusNode _focusNode;
  TextEditingController controller = TextEditingController();
  late OverlayEntry _overlayEntry;

  final LayerLink _layerLink = LayerLink();

  late String buttontext;

  OverlayEntry _createOverlayEntry(screenSize) {
    return OverlayEntry(
        builder: (context) => Positioned(
              top: 0,
              right: 10,
              width: 240,
              height: 255,
              child: CompositedTransformFollower(
                link: this._layerLink,
                showWhenUnlinked: false,
                offset: Offset(-30.0, 40.0),
                child: Material(
                  color: Color(0xff242424),
                  elevation: 4.0,
                  child: Container(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: widget.list.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: Image.network(
                            '$baseURL/getExpertProfilePic/${widget.list[index].phone}',
                            errorBuilder: (context, error, stack) => Image.asset('assets/avatar.jpg'),
                          ),
                          title: Text(widget.list[index].name.toString()),
                          subtitle: Text(widget.list[index].phone.toString()),
                          onTap: () async {
                            buttontext = widget.list[index].name.toString();
                            _focusNode.unfocus();
                            print(widget.orderId);
                            await Dio()
                                .post('$baseURL/update_expert/${widget.orderId}', queryParameters: {'expertId': widget.list[index].phone});

                            setState(() {});
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

    buttontext = widget.statusText == null ? 'Not Assigned' : widget.statusText.name;
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        print(_focusNode);
        this._overlayEntry = this._createOverlayEntry(MediaQuery.of(context).size);
        Overlay.of(context)!.insert(this._overlayEntry);
      } else {
        this._overlayEntry.remove();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
        link: this._layerLink,
        child: SizedBox(
          height: 50,
          child: TextButton(
            focusNode: _focusNode,
            onPressed: () {
              _focusNode.requestFocus();
              print(_focusNode.hasFocus);
            },
            child: Text(buttontext),
          ),
        ));
  }
}
