import 'package:dio/dio.dart';
import 'package:elie_admin/Database/API.dart';
import 'package:elie_admin/Database/Locator.dart';
import 'package:elie_admin/Responsive%20Dashboard/constants.dart';
import 'package:elie_admin/Screen/Widgets/CustomFormFields.dart';
import 'package:elie_admin/Utils/Constants.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../Utils/ExpertiseList.dart';
import '../../Widgets/CustomTextFormFieldColumnOverlay2.dart';

class AddItem extends StatefulWidget {
  AddItem({Key? key, this.title}) : super(key: key);
  final title;

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  var _formKey = GlobalKey<FormState>();

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
  bool loadingBtn = false;

  availibilityFunc(check) {
    availability = check;
  }

  final ScrollController _controllerOne = ScrollController();

  @override
  Widget build(BuildContext context) {
    var isProduct = widget.title == 'Product' ? true : false;
    return Form(
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 16, top: 16),
            child: ListView(
              controller: ScrollController(keepScrollOffset: true),
              shrinkWrap: true,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Add ${widget.title}',
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
                            padding: EdgeInsets.all(8),
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
                                : Row(
                                    children: [
                                      Expanded(
                                        child: CustomTextFormFieldColumn(
                                          title: 'Duration (in minutes)',
                                          maxLine: 1,
                                          controller: duration,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Expanded(
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
                                    ],
                                  ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: CustomTextFormFieldColumnOverlay(
                                    maxLine: 1,
                                    controller: tax,
                                    title: 'Tax',
                                    height: 170,
                                    items: ['5', '12', '15', '18', '22', '28', '0'],
                                    onTap: (v) {
                                      tax.text = v;
                                    },
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
                                    : SizedBox.shrink(),
                                isProduct
                                    ? Expanded(
                                        child: CustomTextFormFieldColumn(
                                          controller: hsn,
                                          title: 'HSN',
                                          maxLine: 1,
                                        ),
                                      )
                                    : SizedBox.shrink(),
                                isProduct
                                    ? SizedBox(
                                        width: 30,
                                      )
                                    : Container(),
                                isProduct
                                    ? Expanded(
                                        child: CustomTextFormFieldColumn(
                                          controller: sku,
                                          title: 'SKU',
                                          maxLine: 1,
                                        ),
                                      )
                                    : SizedBox.shrink(),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 250,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
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
                                  ? Image.asset(
                                      'assets/addItemImage.jpg',
                                      color: Colors.blue,
                                      colorBlendMode: BlendMode.color,
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
                      ),
                    )
                  ],
                ),
              ],
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
                                  getItProductData.setProductData(0, name.text, 'productImage', desc.text, homePrice.text, salePrice.text, 0,
                                      tax.text, stock.text, lowStock.text, availability, 0, 0, aff.text, hsn.text, sku.text);
                                  var id = await getItProductData.addProduct(); //Adding product and getting id
                                  if (image != null) {
                                    await Dio().post('$baseURL/addProductImage/$id', data: image.bytes);
                                  }

                                  getItAdminCurrentPage.setIndex(4);
                                } else {
                                  getItServiceData.setServiceData(0, name.text, 'image', desc.text, duration.text, homePrice.text, salePrice.text, 0,
                                      tax.text, availability, 0, type.text == 'Spa' ? true : false, cate.text);
                                  var id = await getItServiceData.addService();
                                  if (image != null) {
                                    await Dio().post('$baseURL/addServiceImage/$id', data: image.bytes);
                                  }
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
                                setState(() {
                                  loadingBtn = false;
                                });
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
                          : Text('Add'),
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
