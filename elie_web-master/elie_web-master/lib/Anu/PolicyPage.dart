import 'package:flutter/material.dart';

import '../Anu/Footer.dart';
import '../Utils/Constants.dart';
import '../Utils/NavDrawer.dart';
import '../Utils/TopBar.dart';

class PolicyPage extends StatelessWidget {
  const PolicyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        endDrawer: NavigationDrawerWidget(context),
        backgroundColor: Colors.black,
        body: Center(
          child: Container(
            height: screenSize.height,
            child: ListView(
              shrinkWrap: true,
              children: [
                TopBar(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 25,
                  ),
                  child: Text(
                    'Privacy Policy',
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
This privacy policy ("Policy") applies to the Web site located at www.outhere.in (the "Site") owned and operated by Abacus Software Service Pvt Ltd. ("Abacus" "we" or "us") and the Out Hereservice accessed through our mobile application (the "service" or "app").  The Abacus Site and app are owned and operated by Abacus Software Service Pvt Ltd. located at G7 Shrikant Chambers ,Next to R K Studio , Chembur ,Mumbai , India 400071

Overview :
We do not share your Personal Information , We do not Store / Share your Locational Information. 
Communication of Location Data is Stateless , it does not get stored on any server.
We will never post anything on your social media networks
You should only share your location with people you know and trust not to convey your location to others
 
We do not store historical data hence we won’t be able to help law enforcement agencies .We may disclose only personal information or usage data when we are required to comply with the law (e.g. a lawful subpoena, warrant or court order)
The Policy is designed to tell you how we collect and use personal information (as defined below) so you can make an informed decision about using our Site and the Out Here service. Please read this statement before submitting any personal information to us. By using our Site and service, you represent that you:

- you are using our app for lawful purposes,
- and you consent to the information collection, use and retention practices described in this Policy.             ''',
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
                  'Required Permissions and Why?',
                  style: TextStyle(
                    fontSize: 28,
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
Camera 
-To capture profile image only 
 
Contacts 
-To send location access requests only
 
Location 
-We only capture your location when someone requests your location or when you locate someone only. 
-We do not take your location information any other time.
 
SMS 
-To verify mobile number
-To transmit location data if device is offline 
 
Storage 
-To access images for profile image only
-Telephone
-To make calls only ''',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      letterSpacing: 1,
                      fontFamily: 'NT',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'What is personal information?',
                  style: TextStyle(
                    fontSize: 28,
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
As used herein, the term "personal information" means information that identifies an individual, or from which an individual could be identified (such as a name, address, telephone number, mobile number, e-mail address, credit card number or other account number), and information about that individual's location or activities, such as information about his or her use of the Out Hereservice, when linked to personally identifiable information. Personal information also includes demographic information such as date of birth, gender, geographic area and preferences when such information is linked to other personal information that identifies you. Personal information does not include "aggregate" information, which is data we collect about the use of the Site or service or categories of Site and service users, from which any personal information has been removed. For example, information that forty-seven percent of the Site's registered users identify themselves as male, is aggregate information. We collect aggregate data for a number of purposes, including to help us understand trends and user needs so that we can better consider new publications, products and services, and tailor existing publications, products and services to user desires. This Policy in no way limits or restricts our collection of aggregate information.                ''',
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
                  'What personal information do we collect?',
                  style: TextStyle(
                    fontSize: 28,
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
Personal information may be collected in a number of ways when you use the various services and activities available through the Out Here App and Site. At several places on our Site or within our mobile application, we may collect certain information you voluntarily provide to us which may contain personal information. When you use our app, you have the option to provide us with a username and profile picture, which will be sent along with any "Out Here" you send. If you register for the mobile application or service, send us an email, or submit content, we may collect your name, photo, demographic information that you provide. In addition, from time to time we may collect contact or other personal or demographic information you provide in connection with your participation in surveys or promotional offers.
 
 
 
We will never post to any social network or contact anyone on your behalf without your permission.  We may provide the option of connecting to the Out Here service through Facebook, Twitter, Google+ or other social network as a faster, easier way for you to create a profile on the Out Here service. 

When turned on and with an active Out Here, the Out Here app will automatically collect location information from your mobile device and/or your mobile carrier. 

We treat the information collected in conjunction with the app as personal information if we combine it with or link it to any of the identifying information mentioned above.

Once a location request is sent to your device, your location info (i.e. Latitude, Longitude) along with your battery status is shared with only the allowed contact who has made the request. This data is Stateless, i.e we don’t store this information on our servers. 

If you no longer wish to allow this, you may discontinue the use of the service or disallow a particular contact to access your location.

If you wish to not share your location information for a particular amount time, you can activate the ‘Hibernate’ mode , the allowed contacts would find you ‘offline’ if they request your location.   ''',
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
                  'Behavioral Advertising / Re-Targeting',
                  style: TextStyle(
                    fontSize: 28,
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
We may partner with a third party to either display advertising on our Web site or within our apps or to manage advertising on other sites or within other apps.  Our third party partner may use technologies such as cookies to gather information about your activities on this site or within our app and on other sites or within other apps in order to provide you advertising based upon your browsing activities and interests.    ''',
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
                  'Mobile Analytics',
                  style: TextStyle(
                    fontSize: 28,
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
We use mobile analytics software to allow us to better understand the functionality of our Mobile Software on your phone. This software may record information such as how often you use the application, the events that occur within the application, aggregated usage, performance data, and from where the application was downloaded. We do not link the information we store within the analytics software to any personally identifiable information you submit within the mobile application.   ''',
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
                  'Push Notifications',
                  style: TextStyle(
                    fontSize: 28,
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
We may send you push notifications from time-to-time for location requests and to update you about any updates, events or promotions that we may be running. To ensure you receive proper notifications, we will need to collect certain information about your device such as operating system and user identification information.   ''',
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
                  'Usage and Disclosure',
                  style: TextStyle(
                    fontSize: 28,
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
In general, we use personal information we may collect (such as your name, location or social network information) to facilitate your use of the mobile application and Out Here service, to provide you with information, products and services you request, to administer and assist us with the operation of the Site, our app, and for any other purpose for which the information was provided. For example, we may use the information we collect:

-      to respond to your emails, submissions, comments, requests or complaints;
-      to ensure that the application is working correctly and that you are being served the most recent version;
-      to allow other users of the service that you designate to temporarily view your whereabouts in real-time;
-      to request feedback and to enable us to develop, customize and improve the app; and
-      for the specific purpose for which the information was provided.

In addition, if you so indicate in the event of sharing your contact information with us, we may use the information we collect to send you news and product and service updates, including contacting you about our services, products, activities, special events or offers and for other marketing, informational, product development and promotional purposes, including notifications about new features and or improvements to the Site or our products and services;

We may also receive information from third parties with whom we have business relationships, and may combine this information with the other personal information we have about you. In such cases, this Policy governs our use and disclosure of such information.
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
                  'What personal information do we share with third parties?',
                  style: TextStyle(
                    fontSize: 28,
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
We do not sell, share, or rent any personal information to third parties in any ways different from what is disclosed in this Policy. However, we may provide other non-personal information and aggregate information to third parties without your authorization. With regard to SMS functionality, when Out Here sends location information from your mobile device to those recipients chosen by you, your phone number will be provided to them along with such identifying information as you choose, such as your username and/or photo. In the event that we engage or partner with third party vendors, consultants or other service providers in connection with the operation of the Site and our services ("Service Providers"), we may share personal information with such Service Providers who need access to such information to carry out their work for us. Service Providers include network operations and service monitoring (NOC) providers, server hosting companies, customer support service providers, and analytics services.  In addition, we may offer various features through a third party service provider. When you use these services, you would be providing information directly to the provider of these services, and the provision of such information would be subject to such party's own privacy policy. We are not responsible for any information you provide to these parties directly, and we encourage you to become familiar with their practices before disclosing information directly to such third parties with which you come into contact.

You should only share your location with people you know and trust not to convey your location to others. You should also note that personal information you share with others may be forwarded, and any information you post to public areas of the Site or in connection with third party sites (including social media sites such as Facebook) may become publicly available. For example, information you display online or post to social media groups (including any interactive or public forums offered within the Site) may be made publicly available and can potentially be viewed by anyone. Your posting to such public areas of the Site constitutes your consent to share such information publicly.

We do not store historical data hence we won’t be able to help law enforcement agencies .We may disclose only personal information or usage data when we are required to comply with the law (e.g. a lawful subpoena, warrant or court order); to enforce or apply this privacy policy or our other policies or agreements; to initiate, render, bill, and collect for amounts owed to us; to protect our or our customers' rights, property or safety; to protect our customers from fraudulent, abusive, or unlawful use of our Site; or if we believe that an emergency involving the danger of death or serious physical injury to any person requires disclosure of communications or justifies disclosure of personal information. In addition, information about our customers, including personal information, may be disclosed as part of any merger, acquisition, debt financing, sale of company assets, as well as in the event of an insolvency, bankruptcy or receivership in which personally identifiable information could be transferred to third parties as one of the business assets of the Company.

Please note: The Site and service may provide links to other sites, or other interactive forums hosted by a third party. Please be aware that although we may participate in or utilize such other sites, we are not responsible for the privacy practices of such other sites. We encourage you to be aware when you leave our Site and to read the privacy policies of any Web site that collects personally identifiable information. Similarly, if you entered the Out Here Site through another Web site, we are also not responsible for the privacy practices of that site, and you should review the privacy policy of the originating site before providing any personal information to that site. This privacy policy applies solely to information collected by us.
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
                  'Where is your information stored?',
                  style: TextStyle(
                    fontSize: 28,
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
Abacus is based in Mumbai India, and any information which we collect about you or which you provide to us may be stored in United States, Europe or Asia. If you are using the Site and the app in the European Economic Area (EEA), you consent to your personal information being transferred outside the EEA, including to countries where you may have fewer legal rights.  However, we will take steps to ensure that your personal information is treated securely and in accordance with this Policy, wherever it is handled.                ''',
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
                  'What steps do we take to protect your information online?',
                  style: TextStyle(
                    fontSize: 28,
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
Out Here endeavors to secure your personal information from unauthorized access, use or disclosure by putting into place measures to safeguard the information we collect. Please be aware, however, that despite our efforts, no security measures are perfect or impenetrable, and that we cannot guarantee that the Site or services will be free of any defects or flaws that affect your use of it or the security of your information. ''',
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
                  'Changes in this Privacy Statement',
                  style: TextStyle(
                    fontSize: 28,
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
We may update this privacy statement to reflect changes to our information practices. If we make any material changes we will notify you by posting the revised privacy policy on our Site or, if you have established an Out Here user account, we will send a notification to the e-mail address specified in your account.  Any revisions to our privacy policy will become effective after such notification. We encourage you to periodically review this page for the latest information on our privacy practices.
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
