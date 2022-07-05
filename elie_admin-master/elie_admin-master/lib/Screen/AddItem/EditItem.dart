import 'package:dio/dio.dart';
import 'package:elie_admin/Database/Locator.dart';
import 'package:elie_admin/Responsive%20Dashboard/constants.dart';
import 'package:elie_admin/Screen/Widgets/CustomFormFields.dart';
import 'package:elie_admin/Utils/Constants.dart';
import 'package:elie_admin/Utils/ExpertiseList.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../Widgets/CustomTextFormFieldColumnOverlay.dart';

class EditItem extends StatefulWidget {
  EditItem({Key? key, this.title}) : super(key: key);
  final title;

  @override
  State<EditItem> createState() => _EditItemState();
}

class _EditItemState extends State<EditItem> {
  var _formKey = GlobalKey<FormState>();

  var id;
  TextEditingController name = TextEditingController();
  TextEditingController homePrice = TextEditingController();
  TextEditingController salePrice = TextEditingController();
  TextEditingController desc = TextEditingController();
  TextEditingController stock = TextEditingController();
  TextEditingController lowStock = TextEditingController();
  TextEditingController duration = TextEditingController();
  TextEditingController tax = TextEditingController();
  TextEditingController type = TextEditingController();
  TextEditingController aff = TextEditingController();
  TextEditingController hsn = TextEditingController();
  TextEditingController sku = TextEditingController();
  TextEditingController cate = TextEditingController();

  var availability = true;

  var image;

  availibilityFunc(check) {
    availability = check;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var data = getItEditProduct;

    name.text = data.name;
    homePrice.text = data.price.toString() == 'null' ? '0' : data.price.toString();
    salePrice.text = data.salePrice.toString();
    desc.text = data.desc;
    stock.text = data.stock.toString();
    lowStock.text = data.lowStock.toString();
    duration.text = data.duration.toString();
    tax.text = data.tax.toString();
    availability = data.status;
    id = data.id;
    type.text = data.isSpa == true ? 'Spa' : 'Salon';
    aff.text = data.aff ?? '';
    hsn.text = data.hsn ?? '';
    sku.text = data.sku ?? '';
    cate.text = data.category ?? '';
  }

  final ScrollController _controllerOne = ScrollController();
  bool loadingBtn = false;

