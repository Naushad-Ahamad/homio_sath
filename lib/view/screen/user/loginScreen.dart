import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hica_app/utils/routes/routes_name.dart';
import 'package:provider/provider.dart';

import '../../../res/components/loader.dart';
import '../../../res/components/roundButton.dart';
import '../../../res/style/textStyle.dart';
import '../../../viewodel/authViewModel.dart';

/**
 * Created by Vikash Kumar Bharti on 12-05-2023.
 * Designation : Flutter & Android Developer
 * Company Name : 18 Pixels India Pvt. Ltd
 * Email Id : vikash.18pixels@gmail.com
 */
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passVisible = false;
  var isLoading = false;
  bool emailValidation = false, passValidation = false;
  TextEditingController emailController = new TextEditingController();
  TextEditingController passController = new TextEditingController();
  AuthViewModel loginViewModel = AuthViewModel();
  @override
  void initState() {
    super.initState();
    passVisible = false;
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                  padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                  width: double.maxFinite,
                  height: double.maxFinite,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(15.0, 70.0, 15.0, 5.0),
                        child: Image.asset('assets/images/ic_homeosathi.jpg',
                            width: 180, height: 160),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: TextField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              errorText: emailValidation
                                  ? 'Email or Username is required'
                                  : null,
                              border: OutlineInputBorder(),
                              labelText: 'Email or Username',
                              hintStyle: CustomeText.editStyle,
                              labelStyle: CustomeText.editStyle,
                              hintText: 'Enter Email or Username'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: TextField(
                          controller: passController,
                          obscureText: !passVisible ? true : false,
                          decoration: InputDecoration(
                              errorText:
                                  passValidation ? 'Password required' : null,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  passVisible
                                      ? setState(() {
                                          passVisible = false;
                                        })
                                      : setState(() {
                                          passVisible = true;
                                        });
                                },
                                icon: Icon(!passVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              ),
                              // errorText: postalValidator ? 'Postal Code  is required' : null,
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                              hintStyle: CustomeText.editStyle,
                              labelStyle: CustomeText.editStyle,
                              hintText: 'Enter Password'),
                        ),
                      ),
                      Container(
                        width: double.maxFinite,
                        margin: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 5.0),
                        child: Text(
                          'Forgot your password?',
                          textAlign: TextAlign.right,
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(15.0, 70.0, 15.0, 5.0),
                        child: RoundButton(
                          title: 'Log in',
                          color: 0xFF39053B,
                          textColor: 0xFFFFFFFF,
                            onPress: () {
                            if (emailController.text == null ||
                                emailController.text == '') {
                              setState(() {
                                emailController.text.isEmpty
                                    ? emailValidation = true
                                    : emailValidation = false;
                              });
                            } else if (passController.text == null ||
                                passController.text == '') {
                              setState(() {
                                emailController.text.isEmpty
                                    ? emailValidation = true
                                    : emailValidation = false;
                                passController.text.isEmpty
                                    ? passValidation = true
                                    : passValidation = false;
                              });
                            } else {
                              setState(() {
                                isLoading = true;
                                emailController.text.isEmpty
                                    ? emailValidation = true
                                    : emailValidation = false;
                                passController.text.isEmpty
                                    ? passValidation = true
                                    : passValidation = false;
                              });
                              final data = json.encode({
                                "email": emailController.text,
                                "password": passController.text,
                              });
                              loginViewModel.getLogin(data, context);
                            }
                          },
                        /*  onPress: () {
                            Navigator.pushNamedAndRemoveUntil(context,
                                RoutesName.homeContainer, (route) => false);
                          },*/
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
        ChangeNotifierProvider<AuthViewModel>.value(
            value: loginViewModel,
            child: Consumer<AuthViewModel>(builder: (context, value, _) {
              return loginViewModel.loading
                  ? Center(
                      child: new ClipRect(
                        child: new BackdropFilter(
                          filter:
                              new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                          child: new Container(
                            width: double.maxFinite,
                            height: double.maxFinite,
                            decoration: new BoxDecoration(
                                color: Colors.black26.withOpacity(0.55)),
                            child: new Center(child: Loader()),
                          ),
                        ),
                      ),
                    )
                  : Container();
            })),
      ],
    );
  }
}
