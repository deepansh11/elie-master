import 'package:elie_web/Database/API.dart';
import 'package:elie_web/Database/Locator.dart';
import 'package:elie_web/Utils/Constants.dart';
import 'package:flutter/material.dart';

class CartDesc extends StatefulWidget {
  CartDesc({
    Key? key,
    required this.productImage,
    required this.productTitle,
    required this.productPrice,
    required this.location,
    required this.date,
    required this.time,
    required this.expertId,
    required this.expertName,
    required this.removeFunc,
    required this.count,
    required this.cartId,
    this.update,
  }) : super(key: key);

  //service & product
  final String productImage;
  final String productTitle;
  final double productPrice;
  //Location
  final String location;
  // date % time
  final String date;
  final String time;
  //expert
  final String expertId;
  final String expertName;
  final Function removeFunc;
  final int cartId;
  int count;
  final update;

  @override
  State<CartDesc> createState() => _CartDescState();
}

class _CartDescState extends State<CartDesc> {
  increaseQuantity() async {
    if (widget.count < 9 && widget.count > 0) {
      widget.count += 1;
      getItCart.setAmt(getItCart.totAmount + widget.productPrice);
      await API().updateQuantity(getItUserIn.userPhone, widget.cartId, widget.count);
      widget.update();
      setState(() {});
    }
  }

