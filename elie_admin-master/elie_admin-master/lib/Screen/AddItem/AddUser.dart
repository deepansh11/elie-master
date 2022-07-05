import 'package:dio/dio.dart';
import 'package:elie_admin/Database/API.dart';
import 'package:elie_admin/Database/Customers.dart';
import 'package:elie_admin/Database/Locator.dart';
import 'package:elie_admin/Responsive%20Dashboard/constants.dart';
import 'package:elie_admin/Screen/Widgets/CustomFormFields.dart';
import 'package:elie_admin/Utils/Constants.dart';
import 'package:elie_admin/Widgets/CustomTextFormFieldColumnOverlay2.dart';
import 'package:elie_admin/Widgets/ListOfBanks.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/dialog/mult_select_dialog.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../Utils/ExpertiseList.dart';
import '../../Utils/Pincode.dart';
import '../../Widgets/NetworkImageSelector.dart';

class AddUser extends StatefulWidget {
  AddUser({Key? key, this.title}) : super(key: key);
  final title;

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  var _formKey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController conPass = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController anniversary = TextEditingController();
  TextEditingController bloodGrp = TextEditingController();
  TextEditingController period = TextEditingController();
  TextEditingController bankacct = TextEditingController();
  TextEditingController bankName = TextEditingController();
  TextEditingController ifsc = TextEditingController();
  TextEditingController employee = TextEditingController();
  TextEditingController nickname = TextEditingController();
  TextEditingController rating = TextEditingController();
  TextEditingController status = TextEditingController();
  TextEditingController expertise = TextEditingController();
  TextEditingController serviceablePin = TextEditingController();
  TextEditingController vehicle = TextEditingController();
  TextEditingController experienceYear = TextEditingController();
  TextEditingController aadhar = TextEditingController();
  TextEditingController pan = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController qualification = TextEditingController();
  TextEditingController vehicleNo = TextEditingController();

  bool loadingBtn = false;

  var panI;
  var availability = true;
  var aadharImage1;
  setAadharImage1(i) {
    print(i);
    aadharImage1 = i;
  }

  var aadharImage2;
  setAadharImage2(i) {
    aadharImage2 = i;
  }

  var panImage;
  setPanImage(i) {
    panImage = i;
  }

  var image;

  availibilityFunc(check) {
    availability = check;
  }

