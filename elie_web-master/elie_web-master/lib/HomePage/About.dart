import 'package:elie_web/Database/API.dart';
import 'package:elie_web/Utils/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
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
                      Column(
                        children: [
                          Image.asset(
                            'images/mascot.jpg',
                            fit: BoxFit.cover,
                            height: MediaQuery.of(context).size.height * 0.2,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'DR. ELIE',
                            style: style,
                          ),
                          Text(
                            'ORGANICS',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              letterSpacing: 3,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text('ELIE', style: style),
                          Text('WORLD', style: style),
                        ],
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
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: 20,
              width: 20,
            )
          ],
        ),
      ),
    );
  }
}
