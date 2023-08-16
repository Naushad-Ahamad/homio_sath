import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hica_app/data/response/status.dart';
import 'package:hica_app/res/components/loader.dart';
import 'package:hica_app/res/components/roundButton.dart';
import 'package:hica_app/res/style/textStyle.dart';
import 'package:hica_app/utils/my_theme.dart';
import 'package:hica_app/utils/utils.dart';
import 'package:hica_app/view/screen/AddBillings/AddBillingAppbar.dart';
import 'package:hica_app/view/screen/AddStock/AddstockAppbar.dart';
import 'package:hica_app/view/widgets/noDataWidget.dart';
import 'package:hica_app/view/widgets/noInternetConnectionWidget.dart';
import 'package:hica_app/viewodel/StockListViewModel.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddBillingForm extends StatefulWidget {
  const AddBillingForm({Key? key}) : super(key: key);

  @override
  State<AddBillingForm> createState() => _AddBillingFormState();
}

class _AddBillingFormState extends State<AddBillingForm> {
  var isLoading = false;
  String userid = '',
      password = '',
      email = '',
      dropDownValue = "",
      roleid = "";
  List<String> role = [];
  StockListViewModel viewModel = StockListViewModel();
  TextEditingController nameController = new TextEditingController();
  TextEditingController RoleController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController passController = new TextEditingController();

  bool nameValidation = false,
      roleValidation = false,
      phoneValidation = false,
      emailValidation = false,
      passValidation = false,
      confirmPassValidation = false;

