import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'Constants.dart';

class TestimonialCarousel extends StatefulWidget {
  @override
  State<TestimonialCarousel> createState() => _TestimonialCarouselState();
}

class _TestimonialCarouselState extends State<TestimonialCarousel> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Container(
      child: Column(children: [
        Expanded(
          child: CarouselSlider(
            items: textList,
            carouselController: _controller,
            options: CarouselOptions(
                scrollDirection: Axis.horizontal,
                autoPlayInterval: Duration(seconds: 5),
                autoPlay: true,
                enlargeCenterPage: true,
                scrollPhysics: BouncingScrollPhysics(),
                aspectRatio: isMobile(screenSize) ? 1 : 2.5,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: textList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 4.0,
                height: 4.0,
                margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
                decoration: BoxDecoration(shape: BoxShape.circle, color: highLcolorLight.withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ]),
    );
  }
}

List<Widget> textList = [
  Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'Craft, Luxury, Prime Location',
        style: TextStyle(color: highLcolor, fontWeight: FontWeight.bold, fontSize: 25, fontFamily: 'NT'),
        textAlign: TextAlign.center,
      ),
      Text(
        "Essentially the salon is a move away from all things instant, and hipster. It's a return to quality and discipline in craft. We have a diverse team of individuals who have come together, each bringing something extraordinary to the jewel that is  Ellis.",
        style: TextStyle(color: Colors.white, letterSpacing: 1,  height: 1.4, fontSize: 17, fontFamily: 'NT'),
        textAlign: TextAlign.center,
      ),
    ],
  ),

];
