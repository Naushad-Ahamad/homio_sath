import 'package:flutter/material.dart';
import 'package:hica_app/res/components/appBar.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: CustomeAppBar.appBar(
          statusBarHeight, context, 'About Us', false, false, false),
    );
  }
}
