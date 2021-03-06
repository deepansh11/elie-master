import 'dart:async';

import 'package:elie_admin/Database/API.dart';
import 'package:elie_admin/Database/Expert.dart';
import 'package:elie_admin/Database/Locator.dart';
import 'package:elie_admin/Database/Tracking.dart';
import 'package:elie_admin/Responsive%20Dashboard/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:map/map.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:latlng/latlng.dart';

class MapWidget extends StatefulWidget {
  MapWidget({
    Key? key,
    required this.expert,
    this.heightO,
    required this.dateTime,
  }) : super(key: key);
  Experts expert;
  final heightO;

  DateTime dateTime;
  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late LatLng center;
  var controller = MapController(location: LatLng(13.360501, 74.786369));
  var offline = false;
  bool _darkMode = false;
  var currentExpert = 0;
  DateTime dateTimeCurrent = DateTime.now();

  getLocationOfExpert() async {
    offline = false;
    markers = [];
    currentExpert = widget.expert.phone;
    dateTimeCurrent = widget.dateTime;

    print(widget.expert.phone.toString() + '  ' + widget.dateTime.toString());

    var value = await API().getExpertday_tracking(widget.expert.phone, widget.dateTime).onError((error, stackTrace) {
      markers = [];
      markers.add(LatLng(-29.26338, 79.0484603));
      center = LatLng(18.527169, 73.8333013);
      offline = true;

      controller = MapController(
        zoom: 3,
        location: center,
      );

      setState(() {});

      return LocationForTracking(0, 0);
    });

    markers.add(LatLng(
      double.parse(value.latitude.toString()),
      double.parse(value.longitude.toString()),
    ));

    center = LatLng(
      double.parse(value.latitude.toString()),
      double.parse(value.longitude.toString()),
    );

    controller = MapController(
      zoom: 10,
      location: center,
    );

    setState(() {});
  }

  List<LatLng> markers = [];

  var track = getItTrackingPageLocator;
  @override
  void initState() {
    super.initState();
    getLocationOfExpert();
  }

  Offset? _dragStart;
  double _scaleStart = 1.0;
  void _onScaleStart(ScaleStartDetails details) {
    _dragStart = details.focalPoint;
    _scaleStart = 1.0;
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    final scaleDiff = details.scale - _scaleStart;
    _scaleStart = details.scale;

    if (scaleDiff > 0) {
      controller.zoom += 0.02;
      setState(() {});
    } else if (scaleDiff < 0) {
      controller.zoom -= 0.02;
      setState(() {});
    } else {
      final now = details.focalPoint;
      final diff = now - _dragStart!;
      _dragStart = now;
      controller.drag(diff.dx, diff.dy);
      setState(() {});
    }
  }

