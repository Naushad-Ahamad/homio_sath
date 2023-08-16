import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Stack(
            children: [
              Center(
                child: Container(
                  height: 100,
                  width: 100,
                  child: CircularProgressIndicator(),
                ),
              ),
              Center(
                child: Image.asset('assets/images/homeosathi.jpg',
                  height: 60, width: 60,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
