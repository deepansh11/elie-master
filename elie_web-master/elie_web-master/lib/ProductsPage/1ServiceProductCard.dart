import 'package:auto_route/auto_route.dart';
import 'package:elie_web/Database/Locator.dart';
import 'package:elie_web/Utils/Constants.dart';
import 'package:flutter/material.dart';

class ServiceProductCard extends StatelessWidget {
  ServiceProductCard({
    this.img,
    this.name,
    this.price,
    this.nameSize = 25.0,
    this.priceSize = 15.0,
    this.desc,
    required this.productData,
    required this.isProduct,
  });
  final productData;
  final img;
  final name;
  final price;
  final desc;
  var nameSize;
  var priceSize;
  final isProduct;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        print('from service tab' + productData.id.toString());
        var p = isProduct
            ? '/ProductDescPage/${productData.id}'
            : '/ServiceDescPage/${productData.id}';
        getItCart.setProductData(productData, isProduct);
        getItPages.setCurrentPathANDTopColorOFF(p);
        context.router.pushNamed(p);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: screenSize.width / (isMobile(screenSize) ? 1.7 : 5.0),
          height: screenSize.height / (isMobile(screenSize) ? 4.0 : 2.0),
          child: Column(
            children: [
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Color(0xff141414),
                  ),
                  clipBehavior: Clip.antiAlias,
                  height: screenSize.height / 3.0,
                  child: Image.network(
                    img,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                name,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: Responsive.responsiveNumber(
                        nameSize - 6.0, nameSize, screenSize),
                    fontFamily: 'NT'),
              ),
              SizedBox(
                height: Responsive.responsiveNumber(0.0, 5.0, screenSize),
              ),
              Text(
                'Starting From ₹$price',
                style: TextStyle(
                    color: highLcolor,
                    fontSize: Responsive.responsiveNumber(
                        priceSize - 2.0, priceSize, screenSize),
                    fontFamily: 'NT'),
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
