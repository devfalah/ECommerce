import 'package:flutter/material.dart';
import 'package:shopping/view/widgets/custom_text.dart';

import '../../constance.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onpressed;

  const CustomButton({this.text, this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        child: CustomText(
          text: text,
          color: Colors.white,
          alignment: Alignment.center,
        ),
        style: ElevatedButton.styleFrom(
          primary: primaryColor,
          padding: EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        onPressed: onpressed,
      ),
    );
  }
}
