import 'package:elie_web/Utils/Constants.dart';
import 'package:flutter/material.dart';

import '../Anu/Footer.dart';
import '../Utils/NavDrawer.dart';
import '../Utils/TopBar.dart';

class Terms extends StatelessWidget {
  const Terms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        endDrawer: NavigationDrawerWidget(context),
        body: Center(
          child: Container(
            height: screenSize.height,
            child: ListView(
              shrinkWrap: true,
              children: [
                TopBar(),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Text(
                    'TERMS AND CONDITIONS',
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
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: Responsive.responsiveNumber(20.0, 200.0, screenSize), right: Responsive.responsiveNumber(20.0, 200.0, screenSize)),
                  child: Text(
                    ''' 
Please read the following terms and conditions very carefully as your use of service is subject to your acceptance of and compliance with the following terms and conditions.
By subscribing to or using any of our services you agree that you have read,understood and are bound by the Terms, regardless of how you subscribe to or use the services. If you do not want to be bound by the Terms, you must not subscribe to or use our services.
In these Terms, references to \"you\" &quot;User&quot; shall mean the end user accessing the website, its contents and using the Services offered through the Website \"Service Providers independent third party service providers, and \", \"us\" and \"our\" shall mean Wildflower Naturals franchisor, affiliates and partners.
                ''',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      letterSpacing: 1,
                      fontFamily: 'NT',
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'DESCRIPTION OF SERVICES',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: highLcolor,
                    letterSpacing: 1,
                    fontFamily: 'NT',
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'In the Site,',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        letterSpacing: 1,
                        fontFamily: 'NT',
                      ),
                      children: const <TextSpan>[
                        TextSpan(
                          text: 'www.elie.world ',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'NT',
                          ),
                        ),
                        TextSpan(
                          text: 'provides users with access to sales of Natural Body Care Products  "\Service\".',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            letterSpacing: 1,
                            fontFamily: 'NT',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'USER ACCOUNT, PASSWORD, AND SECURITY',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: highLcolor,
                    letterSpacing: 1,
                    fontFamily: 'NT',
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: Responsive.responsiveNumber(20.0, 200.0, screenSize), right: Responsive.responsiveNumber(20.0, 200.0, screenSize)),
                  child: Text(
                    ''' 
You will receive a password and account designation upon completing the Website&#39; registration process. You are responsible for maintaining the confidentiality of the password and account, and are fully responsible for all activities that occur under your password or account. You agree immediately notify www.elie.world of any unauthorized use of your password or account or any other breach of security, and (b) ensure that you exit from your account at the end of each session.
                ''',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      letterSpacing: 1,
                      fontFamily: 'NT',
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'EXACTNESS NOT GUARANTEED',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: highLcolor,
                    letterSpacing: 1,
                    fontFamily: 'NT',
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: Responsive.responsiveNumber(20.0, 200.0, screenSize), right: Responsive.responsiveNumber(20.0, 200.0, screenSize)),
                  child: Text(
                    ''' 
www.elie.world hereby disclaims any guarantees of exactness as to the finish and appearance of the final Product as ordered by the user. Color of the product may vary slightly since the photographs displayed are professional in nature with additional lighting effects.
                ''',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      letterSpacing: 1,
                      fontFamily: 'NT',
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'SHIPPING',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: highLcolor,
                    letterSpacing: 1,
                    fontFamily: 'NT',
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: Responsive.responsiveNumber(20.0, 200.0, screenSize), right: Responsive.responsiveNumber(20.0, 200.0, screenSize)),
                  child: Text(
                    ''' 
Title and risk of loss for all products ordered by you shall pass on to you upon www.elie.world shipment to the shipping carrier.
                ''',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      letterSpacing: 1,
                      fontFamily: 'NT',
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'CANCELLATION',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: highLcolor,
                    letterSpacing: 1,
                    fontFamily: 'NT',
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: Responsive.responsiveNumber(20.0, 200.0, screenSize), right: Responsive.responsiveNumber(20.0, 200.0, screenSize)),
                  child: Text(
                    ''' 
Please note that there may be certain orders that we are unable to accept and must cancel. We reserve the right, at our sole discretion to refuse or cancel any order for any reason. Some situations that may result in your order being cancelled shall include limitations on quantities available for purchase, inaccuracies or errors in product or pricing information, problems identified by our credit and fraud avoidance department or any defect regarding the quality of the product

We may also require additional verifications or information before accepting any order. We will contact you if all or any portion of your order is cancelled or if additional information is required to accept your order. If your order is cancelled after your credit card has been charged, the said amount will be reversed back in your Card Account
                ''',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      letterSpacing: 1,
                      fontFamily: 'NT',
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'DISCLAIMER',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: highLcolor,
                    letterSpacing: 1,
                    fontFamily: 'NT',
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: Responsive.responsiveNumber(20.0, 200.0, screenSize), right: Responsive.responsiveNumber(20.0, 200.0, screenSize)),
                  child: Text(
                    ''' 
www.elie.world does not warrant The accuracy, completeness currency of any information in this website and does not accept any responsibility for any direct or indirect loss, damage or expense incurred by you as a result of (a) any error,omission or misrepresentation in any information (including any data, prices,graphics, video and images) in this website or (b) any decision you make in reliance upon the information contained in this website.

The information contained in this website is provided in good faith and is illustrative only. Nothing in this website constitutes a warranty of the products or their in store price. You acknowledge that Dr.Elie Organic may amend, add or any information in this site at any time without notice. You may not copy or use any part of this website without the express written consent of www.elie.world

This website contains material which is owned by or licensed to us. This material includes, but is not limited to, the design, layout, look, appearance and graphics.Reproduction is prohibited other than in accordance with the copyright notice, which forms part of these terms and conditions.    

All trademarks reproduced in this website which are not the property of, or licensed to, the operator are acknowledged on the website.

Unauthorized use of this website may give rise to a claim for damages and/or be a criminal offence.

*This website is governed by the laws of INDIA and is subject to exclusive jurisdiction of the court and authorities at NEW DELHI (INDIA)*
 
          ''',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      letterSpacing: 1,
                      fontFamily: 'NT',
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                isMobile(screenSize) ? Container() : Footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
