import 'package:flutter/material.dart';
import 'package:hica_app/res/style/textStyle.dart';

/**
 * Created by Vikash Kumar Bharti on 24-05-2023.
 * Designation : Flutter & Android Developer
 * Company Name : 18 Pixels India Pvt. Ltd
 * Email Id : vikash.18pixels@gmail.com
 */
class NoDataWidget extends StatelessWidget {
  const NoDataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/ic_no_data.png',
          height: 400,
          width: 400,
        ),
        HeadingText(title: 'Data not found'),
         NormalText(title: 'Something gone wrong',maxLines: 1,)
      ],
    );
  }
}
