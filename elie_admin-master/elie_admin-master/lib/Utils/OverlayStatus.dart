import 'package:elie_admin/Database/API.dart';
import 'package:flutter/material.dart';

class OverlayStatus extends StatefulWidget {
  OverlayStatus(this.statusText, this.orderId);
  final statusText;
  final orderId;

  @override
  _OverlayStatusState createState() => _OverlayStatusState();
}

class _OverlayStatusState extends State<OverlayStatus> {
  late final FocusNode _focusNode;
  TextEditingController controller = TextEditingController();
  late OverlayEntry _overlayEntry;

  final LayerLink _layerLink = LayerLink();

  List status = ['Canceled', 'Order Received', 'Shipped', 'Completed'];
  late String buttontext;

  OverlayEntry _createOverlayEntry(screenSize) {
    return OverlayEntry(
        builder: (context) => Positioned(
              top: 0,
              right: 10,
              width: 160,
              height: 50.0 * status.length,
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
                      itemCount: status.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(status[index]),
                          onTap: () {
                            buttontext = status[index];
                            _focusNode.unfocus();
                            print(widget.orderId);
                            API().updateOrderById(widget.orderId, 'status', buttontext);
                            API().updateOrderById(widget.orderId, 'completeDate', DateTime.now().toString());

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
    buttontext = widget.statusText.toString();
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
