import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hica_app/data/network/appConfig.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class ImagePickerDialog extends StatefulWidget {
  @override
  String strUserId, token, name, phone;
  ImagePickerDialog(this.strUserId, this.token, this.name, this.phone);
  _ImagePickerDialog createState() => _ImagePickerDialog();
}

class _ImagePickerDialog extends State<ImagePickerDialog> {
  var isLoading = false;
  dialogContent(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 20),
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white,
        shape: BoxShape.rectangle,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: const Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: InkWell(
                onTap: () {
                  _getFromCamera(context);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.camera_alt,
                      size: 80,
                      color: Colors.black45,
                    ),
                    Text('Camera')
                  ],
                )),
          ),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                _getFromGallery(context);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.photo,
                    size: 80,
                    color: Colors.black45,
                  ),
                  Text('Gallery')
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        !isLoading
            ? Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 0.0,
                backgroundColor: Colors.transparent,
                child: dialogContent(context),
              )
            : Center(
                child: CircularProgressIndicator(),
              )
      ],
    );
  }

  /// Get from gallery
  _getFromGallery(BuildContext context) async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        isLoading = true;
      });
    //  updatePhoto(File(pickedFile.path), context);
    }
  }

  /// Get from Camera
  _getFromCamera(BuildContext context) async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      setState(() {
        isLoading = true;
      });
     // updatePhoto(File(pickedFile.path), context);
    } else {
      print('data');
    }
  }

  updatePhoto(File image, BuildContext context) async {
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': widget.token
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse("" + widget.strUserId + '/profile'));
    request.fields.addAll(
        {'name': widget.name.toString(), 'phone': widget.phone.toString()});
    request.files.add(await http.MultipartFile.fromPath('avatar', image.path));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.brown,
          content: Text(
            'Profile Updated successfully',
            style: TextStyle(fontSize: 18, fontFamily: 'Roboto'),
          )));
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.brown,
          content: Text(
            'Something went wrong , Please try again..',
            style: TextStyle(fontSize: 18, fontFamily: 'Roboto'),
          )));
      Navigator.pop(context);
    }
  }
}
