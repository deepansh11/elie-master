import 'dart:io';

import 'package:auto_route/annotations.dart';
import 'package:elie_web/Anu/LoginPage.dart';
import 'package:elie_web/Anu/RegisterPage.dart';
import 'package:elie_web/CartPage/0CartPage.dart';
import 'package:elie_web/ExpertPage/0ExperPage.dart';
import 'package:elie_web/HomePage/0HomePage.dart';
import 'package:elie_web/LocationPage/0LocationPage.dart';
import 'package:elie_web/LocationPage/2LocationChoicePage.dart';
import 'package:elie_web/OrderPage/OrderPage.dart';
import 'package:elie_web/ProductsPage/0ProductsPage.dart';
import 'package:elie_web/ProductsPage/0ServicesPage.dart';
import 'package:elie_web/ServiceProductDescPage/ProductDescPage.dart';
import 'package:elie_web/ServiceProductDescPage/ServiceDescPage.dart';
import 'package:elie_web/Static/About.dart';
import 'package:elie_web/Static/Career.dart';
import 'package:elie_web/Static/Education.dart';
import 'package:elie_web/Static/EventsPage.dart';
import 'package:elie_web/Static/Fitness.dart';
import 'package:elie_web/Static/Tattoo.dart';
import 'package:elie_web/ThankYouPage/0ThankYouPage.dart';

import '../Anu/PolicyPage.dart';
import '../Anu/TermsPage.dart';
import '../HomePage/Landing.dart';
import '../PackagesPage/0PackagesPage.dart';
import '../PackagesPage/1PackagesDescPage.dart';
import '../PackagesPage/Enquiry.dart';

@CustomAutoRouter(replaceInRouteName: 'Page,Route', routes: <AutoRoute>[
  AutoRoute(
    path: '/',
    page: LandingPage,
    initial: true,
  ),
  AutoRoute(
    path: '/home',
    page: HomePage,
  ),
  AutoRoute(
    path: '/service',
    page: ServicesPage,
  ),
  AutoRoute(
    path: '/product',
    page: ProductsPage,
  ),
  AutoRoute(
    path: '/cart',
    page: CartPage,
  ),
  AutoRoute(
    path: '/ProductDescPage/:id',
    page: ProductDescPage,
  ),
  AutoRoute(
    path: '/ServiceDescPage/:id',
    page: ServiceDescPage,
  ),
  AutoRoute(
    path: '/LoginPage',
    page: LoginPage,
  ),
  AutoRoute(
    path: '/OrderPage',
    page: OrderPage,
  ),
  AutoRoute(
    path: '/RegisterPage',
    page: RegisterPage,
  ),
  AutoRoute(
    path: '/LocationPage',
    page: LocationPage,
  ),
  AutoRoute(
    path: '/ExpertPage',
    page: ExpertPage,
  ),
  AutoRoute(
    path: '/ThankYouPage',
    page: ThankYouPage,
  ),
  AutoRoute(
    path: '/Terms',
    page: Terms,
  ),
  AutoRoute(
    path: '/Policy',
    page: PolicyPage,
  ),
  AutoRoute(
    path: '/LocationChoicePage',
    page: LocationChoicePage,
  ),
  AutoRoute(
    path: '/Event',
    page: EventsPage,
  ),
  AutoRoute(
    path: '/Education',
    page: EducationPage,
  ),
  AutoRoute(
    path: '/Fitness',
    page: FitnessPage,
  ),
  AutoRoute(
    path: '/Tattoo',
    page: TattooPage,
  ),
  AutoRoute(
    path: '/About',
    page: AboutPage,
  ),
  AutoRoute(
    path: '/Career',
    page: Career,
  ),
  AutoRoute(
    path: '/Packages',
    page: PackagesPage,
  ),
  AutoRoute(
    path: '/PackagesDescPage/:id',
    page: PackagesDesc,
  ),
  AutoRoute(
    path: '/Enquiry',
    page: EnquiryRegistered,
  ),
])
class $AppRouter {}
