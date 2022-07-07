import 'package:elie_admin/Responsive%20Dashboard/constants.dart';
import 'package:elie_admin/Screen/HomePage/HomePage.dart';
import 'package:elie_admin/Screen/Login/CustomTextField.dart';
import 'package:elie_admin/Utils/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController userNameController;
  late TextEditingController passwordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userNameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    void checkLogin() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      if (userNameController.text == 'admin@elie.world' &&
          passwordController.text == 'elie@123') {
        EasyLoading.showSuccess('Login Successful');

        var initialIndex = prefs.getInt('pageIndex');

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => HomePage(
              initialIndex: initialIndex,
            ),
          ),
        );

        prefs.setBool('isLoggedIn', true);
      } else {
        EasyLoading.showError(
          'Username or Password is incorrect',
        );

        prefs.setBool('isLoggedIn', false);
      }
    }

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: midBlue,
        elevation: 2,
        title: Text('Ellie Admin'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: 350,
          width: 500,
          decoration: BoxDecoration(border: Border.all(color: highLcolorDark)),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 16,
              bottom: 16,
              right: 24,
              left: 24,
            ),
            child: Column(
              children: [
                Text(
                  'Login',
                  style: TextStyle(
                    color: Color(0xffFFA075),
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    letterSpacing: 1.0,
                    fontFamily: 'NT',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  title: 'User Name',
                  onSuffixPress: () {},
                  cont: userNameController,
                  type: TextInputType.emailAddress,
                ),
                CustomTextField(
                  title: 'Password',
                  type: TextInputType.visiblePassword,
                  onSuffixPress: () {},
                  cont: passwordController,
                ),
                SizedBox(
                  height: 20,
                ),
                OutlinedButton(
                  onPressed: checkLogin,
                  style: OutlinedButton.styleFrom(
                    elevation: 2,
                    fixedSize: Size.fromHeight(45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: highLcolorLight,
                      fontSize: 16,
                      fontFamily: 'NT',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
