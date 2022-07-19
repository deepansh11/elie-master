import 'package:cached_network_image/cached_network_image.dart';
import 'package:elie_web/Database/About.dart';
import 'package:elie_web/Utils/Constants.dart';
import 'package:flutter/material.dart';

class LandingPageCard extends StatelessWidget {
  const LandingPageCard({Key? key, required this.data}) : super(key: key);

  final About? data;

  @override
  Widget build(BuildContext context) {
    var style = TextStyle(
      color: Colors.black,
      fontFamily: 'NT',
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            CachedNetworkImage(
              imageUrl: '$baseUrl/getLandingImageByID/${data?.id}',
              progressIndicatorBuilder: (context, url, progress) =>
                  CircularProgressIndicator(
                color: highLcolorDark,
                value: progress.progress,
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width * 0.1,
              fit: BoxFit.contain,
            ),
            Text(
              data?.title?.replaceAll(' ', '\n').toString() ?? '',
              style: style,
              maxLines: 2,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              data?.subTitle.toString() ?? '',
              style: style.copyWith(
                color: Colors.grey.shade600,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: data?.subTitle != null ? 20 : 0,
            ),
            Text(
              data?.description.toString() ?? '',
              style: style.copyWith(
                color: Colors.grey.shade600,
                fontSize: 12,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
