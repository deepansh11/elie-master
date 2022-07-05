import 'package:elie_admin/Database/Expert.dart';
import 'package:elie_admin/Database/Locator.dart';
import 'package:elie_admin/Responsive%20Dashboard/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_geocoding/google_geocoding.dart';

class TrackingExpertCard extends StatefulWidget {
  TrackingExpertCard({
    Key? key,
    required this.expert,
    required this.selected,
    this.isSelected,
    this.index,
  }) : super(key: key);

  Experts expert;
  Function selected;
  final index;
  final isSelected;

  @override
  State<TrackingExpertCard> createState() => _TrackingExpertCardState();
}

class _TrackingExpertCardState extends State<TrackingExpertCard> {
  var address;
  getAddress() async {
    var googleGeocoding = GoogleGeocoding("AIzaSyCvGUKYI3ZQ8viJ7I12_TmYdcH8RAZGMJ0");
    print(widget.expert.last_location['latitude']);
    if (widget.expert.last_location['latitude'] != '0') {
      var placemarks = await googleGeocoding.geocoding.getReverse(LatLon(
        double.parse(widget.expert.last_location['latitude']),
        double.parse(widget.expert.last_location['longitude']),
      ));

      address = placemarks?.results;
    }
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAddress();
    print(widget.index);
  }

  var color = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.selected(widget.index, widget.expert);
        getItTrackingPageLocator.setSelected(widget.selected);
      },
      child: Container(
        decoration: BoxDecoration(
          color: secondaryColor,
          border: Border.all(color: widget.isSelected ? primaryColor : Colors.transparent),
        ),
        margin: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(
                      'assets/avatar.jpg',
                    )),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Center(
                      child: Text(
                        widget.expert.name.toString(),
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Phone: ' + widget.expert.phone.toString(),
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    address != null
                        ? Flexible(
                            child: Text(
                              'Last Location: ' + (address![0].formattedAddress.toString() == '' ? '' : address![0].formattedAddress.toString()),
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          )
                        : Container(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        widget.expert.availability ?? false ? 'Available' : 'Unavailable',
                        style: TextStyle(
                          color: widget.expert.availability ?? false ? Colors.greenAccent : Colors.grey,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
