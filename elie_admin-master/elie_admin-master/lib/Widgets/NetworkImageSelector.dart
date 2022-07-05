import 'dart:js' as js;

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class NetworkImageSelector extends StatefulWidget {
  NetworkImageSelector({Key? key, this.title, this.url, this.setImage});

  final title;
  final url;
  final setImage;
  var images;

  @override
  _NetworkImageSelectorState createState() => _NetworkImageSelectorState();
}

class _NetworkImageSelectorState extends State<NetworkImageSelector> {
  var viewBtn = true;
  var loading = true;
  getImage() async {
    viewBtn = (await Dio().get(widget.url)).data == false ? false : true;
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getImage();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                widget.title,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.image,
              );
              if (result != null) {
                widget.images = result.files.single;
                print(widget.setImage);
                widget.setImage(result.files.single);

                setState(() {});
              } else {
                // User canceled the picker
              }
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: Column(
                children: [
                  widget.images != null || widget.url.runtimeType == PlatformFile
                      ? Image.memory(
                          widget.url.runtimeType == PlatformFile ? widget.url.bytes : widget.images.bytes,
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        )
                      : Image.network(
                          widget.url,
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes != null
                                    ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                          errorBuilder: (a, b, c) {
                            viewBtn = false;

                            print(widget.url);
                            print(viewBtn);
                            return widget.images == null
                                ? Container(
                                    height: 40,
                                    width: 150,
                                    color: Colors.white,
                                    child: Center(
                                        child: Text(
                                      'Choose File',
                                      style: TextStyle(fontSize: 18, color: Colors.black),
                                    )),
                                  )
                                : Column(
                                    children: [
                                      Image.memory(
                                        widget.images.bytes,
                                        height: 150,
                                        width: 150,
                                        fit: BoxFit.cover,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  );
                          },
                        ),
                  viewBtn && widget.url.toString().isNotEmpty
                      ? SizedBox(
                          width: 150,
                          child: ElevatedButton(
                              onPressed: () {
                                js.context.callMethod('open', [widget.url.toString()]);
                              },
                              child: Text('View')),
                        )
                      : Container(),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
