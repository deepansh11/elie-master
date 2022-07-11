import 'package:auto_route/auto_route.dart';
import 'package:elie_web/Database/Locator.dart';
import 'package:elie_web/Utils/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HorizontalListView extends StatelessWidget {
  HorizontalListView({Key? key}) : super(key: key);

  final Map<String, String> content = {
    'Salon': 'assets/saloni.png',
    'Spa': 'assets/spai.png',
    'Tattoo': 'assets/ttt.png',
    'Products': 'assets/cosmetics.png',
    'Careers': 'assets/growth-career.png',
    // 'Education': 'edu.png',
    // 'Fitness': 'fit.png',
    // 'Events': 'calendar.png',
  };

  final Map<String, String> contentClick = {
    'Salon': '/LocationChoicePage',
    'Spa': '/LocationChoicePage',
    'Tattoo': '/Tattoo',
    'Products': '/product',
    'Careers': '/Career',
    'Education': '/Education',
    'Fitness': '/Fitness',
    'Events': '/Event',
    'Packages': '/Packages',
  };

  final Color backgroundColor = Color(0xFF141414);
  final Color iconColor = Color(0xFFebab8b);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: ScrollPhysics(),
        child: ListView.builder(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            String key = content.keys.elementAt(index);
            String path = contentClick.values.elementAt(index);
            String value = content[key]!;
            return GestureDetector(
              onTap: () {
                print(path);
                if (content.keys.elementAt(index) == 'Spa') {
                  getItCart.setSpa(true);
                } else if (content.keys.elementAt(index) == 'Salon') {
                  getItCart.setSpa(false);
                }
                context.router.pushNamed(path);
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: highLcolorDark)),
                      padding: const EdgeInsets.all(10),
                      child: Image.asset(
                        '$value',
                        width: 40,
                        height: 40,
                        color: iconColor,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      key,
                      style: TextStyle(color: iconColor),
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: content.keys.length,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
