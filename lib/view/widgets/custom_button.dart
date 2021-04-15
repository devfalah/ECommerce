import 'package:flutter/material.dart';
import 'package:shopping/view/widgets/custom_text.dart';

import '../../constance.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onpressed;
  final Color color;
  final bool isContainborder;

  const CustomButton({
    this.text,
    this.onpressed,
    this.color: primaryColor,
    this.isContainborder: false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: isContainborder
            ? Border.all(
                color: Color(0xff00C569),
                width: .7,
              )
            : null,
        borderRadius: BorderRadius.circular(4),
      ),
      child: ElevatedButton(
        child: CustomText(
          text: text,
          color: color == Colors.white ? Colors.black : Colors.white,
          alignment: Alignment.center,
        ),
        style: ElevatedButton.styleFrom(
          primary: color,
          padding: EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        onPressed: onpressed as void Function(),
      ),
    );
  }
}
