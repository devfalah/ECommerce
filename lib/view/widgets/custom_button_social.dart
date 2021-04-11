import 'package:flutter/material.dart';
import 'package:shopping/view/widgets/custom_text.dart';

class CustomButtonSocial extends StatelessWidget {
  final String text;
  final String assetName;
  final Function onPressed;

  const CustomButtonSocial({
    this.text,
    this.assetName,
    this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        child: Row(
          children: [
            Image.asset(
              assetName,
            ),
            SizedBox(width: 90),
            CustomText(
              text: text,
            ),
          ],
        ),
        style: TextButton.styleFrom(
          primary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
