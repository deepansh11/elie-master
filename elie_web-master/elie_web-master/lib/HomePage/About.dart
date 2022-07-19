import 'package:cached_network_image/cached_network_image.dart';
import 'package:elie_web/Database/API.dart';
import 'package:elie_web/Utils/Constants.dart';
import 'package:elie_web/Utils/LandingCard.dart';
import 'package:elie_web/Utils/LandingPageTitle.dart';
import 'package:flutter/material.dart';

import '../Database/About.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late List<About> women;

  late List<About> men;

  late List<About> unisex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    men = [];
    women = [];
    unisex = [];
  }

  void _dataFill(List<About>? data) {
    if (data != null) {
      for (About d in data) {
        if (d.type == 'W') {
          women.add(d);
        }
        if (d.type == 'M') {
          men.add(d);
        }
        if (d.type == 'U') {
          unisex.add(d);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var style = TextStyle(color: highLcolor, fontFamily: 'NT', fontSize: 35);

    const data =
        ''' There’s an old adage about working smart, rather than working hard. It’s been tried and tested. 
It’s been proven to be effective. So, why then, do we insist on complicating our everyday skincare 
routines with cabinets full of products and long, drawn out skincare regimens?
Dr. Elie Organics is your expert skincare solution that minimises time and maximises efficacy. 
Created by Dr. Elie herself, our products are made with the highest quality ingredients, developed 
through extensive clinical research, and designed to ensure that maintaining everyday skincare 
doesn’t take all day.''';

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 1.3,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'images/background.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'images/elie-logo.png',
                        fit: BoxFit.contain,
                        height: MediaQuery.of(context).size.height * 0.3,
                      ),
                      Image.asset(
                        'images/logo.png',
                        fit: BoxFit.contain,
                        height: MediaQuery.of(context).size.height * 0.3,
                      ),
                    ],
                  ),
                ),
                Positioned.fill(
                  bottom: 0,
                  left: 5,
                  right: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Feel ',
                              style: style.copyWith(
                                color: Colors.white,
                                fontSize: 60,
                              ),
                            ),
                            TextSpan(
                              text: 'Loved',
                              style: style.copyWith(
                                fontFamily: 'QT',
                                color: Colors.white,
                                fontSize: 60,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        data,
                        style: style.copyWith(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.normal,
                          height: 1.2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Selfcare ',
                      style: style.copyWith(
                        color: Colors.black,
                        fontFamily: 'QT',
                        fontSize: 60,
                      ),
                    ),
                    TextSpan(
                      text: 'Essentials',
                      style: style.copyWith(
                        color: Colors.black,
                        fontSize: 60,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            FutureBuilder(
                future: API().getLanding(),
                builder: (context, AsyncSnapshot snapshot) {
                  List<About>? data = snapshot.data;

                  _dataFill(data);

                  return Column(
                    children: [
                      LandingPageTitle(
                        title: 'Women',
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for (About? d in women)
                            LandingPageCard(
                              data: d,
                            ),
                          CachedNetworkImage(
                            imageUrl: 'images/model.png',
                            fit: BoxFit.contain,
                            height: MediaQuery.of(context).size.height * 0.8,
                            progressIndicatorBuilder:
                                (context, url, progress) =>
                                    CircularProgressIndicator(
                              color: highLcolorDark,
                              value: progress.progress,
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      LandingPageTitle(title: 'Men'),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for (About? d in men)
                            LandingPageCard(
                              data: d,
                              shouldReplace: true,
                            ),
                          SizedBox(
                            width: 40,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      LandingPageTitle(title: 'Unisex'),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for (About? d in unisex)
                            LandingPageCard(
                              data: d,
                              isWidth: d?.id == 9,
                            )
                        ],
                      ),
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }
}
