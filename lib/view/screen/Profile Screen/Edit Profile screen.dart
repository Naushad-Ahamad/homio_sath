
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hica_app/utils/imagePickerDialog.dart';
import 'package:hica_app/utils/my_theme.dart';
import 'package:hica_app/utils/utils.dart';
import 'package:hica_app/view/screen/Profile%20Screen/PermissionHelper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:toast/toast.dart';

class ProfileEdit extends StatefulWidget {
  @override
  _ProfileEditState createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  ScrollController _mainScrollController = ScrollController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();

  // TextEditingController _nameController =  TextEditingController(text: "${user_name.$}");
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordOldController = TextEditingController();
  TextEditingController _passwordConfirmController = TextEditingController();
  final PermissionHelper _permissionHelper = new PermissionHelper();

  bool nameValidation = false,
      roleValidation = false,
      phoneValidation = false,
      emailValidation = false,
      passValidation = false,
      confirmPassValidation = false;

  //for image uploading
  late PickedFile _file;
  late File image;

  chooseAndUploadImage(context) async {
    var status = await Permission.photos.request();

    if (status.isDenied) {
      // We didn't ask for permission yet.
      showDialog(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
                title: Text('Photo Permission'),
                content: Text(
                    'This app needs photo to take pictures for upload user profile photo'),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text('Deny'),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  CupertinoDialogAction(
                    child: Text('Settings'),
                    onPressed: () => openAppSettings(),
                  ),
                ],
              ));
    } else if (status.isRestricted) {
      Utils.snackBar("Go to your application settings and give photo permission ", context);

    } else if (status.isGranted) {
      //file = await ImagePicker.pickImage(source: ImageSource.camera);
      _file =
          (await ImagePicker.platform.pickImage(source: ImageSource.gallery))!;
      if (_file == null) {
        Utils.snackBar("No file is chosen ", context);

        return;
      }
      //return;
      String base64Image = base64Encode(await _file.readAsBytes());
      String fileName = _file.path.split("/").last;

      /*var profileImageUpdateResponse =
      await ProfileRepository().getProfileImageUpdateResponse(
        base64Image,
        fileName,
      );
      if (profileImageUpdateResponse.result == false) {
        ToastComponent.showDialog(profileImageUpdateResponse.message, context,duration: Toast.lengthLong,gravity: Toast.center);
        return;
      } else {
        ToastComponent.showDialog(profileImageUpdateResponse.message, context,duration: Toast.lengthLong,gravity: Toast.center);
        avatar_original.$ = profileImageUpdateResponse.path;
        setState(() {});
      }*/
    }
  }

  Future<void> _onPageRefresh() async {}

  onPressUpdate() async {
    // var name = _nameController.text.toString();
    var password = _passwordController.text.toString();
    var passwordold = _passwordOldController.text.toString();
    var password_confirm = _passwordConfirmController.text.toString();

    var change_password = password != "" ||
        password_confirm !=
            ""; // if both fields are empty we will not change user's password

    /*if (name == "") {
      ToastComponent.showDialog("Enter your name", context,
          gravity: Toast.center);
      return;
    }*/
    if (passwordold == "") {
      Utils.snackBar("Enter old password", context);


      return;
    }
    if (change_password && password == "") {
      Utils.snackBar("Enter password", context);


      return;
    }
    if (change_password && password_confirm == "") {
      Utils.snackBar("Confirm your password", context);


      return;
    }
    if (change_password && password.length < 6) {
      Utils.snackBar("Password must contain atleast 6 characters", context);


      return;
    }
    if (change_password && password != password_confirm) {
      Utils.snackBar("Passwords do not match", context);


      return;
    }

    /* var profileUpdateResponse =
    await ProfileRepository().getProfileUpdateResponse(
        name,
        change_password ? password : "",
        passwordold
    );

    if (profileUpdateResponse.result == false) {
      ToastComponent.showDialog(profileUpdateResponse.message, context,
          gravity: Toast.center);
    } else {
      ToastComponent.showDialog(profileUpdateResponse.message, context,
          gravity: Toast.center);

      user_name.$ = name;
      setState(() {});
      Navigator.pop(context);
    }*/
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: MyTheme.white, //or set color with: Color(0xFF0000FF)
      ));
    });
    // FireCustomAnalytics.setAnalyticsScreen("Profile Update");
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: Center(child: buildBody(context)),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: MyTheme.white,
      leading: Builder(
        builder: (context) => IconButton(
          icon: Icon(Icons.arrow_back, color: MyTheme.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      title: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Edit Profile",
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.0215,
              color: MyTheme.black),
        ),
      ),
      elevation: 0.0,
      titleSpacing: 0,
    );
  }

  buildBody(context) {
/*    if (is_logged_in.$ == false) {
      return Container(
          height: 100,
          child: Center(
              child: Text(
                "Please log in to see the profile",
                style: TextStyle(color: MyTheme.font_grey),
              )));
    } else {*/
    return RefreshIndicator(
      color: MyTheme.accent_color,
      backgroundColor: Colors.white,
      onRefresh: _onPageRefresh,
      displacement: 10,
      child: CustomScrollView(
        controller: _mainScrollController,
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              buildTopSection(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Divider(
                  height: 24,
                ),
              ),
              buildProfileForm(context)
            ]),
          )
        ],
      ),
    );
    /* }*/
  }

  buildTopSection() {
    return Column(
      children: [
        InkWell(
          onTap: () async {
            await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ImagePickerDialog(
                      "strUserId",
                      "strAuthKey",
                      "nameController.text",
                      "mobileController" != null
                          ? "mobileController.text"
                          : '');
                });

            //_pickedImage();
            //permission();
            /*   if(_permissionHelper.permission()){
          _permissionHelper.checkCameraPermission();
       }*/
            //chooseAndUploadImage(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
            child: Stack(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                        color: Color.fromRGBO(112, 112, 112, .3), width: 2),
                    //shape: BoxShape.rectangle,
                  ),
                  child: ClipRRect(
                      clipBehavior: Clip.hardEdge,
                      borderRadius: BorderRadius.all(Radius.circular(100.0)),
                      child: FadeInImage.assetNetwork(
                        placeholder: 'assets/placeholder.png',
                        imageErrorBuilder: (_, ___, __) => Image.asset(
                            'https://cdn-icons-png.flaticon.com/128/924/924915.png',
                            fit: BoxFit.cover),
                        image:
                            "https://cdn-icons-png.flaticon.com/128/924/924915.png",
                        fit: BoxFit.fill,
                      )),
                ),
                Positioned(
                  right: 8,
                  bottom: 8,
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 36,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.edit,
                          color: Colors.black,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  buildProfileForm(context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 16.0, right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 0.0),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          ' Name',
                          style: GoogleFonts.montserrat(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.0175,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0, top: 5.0),
                    child: Center(
                      child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: MyTheme.textfield_grey, width: 1),
                          ),
                          child: Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                new BoxShadow(
                                  color: Colors.black12,
                                ),
                              ],
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              //This will obscure text dynamically
                              decoration: const InputDecoration(
                                hintText: 'Sarah',
                                hintStyle: TextStyle(
                                    color: Colors.black, fontSize: 15),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                            ),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 0.0),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          ' Phone Number',
                          style: GoogleFonts.montserrat(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.0175,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0, top: 5.0),
                    child: Center(
                      child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: MyTheme.textfield_grey, width: 1),
                          ),
                          child: Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                new BoxShadow(
                                  color: Colors.black12,
                                ),
                              ],
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              //This will obscure text dynamically
                              decoration: const InputDecoration(
                                hintText: '+91 9377633277',
                                hintStyle: TextStyle(
                                    color: Colors.black, fontSize: 15),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                            ),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: MyTheme.accent_color,
                          backgroundColor:  Color(0xFF39053B),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8.0))),
                        ),
                        child: Text(
                          "Save",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        onPressed: () {
                          onPressUpdate();
                        },
                      ),
                    ),
                  ),
                ],
              )),
          Stack(
            children: [
            /*  Image.asset(
                'assets/images/bg_edit_profile.png',
                fit: BoxFit.fitWidth,
              ),*/
              Padding(
                padding:
                    const EdgeInsets.only(left: 8.0, top: 18.0, right: 8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Info :  Email account is not editable due to verification reasons.",
                          style: GoogleFonts.montserrat(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.0165,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 4.0, top: 18.0, right: 4.0),
                  child: Text(
                    "For further help or query mail at test@test.com",
                    style: GoogleFonts.montserrat(
                        fontSize: MediaQuery.of(context).size.height * 0.0175,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              /* ),*/
            ],
          ),
        ],
      ),
    );
  }

  void permission() async {
    if (Platform.isAndroid) {
      Map<Permission, PermissionStatus> statues =
          await [Permission.camera, Permission.photos].request();
      PermissionStatus statusCamera = statues[Permission.camera]!;

      PermissionStatus statusPhotos = statues[Permission.photos]!;
      bool isGranted = statusCamera == PermissionStatus.granted &&
          statusPhotos == PermissionStatus.granted;
      if (isGranted) {
        // _pickedImage();
        //return true;
      }
      bool isPermanentlyDenied =
          statusCamera == PermissionStatus.permanentlyDenied ||
              statusPhotos == PermissionStatus.permanentlyDenied;
      if (isPermanentlyDenied) {
        openAppSettings();
        // return false;
      }
    } else {
      Map<Permission, PermissionStatus> statues = await [
        Permission.camera,
        Permission.storage,
        Permission.photos
      ].request();
      PermissionStatus statusCamera = statues[Permission.camera]!;
      PermissionStatus statusStorage = statues[Permission.storage]!;
      PermissionStatus statusPhotos = statues[Permission.photos]!;
      bool isGranted = statusCamera == PermissionStatus.granted &&
          statusStorage == PermissionStatus.granted &&
          statusPhotos == PermissionStatus.granted;
      if (isGranted) {
        //_pickedImage();
        // return true;
      }

      bool isPermanentlyDenied =
          statusCamera == PermissionStatus.permanentlyDenied ||
              statusStorage == PermissionStatus.permanentlyDenied ||
              statusPhotos == PermissionStatus.permanentlyDenied;
      if (isPermanentlyDenied) {
        // return false;
        openAppSettings();
      } else {
        permission();
      }
    }
  }