  decreaseQuantity() async {
    if (widget.count < 10 && widget.count > 1) {
      widget.count -= 1;
      getItCart.setAmt(getItCart.totAmount - widget.productPrice);
      await API().updateQuantity(getItUserIn.userPhone, widget.cartId, widget.count);
      widget.update();
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Stack(children: [
      widget.expertId.toString() != 'null' ? CartDecsTileSERVICES(screenSize) : CartDecsTilePRODUCT(screenSize),
      Positioned(
          top: Responsive.responsiveNumber(5.0, 20.0, screenSize),
          right: Responsive.responsiveNumber(1.0, 20.0, screenSize),
          child: IconButton(
            icon: Icon(
              Icons.delete_outline,
            ),
            onPressed: () async {
              await widget.removeFunc();
            },
          ))
    ]);
  }

/////////////////////SERVICES TILE/////////////////////SERVICES TILE/////////////////////SERVICES TILE/////////////////////SERVICES TILE/////////////////////SERVICES TILE
  Container CartDecsTileSERVICES(Size screenSize) {
    return Container(
      child: isMobile(screenSize)
          /////////////MOBILE/////////////MOBILE/////////////MOBILE/////////////MOBILE/////////////MOBILE
          ? Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SizedBox(
                        height: 250.0,
                        child: Image.network(
                          '${widget.productImage}',
                          fit: BoxFit.contain,
                        )),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: screenSize.width / 1.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(Responsive.responsiveNumber(8.0, 15.0, screenSize)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Text(
                                      "${widget.productTitle}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: Responsive.responsiveNumber(20.0, 25.0, screenSize),
                                          fontFamily: 'NT',
                                          decoration: TextDecoration.underline),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: screenSize.width / 1.5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(Responsive.responsiveNumber(8.0, 15.0, screenSize)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Text(
                                    "Appointment Date: ${widget.date}",
                                    style: cartDesc_TextStyle(screenSize),
                                  ),
                                  Text(
                                    "Appointment Time: ${widget.time}",
                                    style: cartDesc_TextStyle(screenSize),
                                  ),
                                  Text(
                                    "Service By: ${widget.expertName}",
                                    style: cartDesc_TextStyle(screenSize),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Location: ${widget.location}",
                                    style: cartDesc_TextStyle(screenSize),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          /////////////WEB/////////////WEB/////////////WEB/////////////WEB/////////////WEB/////////////WEB
          : Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SizedBox(
                        height: 250.0,
                        width: 400.0,
                        child: Image.network(
                          '${widget.productImage}',
                          fit: BoxFit.contain,
                        )),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: screenSize.width / 1.5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${widget.productTitle}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25.0,
                                      fontFamily: 'NT',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3.0,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: screenSize.width / 1.5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Text(
                                    "Appointment Date: ${widget.date}",
                                    style: cartDesc_TextStyle(screenSize),
                                  ),
                                  Text(
                                    "Appointment Time: ${widget.time}",
                                    style: cartDesc_TextStyle(screenSize),
                                  ),
                                  Text(
                                    "Expert Name: ${widget.expertName}",
                                    style: cartDesc_TextStyle(screenSize),
                                  ),
                                  Text(
                                    "Location: ${widget.location}",
                                    style: cartDesc_TextStyle(screenSize),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 40.0),
                                  child: Text(
                                    "Rs. ${widget.productPrice}",
                                    style: cartDesc_TextStyle(screenSize),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
    );
  }

  /////////////////////PRODUCT TILE/////////////////////PRODUCT TILE/////////////////////PRODUCT TILE/////////////////////PRODUCT TILE/////////////////////PRODUCT TILE
  Container CartDecsTilePRODUCT(Size screenSize) {
    return Container(
      child: isMobile(screenSize)
          /////////////MOBILE/////////////MOBILE/////////////MOBILE/////////////MOBILE/////////////MOBILE
          ? Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SizedBox(
                        height: 250.0,
                        child: Image.network(
                          '${widget.productImage}',
                          fit: BoxFit.contain,
                        )),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: screenSize.width / 1.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 38.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${widget.productTitle}",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: Responsive.responsiveNumber(16.0, 25.0, screenSize),
                                            fontFamily: 'NT',
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 0.0),
                                          child: Text(
                                            "Rs. ${widget.productPrice}",
                                            style: cartDesc_TextStyle(screenSize),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  CartCounter(
                                    count: widget.count,
                                    increase: increaseQuantity,
                                    decrease: decreaseQuantity,
                                  ),
                                  SizedBox(
                                    height: 3.0,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            "Will be delivered At: ${widget.location}",
                            style: cartDesc_TextStyle(screenSize),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )
          /////////////WEB/////////////WEB/////////////WEB/////////////WEB/////////////WEB/////////////WEB/////////////WEB
          : Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SizedBox(
                        height: 250.0,
                        width: 400.0,
                        child: Image.network(
                          '${widget.productImage}',
                          fit: BoxFit.contain,
                        )),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: screenSize.width / 1.5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${widget.productTitle}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25.0,
                                      fontFamily: 'NT',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3.0,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: screenSize.width / 1.5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Text(
                                    "Will be delivered At: ${widget.location}",
                                    style: cartDesc_TextStyle(screenSize),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                CartCounter(
                                  count: widget.count,
                                  increase: increaseQuantity,
                                  decrease: decreaseQuantity,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 40.0),
                                  child: Text(
                                    "Rs. ${widget.productPrice}",
                                    style: cartDesc_TextStyle(screenSize),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
    );
  }

  TextStyle cartDesc_TextStyle(screenSize) {
    return TextStyle(
      color: Colors.white,
      fontSize: Responsive.responsiveNumber(16.0, 20.0, screenSize),
      fontFamily: 'NT',
    );
  }
}

class CartCounter extends StatelessWidget {
  const CartCounter({
    Key? key,
    required this.count,
    this.increase,
    this.decrease,
  }) : super(key: key);

  final int count;
  final increase;
  final decrease;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 30,
          width: 30,
          color: highLcolorLight,
          child: IconButton(
            iconSize: 15,
            color: Colors.white,
            icon: Icon(
              Icons.add,
            ),
            onPressed: () {
              increase();
            },
          ),
        ),
        Container(
          height: 30,
          width: 30,
          color: highLcolorDark,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                count.toString(),
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ),
        ),
        Container(
          height: 30,
          width: 30,
          color: highLcolorLight,
          child: IconButton(
            iconSize: 15,
            color: Colors.white,
            icon: Icon(
              Icons.remove,
            ),
            onPressed: () {
              decrease();
            },
          ),
        ),
      ],
    );
  }
}