  @override
  void initState() {

    //viewModel.getRoleDataAPI();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor:
          MyTheme.white, //or set color with: Color(0xFF0000FF)
    ));
    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AddBillingAppbar.appBar(
              340, MyTheme.white, context, 'Add New Bill', true),
          body: Stack(
            children: [
              Container(
                  padding: const EdgeInsets.all(5.0),
                  child: ChangeNotifierProvider.value(
                    value: viewModel,
                    child: Consumer<StockListViewModel>(
                      builder: (context, value, child) {
                        switch (viewModel.model.status) {
                          case Status.LOADING:
                            return ListView(
                                scrollDirection: Axis.vertical,
                                children: [
                                  Center(
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                                      child: Column(
                                        children: [
                                          Container(
                                           margin: EdgeInsets.fromLTRB(15, 2, 15, 2),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                    top: 10.0),
                                              child: TextField(
                                                controller: nameController,
                                                keyboardType: TextInputType.text,
                                                textCapitalization:
                                                TextCapitalization.words,
                                                style: GoogleFonts.notoSans(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500),
                                                decoration: InputDecoration(
                                                    errorText: nameValidation
                                                        ? 'Medicine Amounts  is required'
                                                        : null,
                                                    border: OutlineInputBorder(),
                                                    labelText: 'Medicine Amounts',
                                                    hintStyle:
                                                    CustomeText.editStyle,
                                                    labelStyle:
                                                    CustomeText.editStyle,
                                                    hintText:
                                                    'Enter Medicine Amounts'),
                                              ),
                                            ),
                                          ),
                                          Container(
                                           margin: EdgeInsets.fromLTRB(15, 2, 15, 2),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                    top: 10.0),
                                              child: TextField(
                                                controller: nameController,
                                                keyboardType: TextInputType.text,
                                                textCapitalization:
                                                TextCapitalization.words,
                                                style: GoogleFonts.notoSans(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500),
                                                decoration: InputDecoration(
                                                    errorText: nameValidation
                                                        ? 'Appointment Fee  is required'
                                                        : null,
                                                    border: OutlineInputBorder(),
                                                    labelText: 'Enter Appointment Fee',
                                                    hintStyle:
                                                    CustomeText.editStyle,
                                                    labelStyle:
                                                    CustomeText.editStyle,
                                                    hintText:
                                                    'Enter Appointment Fee'),
                                              ),
                                            ),
                                          ),
                                          Container(
                                           margin: EdgeInsets.fromLTRB(15, 2, 15, 2),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                    top: 10.0),
                                              child: TextField(
                                                controller: nameController,
                                                keyboardType: TextInputType.text,
                                                textCapitalization:
                                                TextCapitalization.words,
                                                style: GoogleFonts.notoSans(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500),
                                                decoration: InputDecoration(
                                                    errorText: nameValidation
                                                        ? 'Discount  is required'
                                                        : null,
                                                    border: OutlineInputBorder(),
                                                    labelText: 'Enter Discount',
                                                    hintStyle:
                                                    CustomeText.editStyle,
                                                    labelStyle:
                                                    CustomeText.editStyle,
                                                    hintText:
                                                    'Enter Discount'),
                                              ),
                                            ),
                                          ),
                                          Container(
                                           margin: EdgeInsets.fromLTRB(15, 2, 15, 2),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                    top: 10.0),
                                              child: TextField(
                                                controller: nameController,
                                                keyboardType: TextInputType.text,
                                                textCapitalization:
                                                TextCapitalization.words,
                                                style: GoogleFonts.notoSans(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500),
                                                decoration: InputDecoration(
                                                    errorText: nameValidation
                                                        ? 'Price  is required'
                                                        : null,
                                                    border: OutlineInputBorder(),
                                                    labelText: 'Enter Price',
                                                    hintStyle:
                                                    CustomeText.editStyle,
                                                    labelStyle:
                                                    CustomeText.editStyle,
                                                    hintText:
                                                    'Enter Price'),
                                              ),
                                            ),
                                          ),
                                          Container(
                                           margin: EdgeInsets.fromLTRB(15, 2, 15, 2),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                    top: 10.0),
                                              child: TextField(
                                                controller: nameController,
                                                keyboardType: TextInputType.text,
                                                textCapitalization:
                                                TextCapitalization.words,
                                                style: GoogleFonts.notoSans(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500),
                                                decoration: InputDecoration(
                                                    errorText: nameValidation
                                                        ? 'Quantity  is required'
                                                        : null,
                                                    border: OutlineInputBorder(),
                                                    labelText: 'Enter Quantity',
                                                    hintStyle:
                                                    CustomeText.editStyle,
                                                    labelStyle:
                                                    CustomeText.editStyle,
                                                    hintText:
                                                    'Enter Quantity'),
                                              ),
                                            ),
                                          ),
                                          Container(
                                           margin: EdgeInsets.fromLTRB(15, 2, 15, 2),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                    top: 10.0),
                                              child: TextField(
                                                controller: nameController,
                                                keyboardType: TextInputType.text,
                                                textCapitalization:
                                                TextCapitalization.words,
                                                style: GoogleFonts.notoSans(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500),
                                                decoration: InputDecoration(
                                                    errorText: nameValidation
                                                        ? 'Available Quantity  is required'
                                                        : null,
                                                    border: OutlineInputBorder(),
                                                    labelText: 'Enter Available Quantity',
                                                    hintStyle:
                                                    CustomeText.editStyle,
                                                    labelStyle:
                                                    CustomeText.editStyle,
                                                    hintText:
                                                    'Enter Available Quantity'),
                                              ),
                                            ),
                                          ),
                                          Container(
                                           margin: EdgeInsets.fromLTRB(15, 2, 15, 2),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                    top: 10.0),
                                              child: TextField(
                                                controller: nameController,
                                                keyboardType: TextInputType.text,
                                                textCapitalization:
                                                TextCapitalization.words,
                                                style: GoogleFonts.notoSans(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500),
                                                decoration: InputDecoration(
                                                    errorText: nameValidation
                                                        ? 'Selling Quantity  is required'
                                                        : null,
                                                    border: OutlineInputBorder(),
                                                    labelText: 'Enter Selling Quantity',
                                                    hintStyle:
                                                    CustomeText.editStyle,
                                                    labelStyle:
                                                    CustomeText.editStyle,
                                                    hintText:
                                                    'Enter Selling Quantity'),
                                              ),
                                            ),
                                          ),



                                          Container(
                                            margin: EdgeInsets.fromLTRB(15.0, 70.0, 15.0, 5.0),
                                            child: RoundButton(
                                              title: 'Submit',
                                              color: 0xFF39053B,
                                              textColor: 0xFFFFFFFF,
                                              onPress: (){

                                              }
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ]);/* const Center(
                              child: Loader(),
                            );*/
                          case Status.ERROR:
                            return Container(
                                margin: EdgeInsets.only(top: 110),
                                child: Center(
                                  child: value.model.message.toString() ==
                                          'Error During Communication'
                                      ? NoInternetWidget()
                                      : NoDataWidget(),
                                ));
                          case Status.COMPLETED:
                            return ListView(
                                scrollDirection: Axis.vertical,
                                children: [
                                  Container(
                                   margin: EdgeInsets.fromLTRB(15, 2, 15, 2),
                                    child: Column(
                                      children: [
                                        Container(
                                         margin: EdgeInsets.fromLTRB(15, 2, 15, 2),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                  top: 10.0),
                                            child: TextField(
                                              controller: nameController,
                                              keyboardType: TextInputType.text,
                                              textCapitalization:
                                                  TextCapitalization.words,
                                              style: GoogleFonts.notoSans(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                              decoration: InputDecoration(
                                                  errorText: nameValidation
                                                      ? 'Name  is required'
                                                      : null,
                                                  border: OutlineInputBorder(),
                                                  labelText: 'Employee Name',
                                                  hintStyle:
                                                      CustomeText.editStyle,
                                                  labelStyle:
                                                      CustomeText.editStyle,
                                                  hintText:
                                                      'Enter Employee Name'),
                                            ),
                                          ),
                                        ),
                                        Container(
                                         margin: EdgeInsets.fromLTRB(15, 2, 15, 2),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                  top: 10.0),
                                            child: TextField(
                                              controller: nameController,
                                              keyboardType: TextInputType.text,
                                              textCapitalization:
                                                  TextCapitalization.words,
                                              style: GoogleFonts.notoSans(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                              decoration: InputDecoration(
                                                  errorText: nameValidation
                                                      ? 'Medicine  Name  is required'
                                                      : null,
                                                  border: OutlineInputBorder(),
                                                  labelText: 'Enter Medicine  Name',
                                                  hintStyle:
                                                      CustomeText.editStyle,
                                                  labelStyle:
                                                      CustomeText.editStyle,
                                                  hintText:
                                                      'Enter Medicine  Name'),
                                            ),
                                          ),
                                        ),
                                        Container(
                                         margin: EdgeInsets.fromLTRB(15, 2, 15, 2),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                  top: 10.0),
                                            child: TextField(
                                              controller: nameController,
                                              keyboardType: TextInputType.text,
                                              textCapitalization:
                                              TextCapitalization.words,
                                              style: GoogleFonts.notoSans(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                              decoration: InputDecoration(
                                                  errorText: nameValidation
                                                      ? 'Expiry Date  is required'
                                                      : null,
                                                  border: OutlineInputBorder(),
                                                  labelText: 'Expiry Date',
                                                  hintStyle:
                                                  CustomeText.editStyle,
                                                  labelStyle:
                                                  CustomeText.editStyle,
                                                  hintText:
                                                  'Enter Expiry Date'),
                                            ),
                                          ),
                                        ),
                                        Container(
                                         margin: EdgeInsets.fromLTRB(15, 2, 15, 2),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                  top: 10.0),
                                            child: TextField(
                                              controller: nameController,
                                              keyboardType: TextInputType.text,
                                              textCapitalization:
                                              TextCapitalization.words,
                                              style: GoogleFonts.notoSans(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                              decoration: InputDecoration(
                                                  errorText: nameValidation
                                                      ? 'Price  is required'
                                                      : null,
                                                  border: OutlineInputBorder(),
                                                  labelText: 'Enter Price',
                                                  hintStyle:
                                                  CustomeText.editStyle,
                                                  labelStyle:
                                                  CustomeText.editStyle,
                                                  hintText:
                                                  'Enter Price'),
                                            ),
                                          ),
                                        ),
                                        Container(
                                         margin: EdgeInsets.fromLTRB(15, 2, 15, 2),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                  top: 10.0),
                                            child: TextField(
                                              controller: nameController,
                                              keyboardType: TextInputType.text,
                                              textCapitalization:
                                              TextCapitalization.words,
                                              style: GoogleFonts.notoSans(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                              decoration: InputDecoration(
                                                  errorText: nameValidation
                                                      ? 'Quantity  is required'
                                                      : null,
                                                  border: OutlineInputBorder(),
                                                  labelText: 'Enter Quantity',
                                                  hintStyle:
                                                  CustomeText.editStyle,
                                                  labelStyle:
                                                  CustomeText.editStyle,
                                                  hintText:
                                                  'Enter Quantity'),
                                            ),
                                          ),
                                        ),
                                        Container(
                                         margin: EdgeInsets.fromLTRB(15, 2, 15, 2),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                  top: 10.0),
                                            child: TextField(
                                              controller: nameController,
                                              keyboardType: TextInputType.text,
                                              textCapitalization:
                                              TextCapitalization.words,
                                              style: GoogleFonts.notoSans(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                              decoration: InputDecoration(
                                                  errorText: nameValidation
                                                      ? 'Available Quantity  is required'
                                                      : null,
                                                  border: OutlineInputBorder(),
                                                  labelText: 'Enter Available Quantity',
                                                  hintStyle:
                                                  CustomeText.editStyle,
                                                  labelStyle:
                                                  CustomeText.editStyle,
                                                  hintText:
                                                  'Enter Available Quantity'),
                                            ),
                                          ),
                                        ),
                                        Container(
                                         margin: EdgeInsets.fromLTRB(15, 2, 15, 2),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                  top: 10.0),
                                            child: TextField(
                                              controller: nameController,
                                              keyboardType: TextInputType.text,
                                              textCapitalization:
                                              TextCapitalization.words,
                                              style: GoogleFonts.notoSans(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                              decoration: InputDecoration(
                                                  errorText: nameValidation
                                                      ? 'Selling Quantity  is required'
                                                      : null,
                                                  border: OutlineInputBorder(),
                                                  labelText: 'Enter Selling Quantity',
                                                  hintStyle:
                                                  CustomeText.editStyle,
                                                  labelStyle:
                                                  CustomeText.editStyle,
                                                  hintText:
                                                  'Enter Selling Quantity'),
                                            ),
                                          ),
                                        ),



                                      ],
                                    ),
                                  ),
                                ]);
                        }
                      },
                    ),
                  ))
            ],
          ),
        ),
        ChangeNotifierProvider<StockListViewModel>.value(
            value: viewModel,
            child:
                Consumer<StockListViewModel>(builder: (context, value, _) {
              return viewModel.regLoading
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
