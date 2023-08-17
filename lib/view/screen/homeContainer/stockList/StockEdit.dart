import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hica_app/data/network/appConfig.dart';
import 'package:hica_app/data/response/status.dart';
import 'package:hica_app/model/StockFormResponse.dart';
import 'package:hica_app/model/favorite/StockResponse.dart';
import 'package:hica_app/res/components/loader.dart';
import 'package:hica_app/res/components/roundButton.dart';
import 'package:hica_app/utils/my_theme.dart';
import 'package:hica_app/utils/routes/routes_name.dart';
import 'package:hica_app/utils/utils.dart';
import 'package:hica_app/view/screen/AddStock/AddStockFrom.dart';
import 'package:hica_app/view/screen/AddStock/AddStockFrom.dart';
import 'package:hica_app/view/screen/AddStock/AddstockAppbar.dart';
import 'package:hica_app/view/widgets/noDataWidget.dart';
import 'package:hica_app/view/widgets/noInternetConnectionWidget.dart';
import 'package:hica_app/viewodel/StockListViewModel.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditStockForm extends StatefulWidget {
  const EditStockForm({Key? key}) : super(key: key);

  @override
  State<EditStockForm> createState() => _EditStockFormState();
}

class _EditStockFormState extends State<EditStockForm> {
  var isLoading = false;
  String userid = '',
      password = '',
      email = '',
      dropDownValue = "",
      roleid = "";
  DateTime selectedDate = DateTime.now();

  List<String> role = [];
  StockListViewModel viewModel = StockListViewModel();
  TextEditingController nameController = new TextEditingController();
  TextEditingController medicineNameController = new TextEditingController();
  TextEditingController expirydateController = new TextEditingController();
  TextEditingController priceController = new TextEditingController();
  TextEditingController quantityController = new TextEditingController();
  TextEditingController availaveQutatityController =
      new TextEditingController();
  TextEditingController sellingController = new TextEditingController();

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

  String selectedValue = 'Liquid Preparation';
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
              340, MyTheme.white, context, 'Add Stock', true),
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
                                      margin:
                                          EdgeInsets.fromLTRB(20, 10, 20, 0),
                                      child: Column(
                                        children: [
                                          buildFormColumn(context),
                                        ],
                                      ),
                                    ),
                                  ),
                                ]);
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
                                      children: [],
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
            child: Consumer<StockListViewModel>(builder: (context, value, _) {
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
                  keyboardType: TextInputType.text,
                  controller: medicineNameController,
                  //This will obscure text dynamically
                  decoration: const InputDecoration(
                    hintText: 'Medicine Name',
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
              height: 60,
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
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    width: double.minPositive,
                    margin: EdgeInsets.symmetric(horizontal: 2.0),
                    padding: EdgeInsets.symmetric(horizontal: 6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        new BoxShadow(
                          color: Color(0xFFF5F3F3),
                        ),
                      ],
                    ),
                    child: TextFormField(
                        keyboardType: TextInputType.text,
                        style: TextStyle(color: Colors.black, fontSize: 13),
                        controller: expirydateController,
                        enabled: false,
                        //This will obscure text dynamically
                        decoration: InputDecoration(
                          hintText: 'Expiry Date',
                          suffixIcon: Padding(
                            padding: EdgeInsets.all(5.0),
                            // add padding to adjust icon
                            child: Icon(Icons.keyboard_arrow_down_outlined,
                                size: 30, color: MyTheme.yellowBrown),
                          ),
                          hintStyle:
                              TextStyle(color: Colors.black45, fontSize: 15),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        )),
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

                  controller: priceController,
                  //This will obscure text dynamically
                  decoration: const InputDecoration(
                    hintText: 'Enter Price ',
                    /*   counterText: "",
                    icon: ImageIcon(
                      AssetImage('assets/images/ic_group.png'),
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

                  controller: quantityController,
                  //This will obscure text dynamically
                  decoration: const InputDecoration(
                    hintText: 'Enter Quantity',
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

                  controller: availaveQutatityController,
                  //This will obscure text dynamically
                  decoration: const InputDecoration(
                    hintText: 'Enter Available  Quantity',
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

                  controller: sellingController,
                  //This will obscure text dynamically
                  decoration: const InputDecoration(
                    hintText: 'Enter Selling  Quantity',
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
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
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
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                hint: const Text(
                  'Category',
                  style: TextStyle(color: Colors.black45, fontSize: 15),
                ),
                style: const TextStyle(color: Colors.black45, fontSize: 15),
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  size: 30,
                  color: MyTheme.yellowBrown,
                ),
                value: selectedValue,
                onChanged: (newValue) {
                  setState(() {
                    selectedValue = newValue!;
                  });
                },
                items: <String>[
                  'Liquid Preparation',
                  'Tablet Preparation',
                  'Powder',
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(15.0, 70.0, 15.0, 5.0),
          child: RoundButton(
              title: 'Edit Stock',
              color: 0xFF39053B,
              textColor: 0xFFFFFFFF,
              onPress: () async {}),
        )
      ],
    );
  }
}