/*  Future<bool> checkCameraPermission() async {
    bool isPermissionGranted = await Permission.camera.isGranted;
    var shouldShowRequestRationale =
    await Permission.camera.shouldShowRequestRationale;

    if (isPermissionGranted) {
      //_pickedImage();
    } else {
      if (!shouldShowRequestRationale) {
        var permissionStatus = await Permission.camera.request();
        if (permissionStatus.isPermanentlyDenied) {
          openAppSettings();
        }
      } else {
        var permissionStatus = await Permission.camera.request();
        if (permissionStatus.isGranted) {
         // _pickedImage();
        } else {
          checkCameraPermission();
          //  SmartDialog.showToast('isGranted:false');
        }
      }
    }


    */ /* var cameraPermissionStatus = await Permission.camera.request();
    print(">>>>>>>>>>>>>>>>>>>>>>>>>>\ncamera permission >> " +
        cameraPermissionStatus.name);
    if (cameraPermissionStatus.name == "granted") {
     // pickImage();
      _pickedImage();
      return true;
    } else if (cameraPermissionStatus.name == "denied") {
      return false;
    } else {
      return false;
    }*/ /*
  }*/

  Future pickImage() async {
    try {
      /* final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image == null) return;
      final imageTemp = File(image.path);
      setState(() =>
      this.image = imageTemp);*/
      _file =
          (await ImagePicker.platform.pickImage(source: ImageSource.gallery))!;

      if (_file == null) {
        Utils.snackBar("No file is chosen", context);

        return;
      }

      //return;
      String base64Image = base64Encode(await _file.readAsBytes());
      String fileName = _file.path.split("/").last;

      // var profileImageUpdateResponse =
      /* await ProfileRepository().getProfileImageUpdateResponse(
        base64Image,
        fileName,
      );*/

      //fetch_user();
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

/* fetch_user() async{
    var userByTokenResponse =
    await AuthRepository().getUserByTokenResponse();
    if (userByTokenResponse.result == true) {
      is_logged_in.$ = true;
      */ /*  user_id.$ = userByTokenResponse.id;
      user_name.$ = userByTokenResponse.name;
      user_email.$ = userByTokenResponse.email;
      user_phone.$ = userByTokenResponse.phone;*/ /*
      setState(() {
        avatar_original.$ = userByTokenResponse.avatar_original;
      });
    }


  }*/

/*void _pickedImage() {
    showDialog<ImageSource>(
      context: context,
      builder: (context) => AlertDialog(
          content: Text("Choose image from"),
          actions: [
            TextButton(
              child: Text("Camera"),
              onPressed: () => Navigator.pop(context, ImageSource.camera),
            ),
            TextButton(
              child: Text("Gallery"),
              onPressed: () => Navigator.pop(context, ImageSource.gallery),
            ),
          ]
      ),
    ).then((ImageSource source) async {
    */ /*  if (source != null) {
        try {
          */ /**/ /* final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image == null) return;
      final imageTemp = File(image.path);
      setState(() =>
      this.image = imageTemp);*/ /**/ /*
          //  _file = await ImagePicker.platform.pickImage(source: ImageSource.gallery);


          final pickedFile = await ImagePicker().getImage(source: source);
          */ /**/ /*ToastComponent.showDialog(pickedFile.path, context,
              gravity: Toast.center, duration: Toast.lengthLong);
*/ /**/ /*
         */ /**/ /* if (pickedFile == null) {
            ToastComponent.showDialog("No file is chosen", context,duration: Toast.lengthLong,gravity: Toast.center);
            return;
          }*/ /**/ /*
          //return;
          String base64Image = base64Encode(await pickedFile.readAsBytes());
          String fileName = pickedFile.path.split("/").last;

        */ /**/ /*  var profileImageUpdateResponse =
          await ProfileRepository().getProfileImageUpdateResponse(
            base64Image,
            fileName,
          );*/ /**/ /*

         // fetch_user();
        } on PlatformException catch(e) {
          print('Failed to pick image: $e');
        }

        //setState(() { _myState = newValue; });
        // setState((){ _pickedImage = File(pickedFile.path);});
      }*/ /*
    });

    TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(16.0),
        primary: Colors.white,
        textStyle: const TextStyle(fontSize: 20),
      ),
      onPressed: () {},
      child: const Text('Gradient'),
    );

  }*/
}
