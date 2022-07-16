import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:elie_web/Database/Packages.dart';
import 'package:elie_web/Utils/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Database/API.dart';
import '../Database/Enquiry.dart';
import '../Database/Locator.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.style, required this.productData})
      : super(key: key);

  final TextStyle style;
  final Packages productData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OutlinedButton(
          onPressed: () async {
            getItCart.setPackageId(productData.id);

            print(getItCart.packageId);

            print(getItCart.isPackage);

            SharedPreferences prefs = await SharedPreferences.getInstance();
            if (prefs.get("userPhone") != null) {
              var userName = prefs.get("userName");
              var userEmail = prefs.get("userEmail");
              var userPhone = prefs.get("userPhone");

              var parsedJson = Enquiry(
                  userName.toString(),
                  userEmail.toString(),
                  userPhone.toString(),
                  false,
                  false,
                  productData.id.toString(),
                  '',
                  '',
                  false,
                  productData.numberOfTherapists,
                  '');

              var sendData = await API().addEnquiry(parsedJson);

              print(jsonEncode(parsedJson));
              print(sendData);

              print('Enquiry page');
              context.router.pushNamed('/Enquiry');
            } else {
              context.router.pushNamed('/LoginPage');
            }
          },
          style: OutlinedButton.styleFrom(
            backgroundColor: Color(0xff141414),
            side: BorderSide(
              color: highLcolor,
              width: 1,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            primary: highLcolor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            child: Text(
              'Get In Touch',
              style: style.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        InkWell(
          hoverColor: Color(0xff141414),
          onTap: () {
            getItCart.isPackage = true;
            print('from service tab' + productData.id.toString());
            var p = '/PackagesDescPage/${productData.id}';
            getItCart.setPackageId(productData.id);
            getItPages.setCurrentPathANDTopColorOFF(p);
            context.router.pushNamed(p);
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.shade600,
                  width: 1,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 6,
              ),
              child: Text(
                'Explore More',
                style: style.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
