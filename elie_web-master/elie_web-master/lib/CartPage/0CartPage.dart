import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:elie_web/Anu/Footer.dart';
import 'package:elie_web/Carousels/1ProductCarousel.dart';
import 'package:elie_web/Database/API.dart';
import 'package:elie_web/Database/Cart.dart';
import 'package:elie_web/Database/Customers.dart';
import 'package:elie_web/Database/Locator.dart';
import 'package:elie_web/Utils/Constants.dart';
import 'package:elie_web/Utils/NavDrawer.dart';
import 'package:elie_web/Utils/TextFieldWidget.dart';
import 'package:elie_web/Utils/TopBar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
// import 'package:razorpay_web/razorpay_web.dart' as webR;
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '1CartDesc.dart';

class CartPage extends StatefulWidget {
  CartPage({
    Key? key,
  }) : super(key: key);
  static String id = '/CartPage';
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  TextEditingController coupon = TextEditingController();
  TextEditingController phoneNumberTextFeild = TextEditingController();
  TextEditingController otpController = TextEditingController();
  final RoundedLoadingButtonController btController =
      RoundedLoadingButtonController();
  late Razorpay razorpay;
  // late webR.Razorpay razorpaywebR;
  var loading = true;
  var isPDone = false;
  var isSDone = false;
  List<Widget> cartDescItem = [];
  List<Widget> cartServiceDescItem = [];
  var cartTotal = 0.0;
  var discount = 0.0;
  var tax = 0.0;
  var shipping = 0.0;
  var finalCartValue = 0.0;

  var cartdata = getItCart;

  getCartValue(coupon) async {
    var value = (await Dio().get(
            '$baseUrl/get_final_cart_value?phone=${getItUserIn.userPhone}&coupon=$coupon'))
        .data;
    cartTotal = double.parse(value['cart'].toString());
    discount = double.parse(value['discount'].toString());
    tax = double.parse(value['tax'].toString());
    shipping = double.parse(value['shipping'].toString());
    finalCartValue = double.parse(value['final'].toString());
    setState(() {});
  }

  updateCartValue() {
    getCartValue(coupon.text);
  }

