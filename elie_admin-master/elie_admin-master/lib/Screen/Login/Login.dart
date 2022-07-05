import 'package:elie_admin/Responsive%20Dashboard/constants.dart';
import 'package:elie_admin/Screen/HomePage/HomePage.dart';
import 'package:elie_admin/Screen/Login/CustomTextField.dart';
import 'package:elie_admin/Utils/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

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
    void checkLogin() {
      if (userNameController.text == 'admin@elie.world' &&
          passwordController.text == 'elie@123') {
        EasyLoading.showSuccess('Login Successful');
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      } else {
        EasyLoading.showError(
          'Username or Password is incorrect',
        );
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
      body: Column(
        children: [
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
          ElevatedButton(onPressed: checkLogin, child: Text('Login')),
        ],
      ),
    );
  }
}
