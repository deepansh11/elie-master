// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i24;
import 'package:flutter/material.dart' as _i25;

import '../Anu/LoginPage.dart' as _i7;
import '../Anu/PolicyPage.dart' as _i14;
import '../Anu/RegisterPage.dart' as _i9;
import '../Anu/TermsPage.dart' as _i13;
import '../CartPage/0CartPage.dart' as _i4;
import '../ExpertPage/0ExperPage.dart' as _i11;
import '../HomePage/0HomePage.dart' as _i1;
import '../LocationPage/0LocationPage.dart' as _i10;
import '../LocationPage/2LocationChoicePage.dart' as _i15;
import '../OrderPage/OrderPage.dart' as _i8;
import '../PackagesPage/0PackagesPage.dart' as _i22;
import '../PackagesPage/1PackagesDescPage.dart' as _i23;
import '../ProductsPage/0ProductsPage.dart' as _i3;
import '../ProductsPage/0ServicesPage.dart' as _i2;
import '../ServiceProductDescPage/ProductDescPage.dart' as _i5;
import '../ServiceProductDescPage/ServiceDescPage.dart' as _i6;
import '../Static/About.dart' as _i20;
import '../Static/Career.dart' as _i21;
import '../Static/Education.dart' as _i17;
import '../Static/EventsPage.dart' as _i16;
import '../Static/Fitness.dart' as _i18;
import '../Static/Tattoo.dart' as _i19;
import '../ThankYouPage/0ThankYouPage.dart' as _i12;

