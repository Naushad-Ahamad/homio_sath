import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hica_app/repository/SymptomRepository.dart';
import 'package:hica_app/res/style/colors.dart';

import 'package:hica_app/res/components/roundHeaderButton.dart';
import 'package:hica_app/utils/routes/routes_name.dart';
import 'package:hica_app/view/widgets/SymptomAppBar.dart';

class SymptomListScreen extends StatefulWidget {
  const SymptomListScreen({Key? key}) : super(key: key);

  @override
  State<SymptomListScreen> createState() => _SymptomListScreenState();
}

class _SymptomListScreenState extends State<SymptomListScreen> {
  SymptomRepository viewModel = SymptomRepository();

  @override
  void initState() {
    //viewModel.listing();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white, //or set color with: Color(0xFF0000FF)
    ));
    GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
  /*    appBar: SymptomAppBar.appBar(statusBarHeight, Colors.white, context,
          'Symptom', true, false, false, true, false),*/
      appBar: buildAdAppBar(statusBarHeight, context),
      body: /*Container(
          key: _scaffoldKey,
          padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
          child: ChangeNotifierProvider.value(
            value: viewModel,
            child: Consumer<SymptomRepository>(
              builder: (context, value, child) {
                switch (viewModel.model.status) {
                  case Status.LOADING:
                    return Center(
                      child: Loader(),
                    );
                  case Status.ERROR:
                    return Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Center(
                          child: value.model.message.toString() ==
                              'Error During Communication'
                              ? NoInternetWidget()
                              : NoDataWidget(),
                        ));
                  case Status.COMPLETED:
                    return */
          ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              /*Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ServiceDetailScreen(
                                    id: value.model.data!.data![index].id
                                        .toString());
                              }));*/
            },
            child: Container(
              padding: const EdgeInsets.all(10.0),
              color: Color(appColors.colorBackground),

              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                       /*   Card(
                              child: CachedNetworkImage(
                            imageUrl: "",
                            height: 60,
                            width: 60,
                            errorWidget: (context, url, error) => Container(
                                height: 60,
                                width: 60,
                                padding: const EdgeInsets.all(0.0),
                                child:
                                    Image.asset('assets/images/homeosathi.jpg')),
                          )),*/
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Symptoms",
                                    style: GoogleFonts.montserrat(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.0175,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    "Test",
                                    style: GoogleFonts.montserrat(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.0145,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.blueAccent),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Theme(
                              data: Theme.of(context).copyWith(
                                cardColor: Colors.transparent,
                              ),
                              child: PopupMenuButton<int>(
                                constraints:
                                    BoxConstraints.expand(width: 80, height: 170),
                                onSelected: (item) => handleClick(item, index),
                                offset: Offset(30, 30),
                                elevation: 0,
                                itemBuilder: (context) => [

                                  PopupMenuItem<int>(
                                      value: 0,
                                      child: Card(
                                          color: Colors.blueAccent,
                                          child: Padding(
                                            padding: EdgeInsets.all(4.0),
                                            child: Icon(Icons.edit_outlined,
                                                color: Colors.white),
                                          ))),
                                  PopupMenuItem<int>(
                                      value: 1,
                                      child: Card(
                                          color: Colors.blue,
                                          child: Padding(
                                            padding: EdgeInsets.all(4.0),
                                            child: Icon(
                                              Icons.delete_outline,
                                              color: Colors.white,
                                            ),
                                          ))),
                                ],
                              )),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6.0, bottom: 6.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10.0, 1.0, 20.0, 0.0),
                              child: Text(
                                "family History",
                                style: GoogleFonts.montserrat(
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.0175,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Text(
                              "Prescription",
                              style: GoogleFonts.montserrat(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.0175,
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(10.0, 0.0, 20.0, 1.0),
                            child: Text(
                              "Test",
                              style: GoogleFonts.montserrat(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.0175,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Text(
                            "Test",
                            style: GoogleFonts.montserrat(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.0175,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    /*  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 1.0),
                            child: Text(
                              "Status",
                              style: GoogleFonts.montserrat(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.0175,
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Text(
                            "Total Reviews",
                            style: GoogleFonts.montserrat(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.0175,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),*/
                     /* Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Inactive',
                              style: GoogleFonts.montserrat(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.0175,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  10.0, 10.0, 20.0, 1.0),
                              child: Text(
                                "",
                                style: GoogleFonts.montserrat(
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.0175,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),*/
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: 2,
      ),
      /*  }
              },
            ),
          )),*/
    );
  }
}

Future<void> handleClick(int item, int index) async {
  switch (item) {
    /*  case 0:
        break;*/
    case 0:
      //  Navigator.pushNamed(context, RoutesName.PersonaldetailsForm);
      break;
    case 1:
      /*showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Align(
              alignment: Alignment.center,
              child: Text(
                'Delete',
                style: GoogleFonts.montserrat(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Are you sure you want to Delete!',
                  style: TextStyle(
                    // fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MaterialButton(
                      color: Colors.grey,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    MaterialButton(
                      color: MyTheme.yellowBrown,
                      onPressed: () async {
                        SharedPreferences sharedPref =
                        await SharedPreferences.getInstance();
                        print("dgdggdh" +
                            sharedPref.getString("userId").toString());
                        final data = json.encode({
                          "provider_id":
                          sharedPref.getString("userId").toString(),
                          "service_id": list![index].id.toString(),
                          //"service_id": data[item-1].id.toString(),
                        });
                        viewModel.getDelete(data, context);
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Confirm',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ));*/
      break;
    /* default:
        Navigator.pushNamed(context, RoutesName.addNewCourseForm);*/
  }


}
AppBar buildAdAppBar(double statusBarHeight, BuildContext context) {
  return AppBar(

    elevation: 3.0,
    titleSpacing: 0,
    backgroundColor: Colors.white,
    leadingWidth: 200,
    leading:  Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Text(
          "Symptom List",
          style: GoogleFonts.montserrat(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w600),
        ),
      ),
    ),
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(20),
      child:  Align(
        alignment: Alignment.centerLeft,
        child:  Container(
          margin: EdgeInsets.fromLTRB(15, 0, 0, 10),
          padding: EdgeInsets.fromLTRB(15, 5, 0, 10),
          decoration: BoxDecoration(
              color: Color(0xFF39053B),
              borderRadius: BorderRadius.circular(5.0)
          ),
          height: 35,
          width: 150,
          child: Align(
            alignment: Alignment.center,
            child: InkWell(
              onTap: (){
              /*  Navigator.pushNamed(
                    context, RoutesName.addSymptomForm);*/
              },
              child: Row(
                children: [
                  Icon(Icons.add,
                      size: 20, color: Colors.white),
                  Text(
                      "Add Symptoms",
                      style: GoogleFonts.notoSans(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 14
                      )
                  ),
                ],
              ),
            ),
          ),
        ),



      ),
    ),

    actions: [


      Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: InkWell(
          onTap: () {

          },
          child: Icon(
            Icons.search,
            color: Colors.black,
            size: 25,
          ),
        ),
      )

    ],
  );
}
