import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hica_app/res/components/loader.dart';
import 'package:hica_app/res/components/roundButton.dart';
import 'package:hica_app/utils/my_theme.dart';
import 'package:hica_app/view/screen/AddStock/AddstockAppbar.dart';
import 'package:hica_app/viewodel/StockListViewModel.dart';
import 'package:provider/provider.dart';

class AddVitalForm extends StatefulWidget {
  const AddVitalForm({Key? key}) : super(key: key);

  @override
  State<AddVitalForm> createState() => _AddVitalFormState();
}

class _AddVitalFormState extends State<AddVitalForm> {
  var isLoading = false;
  String userid = '',
      password = '',
      email = '',
      dropDownValue = "",
      roleid = "";
  DateTime selectedDate = DateTime.now();

  List<String> role = [];
  StockListViewModel viewModel = StockListViewModel();
  TextEditingController firstnameController = new TextEditingController();
  TextEditingController lastnameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController mobnoController = new TextEditingController();
  TextEditingController dobController = new TextEditingController();
  TextEditingController uuidController = new TextEditingController();

  bool nameValidation = false,
      roleValidation = false,
      phoneValidation = false,
      emailValidation = false,
      passValidation = false,
      confirmPassValidation = false;

  String? gender = "Male";
  @override
  void initState() {
    //viewModel.getRoleDataAPI();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: MyTheme.white, //or set color with: Color(0xFF0000FF)
    ));
    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AddstockAppbar.appBar(
              340, MyTheme.white, context, 'Add Vital', true),
          body: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              margin: EdgeInsets.all(12.0),
              child: buildFormColumn(context)),
        ),
        ChangeNotifierProvider<StockListViewModel>.value(
            value: viewModel,
            child: Consumer<StockListViewModel>(builder: (context, value, _) {
              return viewModel.regLoading
                  ? Center(
                      child: ClipRect(
                        child: new BackdropFilter(
                          filter:
                              new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                          child: new Container(
                            width: double.maxFinite,
                            height: double.maxFinite,
                            decoration: new BoxDecoration(
                                color: Colors.black26.withOpacity(0.55)),
                            child: new Center(child: const Loader()),
                          ),
                        ),
                      ),
                    )
                  : Container();
            })),
      ],
    );
  }

  Column buildFormColumn(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: MyTheme.white, width: 1),
              ),
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    new BoxShadow(
                      color: Color(0xFFF5F3F3),
                    ),
                  ],
                ),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: firstnameController,
                  //This will obscure text dynamically
                  decoration: const InputDecoration(
                    hintText: 'Sugar',
                    /* icon: ImageIcon(
                      AssetImage('assets/images/wwweb.png'),
                      size: 20,
                      color: Color(0xFFB88231),
                    ),*/
                    hintStyle: TextStyle(color: Colors.black45, fontSize: 15),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
              )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: MyTheme.white, width: 1),
              ),
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    new BoxShadow(
                      color: Color(0xFFF5F3F3),
                    ),
                  ],
                ),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: lastnameController,
                  //This will obscure text dynamically
                  decoration: const InputDecoration(
                    hintText: 'Temperature',
                    /* icon: ImageIcon(
                      AssetImage('assets/images/wwweb.png'),
                      size: 20,
                      color: Color(0xFFB88231),
                    ),*/
                    hintStyle: TextStyle(color: Colors.black45, fontSize: 15),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
              )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: MyTheme.white, width: 1),
              ),
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    new BoxShadow(
                      color: Color(0xFFF5F3F3),
                    ),
                  ],
                ),
                child: TextFormField(
                  keyboardType: TextInputType.number,

                  controller: uuidController,
                  //This will obscure text dynamically
                  decoration: const InputDecoration(
                    hintText: 'Blood Presure',
                    hintStyle: TextStyle(color: Colors.black45, fontSize: 15),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
              )),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(15.0, 70.0, 15.0, 5.0),
          child: RoundButton(
              title: 'Save Vital',
              color: 0xFF39053B,
              textColor: 0xFFFFFFFF,
              onPress: () async {
                Navigator.pop(context);
              }),
        )
      ],
    );
  }
}