class AppRouter extends _i24.RootStackRouter {
  AppRouter([_i25.GlobalKey<_i25.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i24.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i24.CustomPage<dynamic>(
          routeData: routeData,
          child: _i1.HomePage(),
          opaque: true,
          barrierDismissible: false);
    },
    ServicesRoute.name: (routeData) {
      return _i24.CustomPage<dynamic>(
          routeData: routeData,
          child: _i2.ServicesPage(),
          opaque: true,
          barrierDismissible: false);
    },
    ProductsRoute.name: (routeData) {
      final args = routeData.argsAs<ProductsRouteArgs>(
          orElse: () => const ProductsRouteArgs());
      return _i24.CustomPage<dynamic>(
          routeData: routeData,
          child: _i3.ProductsPage(key: args.key),
          opaque: true,
          barrierDismissible: false);
    },
    CartRoute.name: (routeData) {
      final args =
          routeData.argsAs<CartRouteArgs>(orElse: () => const CartRouteArgs());
      return _i24.CustomPage<dynamic>(
          routeData: routeData,
          child: _i4.CartPage(key: args.key),
          opaque: true,
          barrierDismissible: false);
    },
    ProductDescRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ProductDescRouteArgs>(
          orElse: () => ProductDescRouteArgs(id: pathParams.optString('id')));
      return _i24.CustomPage<dynamic>(
          routeData: routeData,
          child: _i5.ProductDescPage(args.id),
          opaque: true,
          barrierDismissible: false);
    },
    ServiceDescRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ServiceDescRouteArgs>(
          orElse: () => ServiceDescRouteArgs(id: pathParams.optString('id')));
      return _i24.CustomPage<dynamic>(
          routeData: routeData,
          child: _i6.ServiceDescPage(args.id),
          opaque: true,
          barrierDismissible: false);
    },
    LoginRoute.name: (routeData) {
      return _i24.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i7.LoginPage(),
          opaque: true,
          barrierDismissible: false);
    },
    OrderRoute.name: (routeData) {
      return _i24.CustomPage<dynamic>(
          routeData: routeData,
          child: _i8.OrderPage(),
          opaque: true,
          barrierDismissible: false);
    },
    RegisterRoute.name: (routeData) {
      return _i24.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i9.RegisterPage(),
          opaque: true,
          barrierDismissible: false);
    },
    LocationRoute.name: (routeData) {
      final args = routeData.argsAs<LocationRouteArgs>(
          orElse: () => const LocationRouteArgs());
      return _i24.CustomPage<dynamic>(
          routeData: routeData,
          child: _i10.LocationPage(key: args.key),
          opaque: true,
          barrierDismissible: false);
    },
    ExpertRoute.name: (routeData) {
      return _i24.CustomPage<dynamic>(
          routeData: routeData,
          child: _i11.ExpertPage(),
          opaque: true,
          barrierDismissible: false);
    },
    ThankYouRoute.name: (routeData) {
      return _i24.CustomPage<dynamic>(
          routeData: routeData,
          child: _i12.ThankYouPage(),
          opaque: true,
          barrierDismissible: false);
    },
    Terms.name: (routeData) {
      return _i24.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i13.Terms(),
          opaque: true,
          barrierDismissible: false);
    },
    PolicyRoute.name: (routeData) {
      return _i24.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i14.PolicyPage(),
          opaque: true,
          barrierDismissible: false);
    },
    LocationChoiceRoute.name: (routeData) {
      final args = routeData.argsAs<LocationChoiceRouteArgs>(
          orElse: () => const LocationChoiceRouteArgs());
      return _i24.CustomPage<dynamic>(
          routeData: routeData,
          child: _i15.LocationChoicePage(key: args.key),
          opaque: true,
          barrierDismissible: false);
    },
    EventsRoute.name: (routeData) {
      return _i24.CustomPage<dynamic>(
          routeData: routeData,
          child: _i16.EventsPage(),
          opaque: true,
          barrierDismissible: false);
    },
    EducationRoute.name: (routeData) {
      return _i24.CustomPage<dynamic>(
          routeData: routeData,
          child: _i17.EducationPage(),
          opaque: true,
          barrierDismissible: false);
    },
    FitnessRoute.name: (routeData) {
      return _i24.CustomPage<dynamic>(
          routeData: routeData,
          child: _i18.FitnessPage(),
          opaque: true,
          barrierDismissible: false);
    },
    TattooRoute.name: (routeData) {
      return _i24.CustomPage<dynamic>(
          routeData: routeData,
          child: _i19.TattooPage(),
          opaque: true,
          barrierDismissible: false);
    },
    AboutRoute.name: (routeData) {
      return _i24.CustomPage<dynamic>(
          routeData: routeData,
          child: _i20.AboutPage(),
          opaque: true,
          barrierDismissible: false);
    },
    Career.name: (routeData) {
      return _i24.CustomPage<dynamic>(
          routeData: routeData,
          child: _i21.Career(),
          opaque: true,
          barrierDismissible: false);
    },
    PackagesRoute.name: (routeData) {
      return _i24.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i22.PackagesPage(),
          opaque: true,
          barrierDismissible: false);
    },
    PackagesDesc.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<PackagesDescArgs>(
          orElse: () => PackagesDescArgs(id: pathParams.optString('id')));
      return _i24.CustomPage<dynamic>(
          routeData: routeData,
          child: _i23.PackagesDesc(key: args.key, id: args.id),
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i24.RouteConfig> get routes => [
        _i24.RouteConfig(HomeRoute.name, path: '/'),
        _i24.RouteConfig(ServicesRoute.name, path: '/service'),
        _i24.RouteConfig(ProductsRoute.name, path: '/product'),
        _i24.RouteConfig(CartRoute.name, path: '/cart'),
        _i24.RouteConfig(ProductDescRoute.name, path: '/ProductDescPage/:id'),
        _i24.RouteConfig(ServiceDescRoute.name, path: '/ServiceDescPage/:id'),
        _i24.RouteConfig(LoginRoute.name, path: '/LoginPage'),
        _i24.RouteConfig(OrderRoute.name, path: '/OrderPage'),
        _i24.RouteConfig(RegisterRoute.name, path: '/RegisterPage'),
        _i24.RouteConfig(LocationRoute.name, path: '/LocationPage'),
        _i24.RouteConfig(ExpertRoute.name, path: '/ExpertPage'),
        _i24.RouteConfig(ThankYouRoute.name, path: '/ThankYouPage'),
        _i24.RouteConfig(Terms.name, path: '/Terms'),
        _i24.RouteConfig(PolicyRoute.name, path: '/Policy'),
        _i24.RouteConfig(LocationChoiceRoute.name, path: '/LocationChoicePage'),
        _i24.RouteConfig(EventsRoute.name, path: '/Event'),
        _i24.RouteConfig(EducationRoute.name, path: '/Education'),
        _i24.RouteConfig(FitnessRoute.name, path: '/Fitness'),
        _i24.RouteConfig(TattooRoute.name, path: '/Tattoo'),
        _i24.RouteConfig(AboutRoute.name, path: '/About'),
        _i24.RouteConfig(Career.name, path: '/Career'),
        _i24.RouteConfig(PackagesRoute.name, path: '/Packages'),
        _i24.RouteConfig(PackagesDesc.name, path: '/PackagesDescPage/:id')
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i24.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.ServicesPage]
class ServicesRoute extends _i24.PageRouteInfo<void> {
  const ServicesRoute() : super(ServicesRoute.name, path: '/service');

  static const String name = 'ServicesRoute';
}

/// generated route for
/// [_i3.ProductsPage]
class ProductsRoute extends _i24.PageRouteInfo<ProductsRouteArgs> {
  ProductsRoute({_i25.Key? key})
      : super(ProductsRoute.name,
            path: '/product', args: ProductsRouteArgs(key: key));

  static const String name = 'ProductsRoute';
}

class ProductsRouteArgs {
  const ProductsRouteArgs({this.key});

  final _i25.Key? key;

  @override
  String toString() {
    return 'ProductsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.CartPage]
class CartRoute extends _i24.PageRouteInfo<CartRouteArgs> {
  CartRoute({_i25.Key? key})
      : super(CartRoute.name, path: '/cart', args: CartRouteArgs(key: key));

  static const String name = 'CartRoute';
}

class CartRouteArgs {
  const CartRouteArgs({this.key});

  final _i25.Key? key;

  @override
  String toString() {
    return 'CartRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.ProductDescPage]
class ProductDescRoute extends _i24.PageRouteInfo<ProductDescRouteArgs> {
  ProductDescRoute({required String? id})
      : super(ProductDescRoute.name,
            path: '/ProductDescPage/:id',
            args: ProductDescRouteArgs(id: id),
            rawPathParams: {'id': id});

  static const String name = 'ProductDescRoute';
}

class ProductDescRouteArgs {
  const ProductDescRouteArgs({required this.id});

  final String? id;

  @override
  String toString() {
    return 'ProductDescRouteArgs{id: $id}';
  }
}

/// generated route for
/// [_i6.ServiceDescPage]
class ServiceDescRoute extends _i24.PageRouteInfo<ServiceDescRouteArgs> {
  ServiceDescRoute({required String? id})
      : super(ServiceDescRoute.name,
            path: '/ServiceDescPage/:id',
            args: ServiceDescRouteArgs(id: id),
            rawPathParams: {'id': id});

  static const String name = 'ServiceDescRoute';
}

class ServiceDescRouteArgs {
  const ServiceDescRouteArgs({required this.id});

  final String? id;

  @override
  String toString() {
    return 'ServiceDescRouteArgs{id: $id}';
  }
}

/// generated route for
/// [_i7.LoginPage]
class LoginRoute extends _i24.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/LoginPage');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i8.OrderPage]
class OrderRoute extends _i24.PageRouteInfo<void> {
  const OrderRoute() : super(OrderRoute.name, path: '/OrderPage');

  static const String name = 'OrderRoute';
}

/// generated route for
/// [_i9.RegisterPage]
class RegisterRoute extends _i24.PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: '/RegisterPage');

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i10.LocationPage]
class LocationRoute extends _i24.PageRouteInfo<LocationRouteArgs> {
  LocationRoute({_i25.Key? key})
      : super(LocationRoute.name,
            path: '/LocationPage', args: LocationRouteArgs(key: key));

  static const String name = 'LocationRoute';
}

class LocationRouteArgs {
  const LocationRouteArgs({this.key});

  final _i25.Key? key;

  @override
  String toString() {
    return 'LocationRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i11.ExpertPage]
class ExpertRoute extends _i24.PageRouteInfo<void> {
  const ExpertRoute() : super(ExpertRoute.name, path: '/ExpertPage');

  static const String name = 'ExpertRoute';
}

/// generated route for
/// [_i12.ThankYouPage]
class ThankYouRoute extends _i24.PageRouteInfo<void> {
  const ThankYouRoute() : super(ThankYouRoute.name, path: '/ThankYouPage');

  static const String name = 'ThankYouRoute';
}

/// generated route for
/// [_i13.Terms]
class Terms extends _i24.PageRouteInfo<void> {
  const Terms() : super(Terms.name, path: '/Terms');

  static const String name = 'Terms';
}

/// generated route for
/// [_i14.PolicyPage]
class PolicyRoute extends _i24.PageRouteInfo<void> {
  const PolicyRoute() : super(PolicyRoute.name, path: '/Policy');

  static const String name = 'PolicyRoute';
}

/// generated route for
/// [_i15.LocationChoicePage]
class LocationChoiceRoute extends _i24.PageRouteInfo<LocationChoiceRouteArgs> {
  LocationChoiceRoute({_i25.Key? key})
      : super(LocationChoiceRoute.name,
            path: '/LocationChoicePage',
            args: LocationChoiceRouteArgs(key: key));

  static const String name = 'LocationChoiceRoute';
}

class LocationChoiceRouteArgs {
  const LocationChoiceRouteArgs({this.key});

  final _i25.Key? key;

  @override
  String toString() {
    return 'LocationChoiceRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i16.EventsPage]
class EventsRoute extends _i24.PageRouteInfo<void> {
  const EventsRoute() : super(EventsRoute.name, path: '/Event');

  static const String name = 'EventsRoute';
}

/// generated route for
/// [_i17.EducationPage]
class EducationRoute extends _i24.PageRouteInfo<void> {
  const EducationRoute() : super(EducationRoute.name, path: '/Education');

  static const String name = 'EducationRoute';
}

/// generated route for
/// [_i18.FitnessPage]
class FitnessRoute extends _i24.PageRouteInfo<void> {
  const FitnessRoute() : super(FitnessRoute.name, path: '/Fitness');

  static const String name = 'FitnessRoute';
}

/// generated route for
/// [_i19.TattooPage]
class TattooRoute extends _i24.PageRouteInfo<void> {
  const TattooRoute() : super(TattooRoute.name, path: '/Tattoo');

  static const String name = 'TattooRoute';
}

/// generated route for
/// [_i20.AboutPage]
class AboutRoute extends _i24.PageRouteInfo<void> {
  const AboutRoute() : super(AboutRoute.name, path: '/About');

  static const String name = 'AboutRoute';
}

/// generated route for
/// [_i21.Career]
class Career extends _i24.PageRouteInfo<void> {
  const Career() : super(Career.name, path: '/Career');

  static const String name = 'Career';
}

/// generated route for
/// [_i22.PackagesPage]
class PackagesRoute extends _i24.PageRouteInfo<void> {
  const PackagesRoute() : super(PackagesRoute.name, path: '/Packages');

  static const String name = 'PackagesRoute';
}

/// generated route for
/// [_i23.PackagesDesc]
class PackagesDesc extends _i24.PageRouteInfo<PackagesDescArgs> {
  PackagesDesc({_i25.Key? key, String? id})
      : super(PackagesDesc.name,
            path: '/PackagesDescPage/:id',
            args: PackagesDescArgs(key: key, id: id),
            rawPathParams: {'id': id});

  static const String name = 'PackagesDesc';
}

class PackagesDescArgs {
  const PackagesDescArgs({this.key, this.id});

  final _i25.Key? key;

  final String? id;

  @override
  String toString() {
    return 'PackagesDescArgs{key: $key, id: $id}';
  }
}