  @override
  Widget build(BuildContext context) {
    var isProduct = widget.title == 'Product' ? true : false;
    return Form(
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Scrollbar(
              controller: _controllerOne,
              isAlwaysShown: true,
              child: ListView(
                shrinkWrap: true,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Edit ${widget.title}',
                        style: TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          key: _formKey,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: CustomTextFormFieldColumn(
                                controller: name,
                                title: '${widget.title} Name',
                                maxLine: 1,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: CustomTextFormFieldColumn(
                                      maxLine: 1,
                                      controller: homePrice,
                                      title: isProduct ? 'Price (₹)' : 'Home Price(₹)',
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Expanded(
                                    child: CustomTextFormFieldColumn(
                                      maxLine: 1,
                                      controller: salePrice,
                                      title: isProduct ? 'Sale Price (₹)' : 'Salon Price(₹)',
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomTextFormFieldColumn(
                                controller: desc,
                                maxLine: 8,
                                title: 'Description',
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            isProduct
                                ? Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CustomTextFormFieldColumn(
                                      controller: aff,
                                      maxLine: 2,
                                      title: 'Affirmation',
                                    ),
                                  )
                                : Container(),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: isProduct
                                  ? Row(
                                      children: [
                                        Expanded(
                                          child: CustomTextFormFieldColumn(
                                            maxLine: 1,
                                            controller: stock,
                                            title: 'Stock',
                                          ),
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Expanded(
                                          child: CustomTextFormFieldColumn(
                                            maxLine: 1,
                                            controller: lowStock,
                                            title: 'Low Stock Threshold',
                                          ),
                                        ),
                                      ],
                                    )
                                  : CustomTextFormFieldColumn(title: 'Duration (in minutes)', maxLine: 1, controller: duration),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: CustomTextFormFieldColumn(
                                      controller: tax,
                                      title: 'Tax',
                                      maxLine: 1,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  !isProduct
                                      ? Expanded(
                                          child: CustomTextFormFieldColumnOverlay(
                                            maxLine: 1,
                                            controller: type,
                                            title: 'Type',
                                            height: 100,
                                            items: ['Salon', 'Spa'],
                                            onTap: (v) {
                                              type.text = v;
                                            },
                                          ),
                                        )
                                      : Container(),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  !isProduct
                                      ? Expanded(
                                          child: CustomTextFormFieldColumnOverlay(
                                            maxLine: 1,
                                            controller: cate,
                                            title: 'Category',
                                            height: 170,
                                            items: expertiseList,
                                            onTap: (v) {
                                              cate.text = v;
                                            },
                                          ),
                                        )
                                      : Container(),
                                  isProduct
                                      ? Expanded(
                                          child: CustomTextFormFieldColumn(
                                            controller: hsn,
                                            title: 'HSN',
                                            maxLine: 1,
                                          ),
                                        )
                                      : Container(),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  isProduct
                                      ? Expanded(
                                          child: CustomTextFormFieldColumn(
                                            controller: sku,
                                            title: 'SKU',
                                            maxLine: 1,
                                          ),
                                        )
                                      : Container()
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 150,
                            )
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Add Images',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              FilePickerResult? result = await FilePicker.platform.pickFiles(
                                type: FileType.image,
                              );

                              if (result != null) {
                                image = result.files.single;
                                setState(() {});
                              } else {
                                // User canceled the picker
                              }
                            },
                            child: SizedBox(
                              width: 400,
                              height: 300,
                              child: image == null
                                  ? Image.network(
                                      isProduct ? '$baseURL/getProductImageByID/$id' : '$baseURL/getServiceImageByID/$id',
                                      errorBuilder: (c, s, a) => Image.asset(
                                        'assets/addItemImage.jpg',
                                        color: Colors.blue,
                                        colorBlendMode: BlendMode.color,
                                      ),
                                    )
                                  : Image.memory(image.bytes),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                              width: 300,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Status',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                  CheckBoxListTileWidget(
                                    func: availibilityFunc,
                                  ),
                                ],
                              ))
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 10,
              right: 10,
              child: Row(
                children: [
                  SizedBox(
                    height: 40,
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {
                        getItAdminCurrentPage.setIndex(isProduct ? 4 : 5);
                      },
                      child: Text('Cancel'),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff7188b7),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 40,
                    width: 100,
                    child: ElevatedButton(
                      onPressed: loadingBtn
                          ? () {}
                          : () async {
                              setState(() {
                                loadingBtn = true;
                              });
                              if (isProduct) {
                                duration.text = "0";
                              } else {
                                stock.text = '0';
                                lowStock.text = '0';
                              }
                              if (name.text.isNotEmpty &&
                                  homePrice.text.isNotEmpty &&
                                  salePrice.text.isNotEmpty &&
                                  tax.text.isNotEmpty &&
                                  stock.text.isNotEmpty &&
                                  desc.text.isNotEmpty &&
                                  lowStock.text.isNotEmpty &&
                                  duration.text.isNotEmpty) {
                                if (isProduct) {
                                  await Dio().put('$baseURL/updateProductTitle/$id', queryParameters: {'updated': name.text});
                                  await Dio().put('$baseURL/updateProductPrice/$id', queryParameters: {'updated': homePrice.text});
                                  await Dio().put('$baseURL/updateProductSalePrice/$id', queryParameters: {'updated': salePrice.text});
                                  await Dio().put('$baseURL/updateProductTax/$id', queryParameters: {'updated': tax.text});
                                  await Dio().put('$baseURL/updateProductStock/$id', queryParameters: {'updated': stock.text});
                                  await Dio().put('$baseURL/updateProductLowStockThreshold/$id', queryParameters: {'updated': lowStock.text});
                                  await Dio().put('$baseURL/updateProductDesc/$id', queryParameters: {'updated': desc.text});
                                  await Dio().put('$baseURL/updateProductStatus/$id', queryParameters: {'updated': availability});
                                  await Dio().put('$baseURL/updateProductAffirmation/$id', queryParameters: {'updated': aff.text});
                                  await Dio().put('$baseURL/updateProducthsn/$id', queryParameters: {'updated': hsn.text});
                                  await Dio().put('$baseURL/updateProductsku/$id', queryParameters: {'updated': sku.text});
                                  await Dio().put('$baseURL/updateProductcategory/$id', queryParameters: {'updated': cate.text});

                                  if (image != null) {
                                    await Dio().post('$baseURL/addProductImage/$id', data: image.bytes);
                                  }
                                  setState(() {
                                    loadingBtn = false;
                                  });
                                  getItAdminCurrentPage.setIndex(4);
                                } else {
                                  await Dio().put('$baseURL/updateServiceName/$id', queryParameters: {'updated': name.text});
                                  await Dio().put('$baseURL/updateServiceHomeCost/$id', queryParameters: {'updated': homePrice.text});
                                  await Dio().put('$baseURL/updateServiceSaleCost/$id', queryParameters: {'updated': salePrice.text});
                                  await Dio().put('$baseURL/updateServiceTax/$id', queryParameters: {'updated': tax.text});
                                  await Dio().put('$baseURL/updateServiceDuration/$id', queryParameters: {'updated': duration.text});
                                  await Dio().put('$baseURL/updateServiceDesc/$id', queryParameters: {'updated': desc.text});
                                  await Dio().put('$baseURL/updateServiceStatus/$id', queryParameters: {'updated': availability});
                                  await Dio().put('$baseURL/updateServicecategory/$id', queryParameters: {'updated': cate.text});
                                  await Dio().put('$baseURL/updateServiceIsSpa/{isSpa}?id=$id&updated=${type.text == 'Spa' ? true : false}');

                                  if (image != null) {
                                    await Dio().post('$baseURL/addServiceImage/$id', data: image.bytes);
                                  }
                                  setState(() {
                                    loadingBtn = false;
                                  });
                                  getItAdminCurrentPage.setIndex(5);
                                }
                                name.clear();
                                homePrice.clear();
                                salePrice.clear();
                                tax.clear();
                                stock.clear();
                                desc.clear();
                                lowStock.clear();
                                duration.clear();
                              } else {
                                showTopSnackBar(
                                  context,
                                  CustomSnackBar.success(
                                    backgroundColor: primaryColor,
                                    message: "Please fill all the fields",
                                  ),
                                );
                                setState(() {
                                  loadingBtn = false;
                                });
                              }
                              imageCache.clear();
                            },
                      child: loadingBtn
                          ? CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text('Update'),
                      style: ElevatedButton.styleFrom(primary: primaryColor),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}

class CheckBoxListTileWidget extends StatefulWidget {
  CheckBoxListTileWidget({
    Key? key,
    required this.func,
  }) : super(key: key);

  final Function func;

  @override
  State<CheckBoxListTileWidget> createState() => _CheckBoxListTileWidgetState();
}

class _CheckBoxListTileWidgetState extends State<CheckBoxListTileWidget> {
  var checked = true;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      checkColor: Colors.white,
      activeColor: primaryColor,
      tileColor: secondaryColor,
      title: Text('Available'),
      value: checked,
      onChanged: (value) {
        setState(() {
          checked = value!;
          widget.func(checked);
        });
      },
    );
  }
}
