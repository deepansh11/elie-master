import 'package:cached_network_image/cached_network_image.dart';
import 'package:elie_web/Database/About.dart';
import 'package:elie_web/Utils/Constants.dart';
import 'package:flutter/material.dart';

class LandingPageCard extends StatelessWidget {
  const LandingPageCard({
    Key? key,
    required this.data,
    this.shouldReplace = false,
    this.isWidth = false,
  }) : super(key: key);

  final About? data;
  final bool shouldReplace;
  final bool isWidth;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    var style = TextStyle(
      color: Colors.black,
      fontFamily: 'NT',
      fontSize: Responsive.responsiveNumber(18, 22, screenSize),
      fontWeight: FontWeight.bold,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: isMobile(screenSize)
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          mainAxisAlignment: isMobile(screenSize)
              ? MainAxisAlignment.center
              : MainAxisAlignment.spaceBetween,
          children: [
            isMobile(screenSize)
                ? CachedNetworkImage(
                    imageUrl: '$baseUrl/getLandingImageByID/${data?.id}',
                    progressIndicatorBuilder: (context, url, progress) =>
                        CircularProgressIndicator(
                      color: highLcolorDark,
                      value: progress.progress,
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    fit: BoxFit.contain,
                    height: 100,
                    width: 100,
                  )
                : CachedNetworkImage(
                    imageUrl: '$baseUrl/getLandingImageByID/${data?.id}',
                    progressIndicatorBuilder: (context, url, progress) =>
                        CircularProgressIndicator(
                      color: highLcolorDark,
                      value: progress.progress,
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    fit: BoxFit.cover,
                  ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: Responsive.responsiveNumber(200, 320, screenSize),
              width: 230,
              child: Column(
                crossAxisAlignment: isMobile(screenSize)
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                mainAxisAlignment: isMobile(screenSize)
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
                children: [
                  Text(
                    data?.title?.toString() ?? '',
                    style: style,
                    maxLines: 2,
                    textAlign: isMobile(screenSize)
                        ? TextAlign.center
                        : TextAlign.justify,
                  ),
                  SizedBox(
                    height: Responsive.responsiveNumber(10, 30, screenSize),
                  ),
                  Text(
                    data?.subTitle.toString() ?? '',
                    style: style.copyWith(
                        color: Colors.grey.shade800,
                        fontSize:
                            Responsive.responsiveNumber(16, 19, screenSize),
                        fontWeight: FontWeight.normal),
                    textAlign: isMobile(screenSize)
                        ? TextAlign.center
                        : TextAlign.justify,
                  ),
                  SizedBox(
                    height: Responsive.responsiveNumber(5, 20, screenSize),
                  ),
                  Text(
                    data?.description?.toString() ?? '',
                    style: style.copyWith(
                        color: Colors.grey.shade800,
                        fontSize:
                            Responsive.responsiveNumber(13, 15, screenSize),
                        fontWeight: FontWeight.normal,
                        height: 1.4),
                    textAlign: isMobile(screenSize)
                        ? TextAlign.center
                        : TextAlign.justify,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
