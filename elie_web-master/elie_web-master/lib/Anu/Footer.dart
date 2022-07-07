import 'package:auto_route/auto_route.dart';
import 'package:elie_web/Utils/Constants.dart';
import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  var textButtoncolor = ButtonStyle(
    backgroundColor: MaterialStateProperty.resolveWith<Color?>(
      (states) {
        if (states.contains(MaterialState.hovered)) {
          return Color(0x1D1D1D).withOpacity(1);
        } else if (states.contains(MaterialState.pressed)) {
          return Color(0x212121).withOpacity(1);
        }
        return Colors.transparent;
      },
    ),
    foregroundColor:
        MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
      if (states.contains(MaterialState.hovered))
        return Color(0xeb9571).withOpacity(1);
      if (states.contains(MaterialState.pressed))
        return Color(0xeb9571).withOpacity(1);
      return Colors.white;
      // null throus error in flutter 2.2+.
    }),
  );

  var textStyleofsomething = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    letterSpacing: 1,
    fontFamily: 'NT',
    color: Color(0xeb9571).withOpacity(1),
  );
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Stack(
      children: [
        Positioned.fill(
            child: Image.asset(
          isMobile(screenSize) ? 'assets/foot2.jpg' : 'assets/foot.jpg',
          fit: BoxFit.fill,
        )),
        Container(
            color: Color(0x212121).withOpacity(0.9),
            height: Responsive.responsiveNumber(
                screenSize.height, screenSize.height / 1.7, screenSize),
            width: double.infinity,
            child: isMobile(screenSize)
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 18, horizontal: 7),
                                child: Container(
                                  child: Text('GET IN TOUCH',
                                      style: textStyleofsomething),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(7.0),
                                child: Text(
                                  'General Queries',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                    fontFamily: 'NTF',
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                              TextButton(
                                style: textButtoncolor,
                                onPressed: () {},
                                child: Text(
                                  'support@ellis.store',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 7.0, right: 7, top: 30, bottom: 7),
                                child: Text(
                                  'Business Queries',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                    fontFamily: 'NTF',
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                              TextButton(
                                style: textButtoncolor,
                                onPressed: () {},
                                child: Text('business@ellis.store'),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 14),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(7),
                                  child: Container(
                                    child: Text('USEFUL LINKS',
                                        style: textStyleofsomething),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextButton(
                                  style: textButtoncolor,
                                  onPressed: () {
                                    context.router.pushNamed("/About");
                                  },
                                  child: Text('About'),
                                ),
                                TextButton(
                                  style: textButtoncolor,
                                  onPressed: () {
                                    context.router.pushNamed("/Policy");
                                  },
                                  child: Text('Privacy Policy'),
                                ),
                                TextButton(
                                  style: textButtoncolor,
                                  onPressed: () {
                                    context.router.pushNamed("/Policy");
                                  },
                                  child: Text('Shipping Policy'),
                                ),
                                TextButton(
                                  style: textButtoncolor,
                                  onPressed: () {
                                    context.router.pushNamed("/Policy");
                                  },
                                  child: Text('Refund Policy'),
                                ),
                                TextButton(
                                  style: textButtoncolor,
                                  onPressed: () {
                                    context.router.pushNamed("/Terms");
                                  },
                                  child: Text('Terms Of Service'),
                                ),
                                TextButton(
                                  style: textButtoncolor,
                                  onPressed: () {
                                    context.router.pushNamed("/Career");
                                  },
                                  child: Text('Career'),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(top: 14, left: 2),
                          //   child: Column(
                          //     children: [
                          //       Padding(
                          //         padding: const EdgeInsets.all(7),
                          //         child: Container(
                          //           child: Text('NEWSLETTER SIGN UP', style: textStyleofsomething),
                          //         ),
                          //       ),
                          //       SizedBox(
                          //         height: 10,
                          //       ),
                          //       Padding(
                          //         padding: const EdgeInsets.only(left: 7.0),
                          //         child: Text(
                          //           'Subscribe to receive newsletters,\nupdates and offers.',
                          //           style: TextStyle(
                          //             fontSize: 13,
                          //             color: Colors.white,
                          //           ),
                          //         ),
                          //       ),
                          //       Padding(
                          //         padding: const EdgeInsets.only(left: 7.0, top: 20),
                          //         child: Text(
                          //           'Stay in touch with us!',
                          //           style: TextStyle(
                          //             fontSize: 13,
                          //             color: Colors.white,
                          //           ),
                          //         ),
                          //       ),
                          //       Padding(
                          //         padding: const EdgeInsets.only(left: 7.0, top: 20),
                          //         child: Column(
                          //           mainAxisAlignment: MainAxisAlignment.start,
                          //           children: [
                          //             Container(
                          //               height: 53,
                          //               width: 225,
                          //               child: TextField(
                          //                 style: TextStyle(
                          //                   color: Color(0xeb9571).withOpacity(1),
                          //                 ),
                          //                 decoration: InputDecoration(
                          //                   enabledBorder: UnderlineInputBorder(
                          //                     borderSide: BorderSide(color: Color(0xeb9571).withOpacity(1)),
                          //                   ),
                          //                   focusedBorder: UnderlineInputBorder(
                          //                     borderSide: BorderSide(color: Color(0xeb9571).withOpacity(1)),
                          //                   ),
                          //                   hintText: "Your email",
                          //                   hintStyle: TextStyle(fontSize: 14, color: Color(0xeea889).withOpacity(1)),
                          //                   labelStyle: TextStyle(
                          //                     fontSize: 14,
                          //                     color: Color(0xeb9571).withOpacity(1),
                          //                   ),
                          //                 ),
                          //                 keyboardType: TextInputType.emailAddress,
                          //               ),
                          //             ),
                          //             SizedBox(
                          //               width: 6,
                          //             ),
                          //             ElevatedButton(
                          //               style: ElevatedButton.styleFrom(
                          //                 shape: RoundedRectangleBorder(
                          //                   borderRadius: BorderRadius.circular(1),
                          //                 ),
                          //                 side: BorderSide(
                          //                   width: 2.0,
                          //                   color: Color(0xeb9571).withOpacity(1),
                          //                 ),
                          //                 primary: Color(0x212121).withOpacity(1),
                          //                 fixedSize: Size(120, 45),
                          //                 elevation: 3,
                          //               ),
                          //               onPressed: () {},
                          //               child: Text(
                          //                 'SUBSCRIBE',
                          //                 style: TextStyle(
                          //                   fontSize: 13,
                          //                   fontWeight: FontWeight.bold,
                          //                   color: Color(0xeb9571).withOpacity(1),
                          //                 ),
                          //               ),
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: Image.asset('images/google.png'),
                            iconSize: 130,
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Image.asset('images/apple1.png'),
                            iconSize: 130,
                            onPressed: () {},
                          )
                        ],
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 54, left: 24),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(7),
                                      child: Container(
                                        child: Text('GET IN TOUCH',
                                            style: textStyleofsomething),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(7.0),
                                      child: Text(
                                        'General Queries',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1,
                                          fontFamily: 'NT',
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      style: textButtoncolor,
                                      onPressed: () {},
                                      child: Text(
                                        'support@ellis.store',
                                        style: TextStyle(
                                          fontSize: 14,
                                          letterSpacing: 1,
                                          fontFamily: 'NT',
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 7.0,
                                          right: 7,
                                          top: 30,
                                          bottom: 7),
                                      child: Text(
                                        'Business Queries',
                                        style: TextStyle(
                                          fontSize: 14,
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'NT',
                                          color: Colors.white,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      style: textButtoncolor,
                                      onPressed: () {},
                                      child: Text(
                                        'business@ellis.store',
                                        style: TextStyle(
                                          fontSize: 14,
                                          letterSpacing: 1,
                                          fontFamily: 'NT',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 80,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 54),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(7),
                                      child: Container(
                                        child: Text('USEFUL LINKS',
                                            style: textStyleofsomething),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextButton(
                                      style: textButtoncolor,
                                      onPressed: () {
                                        context.router.pushNamed("/About");
                                      },
                                      child: Text(
                                        'About',
                                        style: TextStyle(
                                          fontSize: 14,
                                          letterSpacing: 1,
                                          fontFamily: 'NT',
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      style: textButtoncolor,
                                      onPressed: () {
                                        context.router.pushNamed("/Policy");
                                      },
                                      child: Text(
                                        'Privacy Policy',
                                        style: TextStyle(
                                          fontSize: 14,
                                          letterSpacing: 1,
                                          fontFamily: 'NT',
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      style: textButtoncolor,
                                      onPressed: () {
                                        context.router.pushNamed("/Policy");
                                      },
                                      child: Text(
                                        'Shipping Policy',
                                        style: TextStyle(
                                          fontSize: 14,
                                          letterSpacing: 1,
                                          fontFamily: 'NT',
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      style: textButtoncolor,
                                      onPressed: () {
                                        context.router.pushNamed("/Policy");
                                      },
                                      child: Text(
                                        'Refund Policy',
                                        style: TextStyle(
                                          fontSize: 14,
                                          letterSpacing: 1,
                                          fontFamily: 'NT',
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      style: textButtoncolor,
                                      onPressed: () {
                                        context.router.pushNamed("/Terms");
                                      },
                                      child: Text(
                                        'Terms Of Service',
                                        style: TextStyle(
                                          fontSize: 14,
                                          letterSpacing: 1,
                                          fontFamily: 'NT',
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      style: textButtoncolor,
                                      onPressed: () {
                                        context.router.pushNamed("/Career");
                                      },
                                      child: Text(
                                        'Career',
                                        style: TextStyle(
                                          fontSize: 14,
                                          letterSpacing: 1,
                                          fontFamily: 'NT',
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 80,
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.only(top: 54, left: 24),
                              //   child: Column(
                              //     crossAxisAlignment: CrossAxisAlignment.start,
                              //     children: [
                              //       Padding(
                              //         padding: const EdgeInsets.all(7),
                              //         child: Container(
                              //           child: Text('NEWSLETTER SIGN UP', style: textStyleofsomething),
                              //         ),
                              //       ),
                              //       SizedBox(
                              //         height: 20,
                              //       ),
                              //       Padding(
                              //         padding: const EdgeInsets.only(left: 7.0),
                              //         child: Text(
                              //           'Subscribe to receive newsletters,\nupdates and offers.',
                              //           style: TextStyle(
                              //             fontSize: 16,
                              //             letterSpacing: 1,
                              //             fontFamily: 'NT',
                              //             color: Colors.white,
                              //           ),
                              //         ),
                              //       ),
                              //       Padding(
                              //         padding: const EdgeInsets.only(left: 7.0, top: 20),
                              //         child: Text(
                              //           'Stay in touch with us!',
                              //           style: TextStyle(
                              //             fontSize: 16,
                              //             letterSpacing: 1,
                              //             fontFamily: 'NT',
                              //             color: Colors.white,
                              //           ),
                              //         ),
                              //       ),
                              //       Padding(
                              //         padding: const EdgeInsets.only(left: 7.0, top: 20),
                              //         child: Row(
                              //           mainAxisAlignment: MainAxisAlignment.start,
                              //           children: [
                              //             Container(
                              //               height: 53,
                              //               width: 225,
                              //               child: TextField(
                              //                 style: TextStyle(
                              //                   color: Color(0xeb9571).withOpacity(1),
                              //                 ),
                              //                 decoration: InputDecoration(
                              //                   enabledBorder: UnderlineInputBorder(
                              //                     borderSide: BorderSide(color: Color(0xeb9571).withOpacity(1)),
                              //                   ),
                              //                   focusedBorder: UnderlineInputBorder(
                              //                     borderSide: BorderSide(color: Color(0xeb9571).withOpacity(1)),
                              //                   ),
                              //                   hintText: "Your email",
                              //                   hintStyle: TextStyle(
                              //                       fontSize: 16, letterSpacing: 1, fontFamily: 'NT', color: Color(0xeea889).withOpacity(1)),
                              //                   labelStyle: TextStyle(
                              //                     fontSize: 14,
                              //                     color: Color(0xeb9571).withOpacity(1),
                              //                   ),
                              //                 ),
                              //                 keyboardType: TextInputType.emailAddress,
                              //               ),
                              //             ),
                              //             SizedBox(
                              //               width: 20,
                              //             ),
                              //             ElevatedButton(
                              //               style: ElevatedButton.styleFrom(
                              //                 shape: RoundedRectangleBorder(
                              //                   borderRadius: BorderRadius.circular(1),
                              //                 ),
                              //                 side: BorderSide(
                              //                   width: 2.0,
                              //                   color: Color(0xeb9571).withOpacity(1),
                              //                 ),
                              //                 primary: Color(0x212121).withOpacity(1),
                              //                 fixedSize: Size(120, 45),
                              //                 elevation: 3,
                              //               ),
                              //               onPressed: () {},
                              //               child: Text(
                              //                 'SUBSCRIBE',
                              //                 style: TextStyle(
                              //                   fontSize: 15,
                              //                   letterSpacing: 1,
                              //                   fontFamily: 'NT',
                              //                   fontWeight: FontWeight.bold,
                              //                   color: Color(0xeb9571).withOpacity(1),
                              //                 ),
                              //               ),
                              //             ),
                              //           ],
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                            ],
                          ),
                          Image.asset(
                            'images/footers.png',
                            height: 120,
                          ),
                        ],
                      ),
                    ],
                  )),
      ],
    );
  }
}