  customerDatePicker({screenSize, title, cont}) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Color(0xff141414),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontFamily: 'tex',
          ),
        ),
        content: Container(
          height: screenSize.height / 2.0,
          width: 400.0,
          child: SfDateRangePicker(
            selectionTextStyle: TextStyle(fontSize: 15.0, color: Colors.white70),
            selectionColor: primaryColor,
            selectionRadius: 90.0,
            selectionShape: DateRangePickerSelectionShape.rectangle,
            headerHeight: 100.0,
            headerStyle: DateRangePickerHeaderStyle(textAlign: TextAlign.center),
            showNavigationArrow: true,
            monthCellStyle: DateRangePickerMonthCellStyle(
              textStyle: TextStyle(fontFamily: "tex", color: Colors.white, fontSize: 16.0),
              disabledDatesTextStyle: TextStyle(fontStyle: FontStyle.normal, color: Colors.white54),
            ),
            backgroundColor: Colors.black,
            allowViewNavigation: true,
            onSelectionChanged: (value) {
              cont.text = DateFormat('dd, MMMM yyyy').format(value.value).toString();
            },
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Color(0xff141414),
                    side: BorderSide(
                      color: primaryColor,
                      width: 1.0,
                    ),
                    primary: primaryColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10.0),
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.white, fontSize: 14.0, fontFamily: 'tex'),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Expanded(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Color(0xff141414),
                    side: BorderSide(
                      color: primaryColor,
                      width: 1.0,
                    ),
                    primary: primaryColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10.0),
                    child: Text(
                      'Confirm',
                      style: TextStyle(color: Colors.white, fontSize: 14.0, fontFamily: 'tex'),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  final ScrollController _controllerOne = ScrollController();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var isCustomer = widget.title == 'Customer' ? true : false;

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
                              child: Row(
                                children: [
                                  Expanded(
                                    child: CustomTextFormFieldColumn(
                                      controller: name,
                                      title: '${widget.title} Name',
                                      maxLine: 1,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  isCustomer
                                      ? Container()
                                      : Expanded(
                                          child: CustomTextFormFieldColumn(
                                            controller: nickname,
                                            title: 'Nickname',
                                            maxLine: 1,
                                          ),
                                        ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: CustomTextFormFieldColumn(
                                      controller: phone,
                                      title: "${widget.title}'s Phone Number",
                                      maxLine: 1,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  isCustomer
                                      ? Container()
                                      : Expanded(
                                          child: CustomTextFormFieldColumnOverlay(
                                            maxLine: 1,
                                            controller: employee,
                                            title: 'Employee or Freelance',
                                            items: ['Employee', 'Freelance'],
                                            onTap: (v) {
                                              employee.text = v;
                                            },
                                          ),
                                        ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: CustomTextFormFieldColumn(
                                      controller: email,
                                      title: "${widget.title}'s Email",
                                      maxLine: 1,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  isCustomer
                                      ? Container()
                                      : Expanded(
                                          child: CustomTextFormFieldColumnOverlay(
                                            maxLine: 1,
                                            controller: rating,
                                            title: 'Expert Rating',
                                            items: ['1', '2', '3', '4', '5'],
                                            onTap: (v) {
                                              rating.text = v;
                                            },
                                          ),
                                        ),
                                ],
                              ),
                            ),
                            isCustomer
                                ? Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: CustomTextFormFieldColumn(
                                            controller: anniversary,
                                            title: 'Anniversary',
                                            maxLine: 1,
                                            onTap: () => customerDatePicker(
                                              title: 'Anniversary',
                                              cont: anniversary,
                                              screenSize: screenSize,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Expanded(
                                          child: CustomTextFormFieldColumnOverlay(
                                            maxLine: 1,
                                            controller: bloodGrp,
                                            title: 'Blood Group',
                                            items: ['A+', 'B+', 'O+', 'AB+', 'A-', 'B-', 'O-', 'AB-'],
                                            onTap: (v) {
                                              bloodGrp.text = v;
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                : Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: CustomTextFormFieldColumn(
                                            controller: pass,
                                            title: "Password",
                                            maxLine: 1,
                                            ob: true,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Expanded(
                                          child: CustomTextFormFieldColumn(controller: conPass, title: "Confirm Password", maxLine: 1, ob: true),
                                        ),
                                      ],
                                    ),
                                  ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: CustomTextFormFieldColumnOverlay(
                                      maxLine: 1,
                                      controller: gender,
                                      title: 'Gender',
                                      items: ['Male', 'Female'],
                                      height: 100,
                                      onTap: (v) {
                                        gender.text = v;
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  isCustomer
                                      ? Expanded(
                                          child: CustomTextFormFieldColumn(
                                              maxLine: 1,
                                              controller: dob,
                                              title: 'Date of birth',
                                              onTap: () => customerDatePicker(
                                                    title: 'Date of birth',
                                                    cont: dob,
                                                    screenSize: screenSize,
                                                  )),
                                        )
                                      : Expanded(
                                          child: CustomTextFormFieldColumn(
                                            controller: age,
                                            title: "${widget.title}'s Age",
                                            maxLine: 1,
                                          ),
                                        ),
                                ],
                              ),
                            ),
                            !isCustomer && gender.text == 'Female'
                                ? Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: CustomTextFormFieldColumn(
                                            controller: period,
                                            title: 'Expected Period Date(Next Month)',
                                            maxLine: 1,
                                            onTap: () => customerDatePicker(
                                              title: 'Pick Date for Next Month',
                                              cont: period,
                                              screenSize: screenSize,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Spacer()
                                      ],
                                    ),
                                  )
                                : Container(),
                            isCustomer
                                ? Container()
                                : Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: CustomTextFormFieldColumn(
                                            controller: expertise,
                                            title: 'Expertise',
                                            maxLine: 1,
                                            onTap: () {
                                              showMultiSelectExpertise(context);
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Expanded(
                                          child: CustomTextFormFieldColumn(
                                            controller: serviceablePin,
                                            title: 'Servicable Pincodes',
                                            maxLine: 1,
                                            onTap: () {
                                              showMultiSelectPincodes(context);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                            isCustomer
                                ? Container()
                                : Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: CustomTextFormFieldColumn(
                                            controller: experienceYear,
                                            title: 'Years of experience',
                                            maxLine: 1,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Expanded(
                                          child: CustomTextFormFieldColumnOverlay(
                                            maxLine: 1,
                                            controller: vehicle,
                                            title: 'Vehicle',
                                            items: ['2-Wheeler', '4-Wheeler', 'No'],
                                            height: 150,
                                            onTap: (v) {
                                              vehicle.text = v;
                                              setState(() {});
                                            },
                                          ),
                                        ),
                                        vehicle.text == '2-Wheeler' || vehicle.text == '4-Wheeler'
                                            ? SizedBox(
                                                width: 30,
                                              )
                                            : Container(),
                                        vehicle.text == '2-Wheeler' || vehicle.text == '4-Wheeler'
                                            ? Expanded(
                                                child: CustomTextFormFieldColumn(
                                                  controller: vehicleNo,
                                                  title: 'Vehicle Number',
                                                  maxLine: 1,
                                                ),
                                              )
                                            : Container(),
                                      ],
                                    ),
                                  ),
                            isCustomer
                                ? Container()
                                : Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: CustomTextFormFieldColumn(
                                            controller: aadhar,
                                            title: 'Aadhar Number',
                                            maxLine: 1,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Expanded(
                                          child: CustomTextFormFieldColumn(
                                            controller: pan,
                                            title: 'Pan Number',
                                            maxLine: 1,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                            isCustomer
                                ? Container()
                                : Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: CustomTextFormFieldColumn(
                                      controller: qualification,
                                      title: 'Latest Qualification',
                                      maxLine: 1,
                                    ),
                                  ),
                            isCustomer
                                ? Container()
                                : Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: CustomTextFormFieldColumn(
                                            controller: bankacct,
                                            title: 'Bank Account No.',
                                            maxLine: 1,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Expanded(
                                          child: CustomTextFormFieldColumn(
                                            controller: ifsc,
                                            title: 'IFSC',
                                            maxLine: 1,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Expanded(
                                          child: CustomTextFormFieldColumnOverlay(
                                            maxLine: 1,
                                            controller: bankName,
                                            title: 'Bank Name',
                                            items: banks,
                                            height: 170,
                                            onTap: (v) {
                                              bankName.text = v;
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                            !isCustomer
                                ? Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: NetworkImageSelector(
                                            title: 'Aadhar Front Image',
                                            setImage: (i) {
                                              aadharImage1 = i;
                                            },
                                            url: aadharImage1 ?? '',
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Flexible(
                                          child: NetworkImageSelector(
                                            title: 'Aadhar Back Image',
                                            setImage: (i) {
                                              aadharImage2 = i;
                                            },
                                            url: aadharImage2 ?? '',
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Flexible(
                                          child: NetworkImageSelector(
                                            title: 'Pan Image',
                                            setImage: (i) {
                                              panImage = i;
                                            },
                                            url: panImage ?? '',
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : Container(),
                            SizedBox(
                              height: 240,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
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
                                child: !isCustomer
                                    ? Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              'Availability',
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          ),
                                          CustomTextFormFieldColumnOverlay(
                                            maxLine: 1,
                                            controller: status,
                                            title: 'Status',
                                            items: ['Pending', 'Active', 'Suspend', 'Retired'],
                                            height: 200,
                                            onTap: (v) {
                                              status.text = v;
                                            },
                                          ),
                                        ],
                                      )
                                    : Container())
                          ],
                        ),
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
                        getItAdminCurrentPage.setIndex(isCustomer ? 6 : 7);
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
                              try {
                                setState(() {
                                  loadingBtn = true;
                                });
                                //////CUSTOMER//////CUSTOMER//////CUSTOMER//////CUSTOMER

                                if (isCustomer) {
                                  if (name.text.isNotEmpty &&
                                      phone.text.isNotEmpty &&
                                      email.text.isNotEmpty &&
                                      dob.text.isNotEmpty &&
                                      gender.text.isNotEmpty &&
                                      anniversary.text.isNotEmpty &&
                                      bloodGrp.text.isNotEmpty) {
                                    var parsedData = Customers(
                                      name: name.text,
                                      sex: gender.text,
                                      phone: phone.text,
                                      email: email.text,
                                      joinedDate: DateTime.now().toString(),
                                      dob: dob.text,
                                      anniversary: anniversary.text,
                                      bloodGrp: bloodGrp.text,
                                    ).toJson();
                                    print(parsedData);

                                    await API().addCustomer(parsedData);
                                    if (image != null) {
                                      print(MultipartFile.fromBytes(image.bytes as List<int>).runtimeType);
                                      await Dio().post('$baseURL/addCustomerProfilePic/${phone.text}', data: image.bytes);
                                    }
                                    setState(() {
                                      loadingBtn = false;
                                    });
                                    getItAdminCurrentPage.setIndex(6);
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
                                }
                                /////EXPERT/////EXPERT/////EXPERT/////EXPERT/////EXPERT/////EXPERT
                                else {
                                  if (name.text.isNotEmpty && phone.text.isNotEmpty) {
                                    await Dio().post('$baseURL/register_expert', data: {
                                      "name": name.text,
                                      "nickname": nickname.text,
                                      "sex": gender.text,
                                      "isEmployee": employee.text == "Freelancer" ? false : true,
                                      "phone": int.parse(phone.text),
                                      "email": email.text,
                                      "password": pass.text,
                                      "bankAccountName": bankName.text,
                                      "bankAccountNumber": int.parse(bankacct.text),
                                      "bankAccountIfsc": ifsc.text,
                                      "averageRating": int.parse(rating.text),
                                      "status": status.text.isEmpty ? 'Pending' : status.text,
                                      'serviceablePins': serviceablePin.text,
                                      'serviceList': expertise.text,
                                      'vehicle': vehicle.text,
                                      'vehicleNo': vehicleNo.text,
                                      "yearsOfExperience": int.parse(experienceYear.text),
                                      'aadharNo': int.parse(aadhar.text.isEmpty ? '0' : aadhar.text),
                                      'panNo': pan.text,
                                      'age': age.text,
                                      "qualification": qualification.text,
                                    });

                                    if (image != null) {
                                      await Dio().post('$baseURL/addExpertProfilePic/${phone.text}', data: image.bytes);
                                    }

                                    if (panImage != null) {
                                      await Dio().post('$baseURL/add_expert_pan/${phone.text}', data: panImage.bytes);
                                    }
                                    print('pan check');
                                    if (aadharImage1 != null && aadharImage2 != null) {
                                      await Dio().post('$baseURL/add_expert_aadhar/${phone.text}', data: [aadharImage1.bytes, aadharImage2.bytes]);
                                    }
                                    print('aadhar check');
                                    if (gender.text == 'Female') {
                                      await Dio().put('$baseURL/add_period/${phone.text}',
                                          queryParameters: {'thedatetime': DateFormat('dd, MMMM yyyy').parse(period.text)});
                                    }
                                    print('female check');

                                    await Dio().post('$baseURL/add_track', data: {
                                      "location": {
                                        "latitude": "18.552238",
                                        "longitude": "73.8881713",
                                      },
                                      "timeStamp": DateTime.now().toString(),
                                      "expertId": int.parse(phone.text)
                                    });
                                    print('loc check');

                                    setState(() {
                                      loadingBtn = false;
                                    });
                                    getItAdminCurrentPage.setIndex(7);
                                  } else {
                                    showTopSnackBar(
                                      context,
                                      CustomSnackBar.info(
                                        backgroundColor: primaryColor,
                                        message: "Please fill all the fields",
                                      ),
                                    );
                                    setState(() {
                                      loadingBtn = false;
                                    });
                                  }
                                }
                              } catch (e) {
                                print(e);
                                showTopSnackBar(
                                  context,
                                  CustomSnackBar.info(
                                    backgroundColor: primaryColor,
                                    message: "Something went wrong",
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

  void showMultiSelectExpertise(BuildContext context) async {
    final item = expertiseList.map((e) => MultiSelectItem(expertiseList.indexOf(e), e)).toList();
    await showDialog(
      context: context,
      builder: (ctx) {
        return MultiSelectDialog(
          itemsTextStyle: TextStyle(color: Colors.white),
          backgroundColor: midBlue,
          unselectedColor: Colors.white,
          selectedItemsTextStyle: TextStyle(color: primaryColor),
          width: MediaQuery.of(context).size.width / 4,
          searchable: true,
          selectedColor: primaryColor,
          height: MediaQuery.of(context).size.height / 2,
          items: item,
          initialValue: [],
          onConfirm: (values) {
            expertise.text = '';
            for (var d = 0; d < values.length; d++) {
              print(values[d].toString());
              expertise.text = expertise.text +
                  (expertise.text.isEmpty ? '' : ", ") +
                  expertiseList.elementAt(int.parse(values[d].toString())).toString().toUpperCase();
            }

            setState(() {
              print(expertise.text);
            });
          },
        );
      },
    );
  }

  void showMultiSelectPincodes(BuildContext context) async {
    final item = pinCodes.map((e) => MultiSelectItem(pinCodes.indexOf(e), e)).toList();
    await showDialog(
      context: context,
      builder: (ctx) {
        return Theme(
          data: ThemeData.dark(),
          child: MultiSelectDialog(
            itemsTextStyle: TextStyle(color: Colors.white),
            searchable: true,
            width: MediaQuery.of(context).size.width / 4,
            backgroundColor: midBlue,
            unselectedColor: Colors.white,
            selectedColor: primaryColor,
            selectedItemsTextStyle: TextStyle(color: primaryColor),
            height: MediaQuery.of(context).size.height / 2,
            items: item,
            initialValue: [],
            onConfirm: (values) {
              serviceablePin.text = '';
              for (var d = 0; d < values.length; d++) {
                print(values[d].toString());
                serviceablePin.text = serviceablePin.text +
                    (serviceablePin.text.isEmpty ? '' : ", ") +
                    pinCodes.elementAt(int.parse(values[d].toString())).toString().toUpperCase();
              }

              setState(() {
                print(serviceablePin.text);
              });
            },
          ),
        );
      },
    );
  }
}