  Widget _buildMarkerWidget(Offset pos, Color color) {
    return Positioned(
      left: pos.dx - 16,
      top: pos.dy - 16,
      width: 24,
      height: 24,
      child: Icon(Icons.location_on, color: color),
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    if (currentExpert != widget.expert.phone || dateTimeCurrent != widget.dateTime) {
      getLocationOfExpert();
    }
    var height = widget.heightO == null ? screenSize.height / 2.2 : widget.heightO;
    return markers.isEmpty
        ? Container(
            height: screenSize.height / 2.2,
            child: Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            ),
          )
        : Container(
            height: height,
            child: MapLayoutBuilder(
              controller: controller,
              builder: (context, transformer) {
                final markerPositions = markers.map(transformer.fromLatLngToXYCoords).toList();

                final markerWidgets = markerPositions.map(
                  (pos) => _buildMarkerWidget(pos, Colors.red),
                );

                final centerLocation =
                    Offset(transformer.constraints.biggest.width / 2, transformer.constraints.biggest.height / 2);

                final centerMarkerWidget = _buildMarkerWidget(centerLocation, Colors.purple);

                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onScaleStart: _onScaleStart,
                  onScaleUpdate: _onScaleUpdate,
                  onTapUp: (details) {
                    final location = transformer.fromXYCoordsToLatLng(details.localPosition);

                    final clicked = transformer.fromLatLngToXYCoords(location);

                    print('${location.longitude}, ${location.latitude}');
                    print('${clicked.dx}, ${clicked.dy}');
                    print('${details.localPosition.dx}, ${details.localPosition.dy}');
                  },
                  child: Listener(
                    behavior: HitTestBehavior.opaque,
                    onPointerSignal: (event) {
                      if (event is PointerScrollEvent) {
                        final delta = event.scrollDelta;

                        controller.zoom -= delta.dy / 1000.0;
                        setState(() {});
                      }
                    },
                    child: Stack(
                      children: [
                        Map(
                          controller: controller,
                          builder: (context, x, y, z) {
                            //Legal notice: This url is only used for demo and educational purposes. You need a license key for production use.

                            //Google Maps
                            final url =
                                'https://www.google.com/maps/vt/pb=!1m4!1m3!1i$z!2i$x!3i$y!2m3!1e0!2sm!3i420120488!3m7!2sen!5e1105!12m4!1e68!2m2!1sset!2sRoadmap!4e0!5m1!1e0!23i4111425';

                            final darkUrl =
                                'https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i$z!2i$x!3i$y!4i256!2m3!1e0!2sm!3i556279080!3m17!2sen-US!3sUS!5e18!12m4!1e68!2m2!1sset!2sRoadmap!12m3!1e37!2m1!1ssmartmaps!12m4!1e26!2m2!1sstyles!2zcC52Om9uLHMuZTpsfHAudjpvZmZ8cC5zOi0xMDAscy5lOmwudC5mfHAuczozNnxwLmM6I2ZmMDAwMDAwfHAubDo0MHxwLnY6b2ZmLHMuZTpsLnQuc3xwLnY6b2ZmfHAuYzojZmYwMDAwMDB8cC5sOjE2LHMuZTpsLml8cC52Om9mZixzLnQ6MXxzLmU6Zy5mfHAuYzojZmYwMDAwMDB8cC5sOjIwLHMudDoxfHMuZTpnLnN8cC5jOiNmZjAwMDAwMHxwLmw6MTd8cC53OjEuMixzLnQ6NXxzLmU6Z3xwLmM6I2ZmMDAwMDAwfHAubDoyMCxzLnQ6NXxzLmU6Zy5mfHAuYzojZmY0ZDYwNTkscy50OjV8cy5lOmcuc3xwLmM6I2ZmNGQ2MDU5LHMudDo4MnxzLmU6Zy5mfHAuYzojZmY0ZDYwNTkscy50OjJ8cy5lOmd8cC5sOjIxLHMudDoyfHMuZTpnLmZ8cC5jOiNmZjRkNjA1OSxzLnQ6MnxzLmU6Zy5zfHAuYzojZmY0ZDYwNTkscy50OjN8cy5lOmd8cC52Om9ufHAuYzojZmY3ZjhkODkscy50OjN8cy5lOmcuZnxwLmM6I2ZmN2Y4ZDg5LHMudDo0OXxzLmU6Zy5mfHAuYzojZmY3ZjhkODl8cC5sOjE3LHMudDo0OXxzLmU6Zy5zfHAuYzojZmY3ZjhkODl8cC5sOjI5fHAudzowLjIscy50OjUwfHMuZTpnfHAuYzojZmYwMDAwMDB8cC5sOjE4LHMudDo1MHxzLmU6Zy5mfHAuYzojZmY3ZjhkODkscy50OjUwfHMuZTpnLnN8cC5jOiNmZjdmOGQ4OSxzLnQ6NTF8cy5lOmd8cC5jOiNmZjAwMDAwMHxwLmw6MTYscy50OjUxfHMuZTpnLmZ8cC5jOiNmZjdmOGQ4OSxzLnQ6NTF8cy5lOmcuc3xwLmM6I2ZmN2Y4ZDg5LHMudDo0fHMuZTpnfHAuYzojZmYwMDAwMDB8cC5sOjE5LHMudDo2fHAuYzojZmYyYjM2Mzh8cC52Om9uLHMudDo2fHMuZTpnfHAuYzojZmYyYjM2Mzh8cC5sOjE3LHMudDo2fHMuZTpnLmZ8cC5jOiNmZjI0MjgyYixzLnQ6NnxzLmU6Zy5zfHAuYzojZmYyNDI4MmIscy50OjZ8cy5lOmx8cC52Om9mZixzLnQ6NnxzLmU6bC50fHAudjpvZmYscy50OjZ8cy5lOmwudC5mfHAudjpvZmYscy50OjZ8cy5lOmwudC5zfHAudjpvZmYscy50OjZ8cy5lOmwuaXxwLnY6b2Zm!4e0&key=AIzaSyAOqYYyBbtXQEtcHG7hwAwyCPQSYidG8yU&token=31440';
                            //Mapbox Streets
                            // final url =
                            //     'https://api.mapbox.com/styles/v1/mapbox/streets-v11/tiles/$z/$x/$y?access_token=YOUR_MAPBOX_ACCESS_TOKEN';

                            return CachedNetworkImage(
                              imageUrl: _darkMode ? darkUrl : url,
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                        ...markerWidgets,
                        Positioned(
                          child: Container(
                            decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(30),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                children: [
                                  offline
                                      ? Text(
                                          "${widget.expert.name} was OFFLINE on ${DateFormat('dd/MM/yyyy').format(widget.dateTime)}",
                                          style: TextStyle(color: Colors.white),
                                        )
                                      : Text(
                                          "Location of ${widget.expert.name} on ${DateFormat('dd/MM/yyyy').format(widget.dateTime)}",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                  Text(
                                    "At ${DateFormat('hh:mm').format(widget.dateTime)}",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          top: 0,
                          left: 0,
                        ),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  FloatingActionButton.small(
                                    onPressed: () {
                                      controller.zoom += 0.2;
                                    },
                                    backgroundColor: primaryColor,
                                    child: Icon(
                                      Icons.add_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  FloatingActionButton.small(
                                    backgroundColor: primaryColor,
                                    onPressed: () {
                                      controller.zoom -= 0.2;
                                    },
                                    child: Icon(
                                      Icons.remove_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                );
              },
            ),
          );
  }
}
