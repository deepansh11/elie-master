import 'dart:async';

// import 'dart:js' as jsWeb;

import 'package:elie_web/Anu/Footer.dart';
import 'package:elie_web/Utils/Constants.dart';
import 'package:elie_web/Utils/NavDrawer.dart';
import 'package:elie_web/Utils/TopBar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../Database/Locator.dart';

class TattooPage extends StatefulWidget {
  @override
  State<TattooPage> createState() => _TattooPageState();
}

class _TattooPageState extends State<TattooPage> {
  var loading = true;

  delayScreen() {
    if (getItOnce.tattoo == true) {
      loading = false;
    }
    Timer(Duration(seconds: 5), () {
      setState(() {
        loading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    delayScreen();
    getItOnce.tattoo = true;
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        endDrawer: NavigationDrawerWidget(context),
        body: AnimatedCrossFade(
          crossFadeState:
              loading ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: Duration(milliseconds: 1000),
          firstChild: SafeArea(
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                height: screenSize.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image.asset(
                        "assets/4.gif",
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Color(0xff141414),
                            side: BorderSide(
                              color: highLcolor,
                              width: 1,
                            ),
                            primary: highLcolor,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: isMobile(screenSize) ? 8 : 40,
                                vertical: 15),
                            child: Text(
                              'Skip...',
                              style: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  fontFamily: 'NT'),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              loading = false;
                            });
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            )),
          ),
          secondChild: Center(
            child: Container(
              height: screenSize.height,
              child: ListView(
                shrinkWrap: true,
                children: [
                  TopBar(),
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Text(
                      'Tattoo Services',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: highLcolor,
                        letterSpacing: 1,
                        fontFamily: 'NT',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: isMobile(screenSize) ? 5 : 20,
                  ),
                  isMobile(screenSize)
                      ? Container(
                          height: screenSize.height + 150,
                          width: screenSize.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Center(
                                  child: SizedBox(
                                    child: Image.asset(
                                      "assets/tattoo.png",
                                      width: screenSize.width,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(20),
                                child: Text(
                                  'It is your skin that tells the stories you ink on it. The past, present and future reflect right through them. Embracing these stories and your body brings out great value and that value is brought to life by the artist who inks it onto you.',
                                  textAlign: TextAlign.left,
                                  style:
                                      TextStyle(fontSize: 20, fontFamily: 'NT'),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                margin: EdgeInsets.all(20),
                                child: Text(
                                  '5-times award winner, Nia is committed to give you the best ever experience when you get inked. With 8 years of experience, she brings out the perfection of the unique designs she curates for her clients. The quality of art and hygiene standards he sets in, speak loud enough for themselves.',
                                  textAlign: TextAlign.left,
                                  style:
                                      TextStyle(fontSize: 20, fontFamily: 'NT'),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                margin: EdgeInsets.all(20),
                                child: Text(
                                  'S. NO 228, 1ST FLOOR,\nOpposite Fashion Street,\nnear BIBA Store, M.G.\nROAD, CAMP, pune, Camp,\nPUNE, Maharashtra Pune',
                                  textAlign: TextAlign.left,
                                  style:
                                      TextStyle(fontSize: 20, fontFamily: 'NT'),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: Text(
                                    'Go ahead, get your story inked today.',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 20, fontFamily: 'NT'),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    // jsWeb.context.callMethod('open', ['https://instagram.com/niatattoostudio?utm_medium=copy_link']);
                                  },
                                  child: Container(
                                    child: Image.asset(
                                      'assets/c4.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(20),
                                    child: Text(
                                      'It is your skin that tells the stories you ink on it. The past, present and future reflect right through them. Embracing these stories and your body brings out great value and that value is brought to life by the artist who inks it onto you.',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 20, fontFamily: 'NT'),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(20),
                                    child: Text(
                                      '5-times award winner, Nia is committed to give you the best ever experience when you get inked. With 8 years of experience, she brings out the perfection of the unique designs she curates for her clients. The quality of art and hygiene standards he sets in, speak loud enough for themselves.',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 20, fontFamily: 'NT'),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(20),
                                    child: Text(
                                      'S. NO 228, 1ST FLOOR,\nOpposite Fashion Street,\nnear BIBA Store, M.G.\nROAD, CAMP, pune, Camp,\nPUNE, Maharashtra Pune',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 20, fontFamily: 'NT'),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      child: Text(
                                        'Go ahead, get your story inked today.',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontSize: 20, fontFamily: 'NT'),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        // jsWeb.context.callMethod('open', ['https://instagram.com/niatattoostudio?utm_medium=copy_link']);
                                      },
                                      child: Container(
                                        child: Image.asset(
                                          'assets/c4.png',
                                          height: 35.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Center(
                                  child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Image.asset(
                                  "assets/tattoo.png",
                                  fit: BoxFit.fill,
                                ),
                              )),
                            )
                          ],
                        ),
                  SizedBox(
                    height: 10,
                  ),
                  isMobile(screenSize) ? Container() : Footer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
