import 'package:data_table_2/data_table_2.dart';
import 'package:elie_admin/Database/Customers.dart';
import 'package:elie_admin/Database/Locator.dart';
import 'package:elie_admin/Database/Order.dart';
import 'package:elie_admin/Database/API.dart';

import 'package:elie_admin/Database/Product.dart';
import 'package:elie_admin/Responsive%20Dashboard/constants.dart';
import 'package:elie_admin/Screen/Widgets/ActionButtons.dart';
import 'package:elie_admin/Utils/Constants.dart';
import 'package:elie_admin/Utils/OverlayStatus.dart';

import 'package:flutter/material.dart';
import 'package:visibility_aware_state/visibility_aware_state.dart';

class ProductPage extends StatefulWidget {
  @override
  State<ProductPage> createState() => _ProductPageState();

  ProductPage({Key? key}) : super(key: key);
}

class _ProductPageState extends VisibilityAwareState<ProductPage> {
  late List productList = [];
  var loading = true;

  @override
  void onVisibilityChanged(WidgetVisibility visibility) {
    // TODO: Use visibility
    super.onVisibilityChanged(visibility);
    print(visibility);
    if (visibility == WidgetVisibility.VISIBLE) {
      getProducts();
    } else {
      dispose();
    }
  }

  getProducts() async {
    productList = [];
    List<Product> product = await API().getProducts();

    for (var item in product) {
      productList.add(item);
    }

    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Products',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              loading
                  ? Padding(
                      padding: const EdgeInsets.only(top: 89.0),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: primaryColor,
                        ),
                      ),
                    )
                  : Expanded(
                      child: DataTable2(
                        scrollController: ScrollController(keepScrollOffset: true),
                        columnSpacing: 8.0,
                        minWidth: 1500,
                        bottomMargin: 100,
                        columns: [
                          DataColumn(
                            label: _TextHeadingCell(title: "ID"),
                          ),
                          DataColumn(
                            label: _TextHeadingCell(title: "Product"),
                          ),
                          DataColumn(
                            label: _TextHeadingCell(title: "Description"),
                          ),
                          DataColumn(
                            label: _TextHeadingCell(title: "Sale Price"),
                          ),
                          DataColumn(
                            label: _TextHeadingCell(title: "Stock"),
                          ),
                          DataColumn(
                            label: _TextHeadingCell(title: "Tax"),
                          ),
                          DataColumn(
                            label: _TextHeadingCell(title: "Status"),
                          ),
                          DataColumn(
                            label: _TextHeadingCell(title: "Actions"),
                          ),
                        ],
                        rows: List.generate(productList.length, (index) {
                          return BuildDataRow(productList[index]);
                        }),
                      ),
                    ),
            ],
          ),
        ),
        Positioned(
          top: 20,
          right: 20,
          child: ElevatedButton(
            onPressed: () {
              getItAdminCurrentPage.setIndex(11);
            },
            child: Text('Add Product'),
          ),
        )
      ],
    );
  }

  DataRow BuildDataRow(Product product) {
    print(product.id);
    return DataRow(
      cells: [
        DataCell(
          Row(
            children: [
              Image.network(
                '$baseURL/getProductImageByID/${product.id}',
                height: 30,
                width: 30,
                errorBuilder: (c, a, s) {
                  print(a);
                  return Container(
                    height: 30,
                    width: 30,
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: _TextCell(
                  title: product.id,
                ),
              ),
            ],
          ),
        ),
        DataCell(_TextCell(
          title: product.productTitle,
        )),
        DataCell(_TextCell(
          title: product.productDesc,
        )),
        DataCell(_TextCell(
          title: product.salePrice,
        )),
        DataCell(_TextCell(
          title: product.stock,
        )),
        DataCell(_TextCell(
          title: product.tax,
        )),
        DataCell(_TextCell(
          title: product.status ? 'Active' : 'Inactive',
        )),
        DataCell(
          ActionButtons(
            func: getProducts,
            index: 4,
            id: product.id,
            item: 'p',
          ),
        ),
      ],
    );
  }
}

class _TextCell extends StatelessWidget {
  const _TextCell({
    Key? key,
    this.title,
  }) : super(key: key);

  final title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        title.toString(),
        style: TextStyle(color: Colors.white, fontFamily: 'inter', fontSize: 16),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class _TextHeadingCell extends StatelessWidget {
  const _TextHeadingCell({
    Key? key,
    this.title,
  }) : super(key: key);

  final title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        title.toString(),
        style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'inter'),
      ),
    );
  }
}