  @override
  void initState() {
    cartItems(context);
    cartItemsService(context);
    super.initState();
    getCartValue(null);
    cartdata.addListener(updateCartData);
    razorpay = Razorpay();
    // razorpaywebR = webR.Razorpay();

    getItUserIn.ordered = false;

    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, (r) {
      if (!getItUserIn.ordered) {
        getItUserIn.ordered = true;
        getItCart.coupon = coupon.text;

        context.router.pushNamed(
          '/ThankYouPage',
        );
      }
    });
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, (r) {
      context.router.pushNamed('/cart');
    });
  }

  @override
  void dispose() {
    super.dispose();
    otpController.dispose();
    coupon.dispose();
    phoneNumberTextFeild.dispose();
  }

  updateCartData() {
    if (isPDone && isSDone) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      endDrawer: NavigationDrawerWidget(context),
      backgroundColor: Colors.black,
      body: Container(
        height: screenSize.height,
        child: Column(
          children: [
            TopBar(),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  SizedBox(
                    height: Responsive.responsiveNumber(0, 65, screenSize),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Your Cart',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30.0,
                                fontFamily: 'NT',
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: OutlinedButton(
                                onPressed: () =>
                                    context.router.pushNamed('/product'),
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Color(0xff141414),
                                  side: BorderSide(
                                    color: highLcolor,
                                    width: 1.0,
                                  ),
                                  primary: highLcolor,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40.0, vertical: 15.0),
                                  child: Text(
                                    Responsive.responsiveNumber(
                                        '', 'Continue Shopping', screenSize),
                                    style: TextStyle(
                                        letterSpacing: 2.0,
                                        color: Colors.white,
                                        fontSize: 15.0,
                                        fontFamily: 'NT'),
                                  ),
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: Responsive.responsiveNumber(5.0, 20.0, screenSize),
                      left: Responsive.responsiveNumber(5.0, 20.0, screenSize),
                      bottom:
                          Responsive.responsiveNumber(10.0, 25.0, screenSize),
                    ),
                    child: Divider(
                      thickness: 1.0,
                      color: highLcolor,
                    ),
                  ),
                  loading
                      ? Center(
                          child: CircularProgressIndicator(
                          color: Colors.white,
                        ))
                      : Column(
                          children: [
                            Column(
                              children: cartDescItem.isEmpty
                                  ? [
                                      Text(
                                        '',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize:
                                                Responsive.responsiveNumber(
                                                    20.0, 25.0, screenSize),
                                            letterSpacing: 3.0,
                                            fontFamily: 'PT'),
                                      )
                                    ]
                                  : cartDescItem,
                            ),
                            Column(
                              children: cartServiceDescItem.isEmpty
                                  ? [
                                      Text(
                                        '',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize:
                                                Responsive.responsiveNumber(
                                                    20.0, 25.0, screenSize),
                                            letterSpacing: 3.0,
                                            fontFamily: 'PT'),
                                      )
                                    ]
                                  : cartServiceDescItem,
                            ),
                          ],
                        ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'Offers, Promo Codes and Gift Offers',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: Responsive.responsiveNumber(
                                20.0, 25.0, screenSize),
                            fontFamily: 'NT',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: isMobile(screenSize)
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: SizedBox(
                                      width: screenSize.width,
                                      child: TextFieldWidget(
                                        inputType: TextInputType.text,
                                        controller: coupon,
                                        hintText: "Coupon Code",
                                        labelText: "Coupon Code",
                                        fill: true,
                                        fillColor: Color(0xff707070),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      OutlinedButton(
                                        style: OutlinedButton.styleFrom(
                                          backgroundColor: Color(0xff141414),
                                          side: BorderSide(
                                            color: highLcolor,
                                            width: 1.0,
                                          ),
                                          primary: highLcolor,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 40.0, vertical: 15.0),
                                          child: Text(
                                            'Apply Now',
                                            style: TextStyle(
                                                letterSpacing: 2.0,
                                                color: Colors.white,
                                                fontSize: 15.0,
                                                fontFamily: 'NT'),
                                          ),
                                        ),
                                        onPressed: () {
                                          getCartValue(coupon.text);
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: SizedBox(
                                      width: screenSize.width / 6.0,
                                      child: TextFieldWidget(
                                        inputType: TextInputType.text,
                                        controller: coupon,
                                        hintText: "Coupon Code",
                                        labelText: "Coupon Code",
                                        fill: true,
                                        fillColor: Color(0xff707070),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      OutlinedButton(
                                        style: OutlinedButton.styleFrom(
                                          backgroundColor: Color(0xff141414),
                                          side: BorderSide(
                                            color: highLcolor,
                                            width: 1.0,
                                          ),
                                          primary: highLcolor,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 30.0, vertical: 15.0),
                                          child: Text(
                                            'Apply Now',
                                            style: TextStyle(
                                                letterSpacing: 2.0,
                                                color: Colors.white,
                                                fontSize: 15.0,
                                                fontFamily: 'NT'),
                                          ),
                                        ),
                                        onPressed: () {
                                          getCartValue(coupon.text);
                                          setState(() {});
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 15.0,
                      right: 20.0,
                      left: 20.0,
                      bottom: 15.0,
                    ),
                    child: Divider(
                      thickness: 1.0,
                      color: highLcolor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Cart Total',
                                style: cartTot_TextStyle(screenSize),
                              ),
                              Text(
                                '??? $cartTotal',
                                style: cartTot_TextStyle(screenSize),
                              ),
                            ],
                          ),
                        ),
                        discount != 0
                            ? Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Discount',
                                      style: cartTot_TextStyle(screenSize),
                                    ),
                                    Text(
                                      '-??? ${discount.toStringAsFixed(2)}',
                                      style: cartTot_TextStyle(screenSize),
                                    ),
                                  ],
                                ),
                              )
                            : Container(),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'GST',
                                style: cartTot_TextStyle(screenSize),
                              ),
                              Text(
                                '??? ${tax.toStringAsFixed(2)}',
                                style: cartTot_TextStyle(screenSize),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Shipping',
                                style: cartTot_TextStyle(screenSize),
                              ),
                              Text(
                                '??? $shipping',
                                style: cartTot_TextStyle(screenSize),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 15.0,
                      right: 20.0,
                      left: 20.0,
                      bottom: 10.0,
                    ),
                    child: Divider(
                      thickness: 1.0,
                      color: highLcolor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total',
                                style: cartTot_TextStyle(screenSize),
                              ),
                              Text(
                                '??? ${finalCartValue.toStringAsFixed(2)}',
                                style: cartTot_TextStyle(screenSize),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10.0,
                      right: 20.0,
                      left: 20.0,
                      bottom: 15.0,
                    ),
                    child: Divider(
                      thickness: 1.0,
                      color: highLcolor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Color(0xff141414),
                            side: BorderSide(
                              color: highLcolor,
                              width: 1.0,
                            ),
                            primary: highLcolor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 15.0),
                            child: Text(
                              'Pay Now',
                              style: TextStyle(
                                  letterSpacing: 2.0,
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontFamily: 'NT'),
                            ),
                          ),
                          onPressed: () async {
                            List<Cart> cart =
                                await API().getCartById(getItUserIn.userPhone);
                            if (cart.isNotEmpty) {
                              getItForStock.cartData = cart;
                              var options = {
                                'key': 'rzp_test_SHE6sJzxN7QLMH',
                                'amount': finalCartValue.toInt() * 100,
                                'name': 'Elie World',
                                'description': 'Payment via RazorPay',
                                'prefill': {
                                  'contact':
                                      '+91' + getItUserIn.userPhone.toString(),
                                  'email': getItUserIn.email
                                }
                              };
                              razorpay.open(options);
                            } else {
                              showTopSnackBar(
                                context,
                                CustomSnackBar.success(
                                  backgroundColor: Colors.grey,
                                  message: "Your cart is empty",
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 30.0,
                      right: 20.0,
                      left: 20.0,
                      bottom: 0.0,
                    ),
                    child: Divider(
                      thickness: 1.0,
                      color: highLcolor,
                    ),
                  ),
                  Container(
                    height: screenSize.height /
                        Responsive.responsiveNumber(2.2, 2.0, screenSize),
                    width: screenSize.width,
                    child: ProductCarousel(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 0.0,
                      right: 20.0,
                      left: 20.0,
                      bottom: 15.0,
                    ),
                    child: Divider(
                      thickness: 1.0,
                      color: highLcolor,
                    ),
                  ),
                  isMobile(screenSize) ? Container() : Footer()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle cartTot_TextStyle(screenSize) {
    return TextStyle(
        color: Colors.white,
        fontSize: Responsive.responsiveNumber(16.0, 21.0, screenSize),
        fontFamily: 'NT');
  }

  cartItems(context) async {
    cartdata.setAmt(0);

    List<Cart> cartItemList = await API().getCartById(getItUserIn.userPhone);

    cartDescItem = [];
    for (var index = 0; index < cartItemList.length; index++) {
      if (cartItemList[index].productId != null) {
        var id = cartItemList[index].productId;
        var data = await API().getProductsByID(id);

        double cartAmt = (cartItemList[index].totAmount *
            int.parse(cartItemList[index].quantity.toString()));

        cartdata.setAmt(getItCart.totAmount.toDouble() + cartAmt.toDouble());
        cartDescItem.add(
          CartDesc(
            update: updateCartValue,
            productImage: '$baseUrl/getProductImageByID/$id',
            productTitle: data.productTitle.toString(),
            productPrice: data.salePrice,
            location: cartItemList[index].location.toString(),
            date: cartItemList[index].date.toString(),
            time: cartItemList[index].time.toString(),
            expertId: 'null',
            count: int.parse(cartItemList[index].quantity.toString()),
            cartId: cartItemList[index].cartId,
            removeFunc: () async {
              cartdata.setAmt(getItCart.totAmount.toDouble() - cartAmt);
              await API().deleteCartId(
                  cartItemList[index].cartId, getItUserIn.userPhone);
              getCartValue(coupon.text);
              setState(() {
                cartItems(context);
              });
            },
            expertName: cartItemList[index].expertId.toString(),
          ),
        );
      }
    }
    setState(() {
      loading = false;
    });

    isPDone = true;
  }

  cartItemsService(context) async {
    List<Cart> cartItemList = await API().getCartById(getItUserIn.userPhone);

    cartServiceDescItem = [];
    for (var index = 0; index < cartItemList.length; index++) {
      if (cartItemList[index].serviceId != null) {
        var expert = await API()
            .getExpertByPhone(cartItemList[index].expertId)
            .onError((error, stackTrace) => null);

        cartDescItem.add(Container());
        var id = cartItemList[index].serviceId;
        var data = await API().getServiceByID(id);
        double cartAmt = (cartItemList[index].totAmount *
            int.parse(cartItemList[index].quantity.toString()));

        cartdata.setAmt(getItCart.totAmount.toDouble() + cartAmt.toDouble());

        cartServiceDescItem.add(
          CartDesc(
            update: updateCartValue,
            productImage: '$baseUrl/getServiceImageByID/$id',
            productTitle: data.name.toString(),
            productPrice: double.parse(data.saleCost.toString()),
            location: cartItemList[index].location.toString(),
            date: cartItemList[index].date,
            time: cartItemList[index].time.toString(),
            expertId: cartItemList[index].expertId.toString(),
            count: int.parse(cartItemList[index].quantity.toString()),
            cartId: cartItemList[index].cartId,
            removeFunc: () async {
              cartdata.setAmt(getItCart.totAmount.toDouble() - cartAmt);
              await API().deleteCartId(
                  cartItemList[index].cartId, getItUserIn.userPhone);
              getCartValue(coupon.text);
              setState(() {
                cartItemsService(context);
              });
            },
            expertName: expert == null ? '' : expert.name.toString(),
          ),
        );
      }
    }
    setState(() {
      loading = false;
    });

    isSDone = true;
  }
}
