import 'package:elie_web/Utils/Constants.dart';
import 'package:flutter/material.dart';

class Review extends StatelessWidget {
  const Review({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      child: isMobile(screenSize)
          /////MOBILE      /////MOBILE      /////MOBILE      /////MOBILE      /////MOBILE      /////MOBILE      /////MOBILE
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 24, bottom: 4),
                      child: Container(
                        child: const Text(
                          'Customer Review',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 24, right: 20),
                      child: Container(
                        height: 40,
                        width: 40,
                        child: const Image(
                          image: AssetImage('images/star.png'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, right: 20),
                      child: Container(
                        child: Text(
                          '4.8',
                          style: TextStyle(
                            color: Color(0xec9b7a).withOpacity(1),
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24, top: 10),
                  child: Container(
                    child: const Text(
                      '5K Verified Reviews',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10, top: 5, bottom: 5),
                  child: Divider(color: Color(0x97f6bca3).withOpacity(0.7)),
                ),
                Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 24,
                              ),
                              child: Container(
                                child: Text(
                                  'Excellent',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xeb9571).withOpacity(1),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 24, top: 10, bottom: 10),
                              child: Container(
                                height: 19,
                                child: const Image(
                                  image: AssetImage('images/5star.png'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Container(
                                child: Text(
                                  '253',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xeb9571).withOpacity(1),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 24, right: 26, bottom: 6),
                              child: Container(
                                child: Text(
                                  'Good',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xeb9571).withOpacity(1),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 24, bottom: 10),
                              child: Container(
                                height: 19,
                                child: const Image(
                                  image: AssetImage('images/4star.png'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15, bottom: 6),
                              child: Container(
                                child: Text(
                                  '133',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xeb9571).withOpacity(1),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 24, bottom: 6),
                              child: Container(
                                child: Text(
                                  'Average',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xeb9571).withOpacity(1),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 31, bottom: 10),
                              child: Container(
                                height: 19,
                                child: const Image(
                                  image: AssetImage('images/3star.png'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15, bottom: 6),
                              child: Container(
                                child: Text(
                                  '56',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xeb9571).withOpacity(1),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 24, bottom: 6),
                              child: Container(
                                child: Text(
                                  'Poor',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xeb9571).withOpacity(1),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 55, bottom: 10),
                              child: Container(
                                height: 19,
                                child: const Image(
                                  image: AssetImage('images/2star.png'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15, bottom: 6),
                              child: Container(
                                child: Text(
                                  '13',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xeb9571).withOpacity(1),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 24, bottom: 6),
                              child: Container(
                                child: Text(
                                  'Worst',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xeb9571).withOpacity(1),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 47, bottom: 10),
                              child: Container(
                                height: 19,
                                child: const Image(
                                  image: AssetImage('images/1star.png'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 17, bottom: 6),
                              child: Container(
                                child: Text(
                                  '2',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xeb9571).withOpacity(1),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    VerticalDivider(
                      color: Colors.white,
                      thickness: 70,
                      width: 20,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 5),
                  child: Divider(color: Color(0x97f6bca3).withOpacity(0.7)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24, bottom: 10),
                  child: Container(
                    child: Text(
                      'Customer Reviews (350)',
                      style: TextStyle(
                        color: Color(0xeb9571).withOpacity(1),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 24, right: 5),
                              child: Container(
                                height: 20,
                                width: 20,
                                child: const Image(
                                  image: AssetImage('images/star.png'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Container(
                                height: 20,
                                width: 20,
                                child: const Image(
                                  image: AssetImage('images/star.png'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Container(
                                height: 20,
                                width: 20,
                                child: const Image(
                                  image: AssetImage('images/star.png'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Container(
                                height: 20,
                                width: 20,
                                child: const Image(
                                  image: AssetImage('images/star.png'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Container(
                                height: 20,
                                width: 20,
                                child: const Image(
                                  image: AssetImage('images/star.png'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24, top: 2),
                          child: Container(
                            child: Text(
                              'Excellent Customer Service',
                              style: TextStyle(
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                                color: Color(0xeb9571).withOpacity(1),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24, top: 10),
                          child: Container(
                            child: Text(
                              'Arohi Sharma | 18 Oct 2021',
                              style: TextStyle(
                                color: Color(0xeb9571).withOpacity(1),
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24, top: 5, right: 24),
                          child: Container(
                            child: const Text(
                              'A good place to rejuvenate yourself, good hygiene and a very nice environment to add to it. I came to the New Bel Road Branch. The feel is good as soon as you reach reception where Karthik greets with a smile. Overall a truly professional experience. ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 5),
                      child: Divider(color: Color(0x97f6bca3).withOpacity(0.7)),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 24, right: 5),
                              child: Container(
                                height: 20,
                                width: 20,
                                child: const Image(
                                  image: AssetImage('images/star.png'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Container(
                                height: 20,
                                width: 20,
                                child: const Image(
                                  image: AssetImage('images/star.png'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Container(
                                height: 20,
                                width: 20,
                                child: const Image(
                                  image: AssetImage('images/star.png'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Container(
                                height: 20,
                                width: 20,
                                child: const Image(
                                  image: AssetImage('images/star.png'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Container(
                                height: 20,
                                width: 20,
                                child: const Image(
                                  image: AssetImage('images/star.png'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24, top: 2),
                          child: Container(
                            child: Text(
                              'Just the sorta spa we were looking for',
                              style: TextStyle(
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                                color: Color(0xeb9571).withOpacity(1),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24, top: 10),
                          child: Container(
                            child: Text(
                              'Paree Navet | 10 Oct 2021',
                              style: TextStyle(
                                color: Color(0xefab90).withOpacity(1),
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24, top: 5, right: 24),
                          child: Container(
                            child: const Text(
                              'We have been in search of a spa to visit consistently for regular relaxation/massage sessions. Have tried a couple before but never felt the urge to go back twice. This place has great ambience, great hospitality and skilled staff. Overall we r satisfied clients and have become members of Meraki Spa. Keep up the good work team!! ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 5),
                      child: Divider(color: Color(0x97f6bca3).withOpacity(0.7)),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 24, right: 5),
                              child: Container(
                                height: 20,
                                width: 20,
                                child: const Image(
                                  image: AssetImage('images/star.png'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Container(
                                height: 20,
                                width: 20,
                                child: const Image(
                                  image: AssetImage('images/star.png'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Container(
                                height: 20,
                                width: 20,
                                child: const Image(
                                  image: AssetImage('images/star.png'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Container(
                                height: 20,
                                width: 20,
                                child: const Image(
                                  image: AssetImage('images/star.png'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Container(
                                height: 20,
                                width: 20,
                                child: const Image(
                                  image: AssetImage('images/star.png'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24, top: 2),
                          child: Container(
                            child: Text(
                              'Excellent Customer Service',
                              style: TextStyle(
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                                color: Color(0xeb9571).withOpacity(1),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24, top: 10),
                          child: Container(
                            child: Text(
                              'Arohi Sharma | 18 Oct 2021',
                              style: TextStyle(
                                color: Color(0xefab90).withOpacity(1),
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24, top: 5, right: 24),
                          child: Container(
                            child: const Text(
                              'A good place to rejuvenate yourself, good hygiene and a very nice environment to add to it. I came to the New Bel Road Branch. The feel is good as soon as you reach reception where Karthik greets with a smile. Overall a truly professional experience. ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 5),
                      child: Divider(color: Color(0x97f6bca3).withOpacity(0.7)),
                    ),
                  ],
                ),
              ],
            )
          //////WEB      //////WEB      //////WEB      //////WEB      //////WEB      //////WEB
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 24, top: 24, bottom: 24),
                      child: Container(
                        child: const Text(
                          'Customer Review',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 900,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 24, right: 20),
                      child: Container(
                        height: 40,
                        width: 40,
                        child: const Image(
                          image: AssetImage('images/star.png'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, right: 20),
                      child: Container(
                        child: Text(
                          '4.8',
                          style: TextStyle(
                            color: Color(0xec9b7a).withOpacity(1),
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24, top: 10),
                  child: Container(
                    child: const Text(
                      '5K Verified Reviews',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10, top: 5, bottom: 5),
                  child: Divider(color: Color(0x97f6bca3).withOpacity(0.7)),
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 24,
                              ),
                              child: Container(
                                child: Text(
                                  'Excellent',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xeb9571).withOpacity(1),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 24, top: 10, bottom: 10),
                              child: Container(
                                height: 19,
                                child: const Image(
                                  image: AssetImage('images/5star.png'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Container(
                                child: Text(
                                  '253',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xeb9571).withOpacity(1),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 24, right: 26, bottom: 6),
                              child: Container(
                                child: Text(
                                  'Good',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xeb9571).withOpacity(1),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 24, bottom: 10),
                              child: Container(
                                height: 19,
                                child: const Image(
                                  image: AssetImage('images/4star.png'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15, bottom: 6),
                              child: Container(
                                child: Text(
                                  '133',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xeb9571).withOpacity(1),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 24, bottom: 6),
                              child: Container(
                                child: Text(
                                  'Average',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xeb9571).withOpacity(1),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 31, bottom: 10),
                              child: Container(
                                height: 19,
                                child: const Image(
                                  image: AssetImage('images/3star.png'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15, bottom: 6),
                              child: Container(
                                child: Text(
                                  '56',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xeb9571).withOpacity(1),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 24, bottom: 6),
                              child: Container(
                                child: Text(
                                  'Poor',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xeb9571).withOpacity(1),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 55, bottom: 10),
                              child: Container(
                                height: 19,
                                child: const Image(
                                  image: AssetImage('images/2star.png'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15, bottom: 6),
                              child: Container(
                                child: Text(
                                  '13',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xeb9571).withOpacity(1),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 24, bottom: 6),
                              child: Container(
                                child: Text(
                                  'Worst',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xeb9571).withOpacity(1),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 47, bottom: 10),
                              child: Container(
                                height: 19,
                                child: const Image(
                                  image: AssetImage('images/1star.png'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 17, bottom: 6),
                              child: Container(
                                child: Text(
                                  '2',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xeb9571).withOpacity(1),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    VerticalDivider(
                      color: Colors.white,
                      thickness: 70,
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 24),
                          child: Container(
                            child: Text(
                              'Frequently asked questions?',
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xeb9571).withOpacity(1),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24, top: 10),
                          child: Container(
                            child: const Text(
                              'Is the service safe and hygienic?',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24, top: 10),
                          child: Container(
                            child: const Text(
                              'Where can I buy the products from?',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24, top: 10),
                          child: Container(
                            child: const Text(
                              'Would I have to provide any products?',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 5),
                  child: Divider(color: Color(0x97f6bca3).withOpacity(0.7)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24, bottom: 10),
                  child: Container(
                    child: Text(
                      'Customer Reviews (350)',
                      style: TextStyle(
                        color: Color(0xeb9571).withOpacity(1),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 24, right: 5),
                              child: Container(
                                height: 20,
                                width: 20,
                                child: const Image(
                                  image: AssetImage('images/star.png'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Container(
                                height: 20,
                                width: 20,
                                child: const Image(
                                  image: AssetImage('images/star.png'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Container(
                                height: 20,
                                width: 20,
                                child: const Image(
                                  image: AssetImage('images/star.png'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Container(
                                height: 20,
                                width: 20,
                                child: const Image(
                                  image: AssetImage('images/star.png'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Container(
                                height: 20,
                                width: 20,
                                child: const Image(
                                  image: AssetImage('images/star.png'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 2),
                              child: Container(
                                child: Text(
                                  'Excellent Customer Service',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic,
                                    color: Color(0xeb9571).withOpacity(1),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24, top: 10),
                          child: Container(
                            child: Text(
                              'Arohi Sharma | 18 Oct 2021',
                              style: TextStyle(
                                color: Color(0xeb9571).withOpacity(1),
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24, top: 5, right: 24),
                          child: Container(
                            child: const Text(
                              'A good place to rejuvenate yourself, good hygiene and a very nice environment to add to it. I came to the New Bel Road Branch. The feel is good as soon as you reach reception where Karthik greets with a smile. Overall a truly professional experience. ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 5),
                      child: Divider(color: Color(0x97f6bca3).withOpacity(0.7)),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 24, right: 5),
                              child: Container(
                                height: 20,
                                width: 20,
                                child: const Image(
                                  image: AssetImage('images/star.png'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Container(
                                height: 20,
                                width: 20,
                                child: const Image(
                                  image: AssetImage('images/star.png'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Container(
                                height: 20,
                                width: 20,
                                child: const Image(
                                  image: AssetImage('images/star.png'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Container(
                                height: 20,
                                width: 20,
                                child: const Image(
                                  image: AssetImage('images/star.png'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Container(
                                height: 20,
                                width: 20,
                                child: const Image(
                                  image: AssetImage('images/star.png'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 2),
                              child: Container(
                                child: Text(
                                  'Just the sorta spa we were looking for',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic,
                                    color: Color(0xeb9571).withOpacity(1),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24, top: 10),
                          child: Container(
                            child: Text(
                              'Paree Navet | 10 Oct 2021',
                              style: TextStyle(
                                color: Color(0xefab90).withOpacity(1),
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24, top: 5, right: 24),
                          child: Container(
                            child: const Text(
                              'We have been in search of a spa to visit consistently for regular relaxation/massage sessions. Have tried a couple before but never felt the urge to go back twice. This place has great ambience, great hospitality and skilled staff. Overall we r satisfied clients and have become members of Meraki Spa. Keep up the good work team!! ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 5),
                      child: Divider(color: Color(0x97f6bca3).withOpacity(0.7)),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 24, right: 5),
                              child: Container(
                                height: 20,
                                width: 20,
                                child: const Image(
                                  image: AssetImage('images/star.png'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Container(
                                height: 20,
                                width: 20,
                                child: const Image(
                                  image: AssetImage('images/star.png'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Container(
                                height: 20,
                                width: 20,
                                child: const Image(
                                  image: AssetImage('images/star.png'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Container(
                                height: 20,
                                width: 20,
                                child: const Image(
                                  image: AssetImage('images/star.png'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Container(
                                height: 20,
                                width: 20,
                                child: const Image(
                                  image: AssetImage('images/star.png'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 2),
                              child: Container(
                                child: Text(
                                  'Excellent Customer Service',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic,
                                    color: Color(0xeb9571).withOpacity(1),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24, top: 10),
                          child: Container(
                            child: Text(
                              'Arohi Sharma | 18 Oct 2021',
                              style: TextStyle(
                                color: Color(0xefab90).withOpacity(1),
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24, top: 5, right: 24),
                          child: Container(
                            child: const Text(
                              'A good place to rejuvenate yourself, good hygiene and a very nice environment to add to it. I came to the New Bel Road Branch. The feel is good as soon as you reach reception where Karthik greets with a smile. Overall a truly professional experience. ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 5),
                      child: Divider(color: Color(0x97f6bca3).withOpacity(0.7)),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
