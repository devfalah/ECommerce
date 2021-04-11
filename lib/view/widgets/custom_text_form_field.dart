import 'package:flutter/material.dart';
import 'package:shopping/view/widgets/custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final String text;
  final String hintText;
  final Function onSave;
  final Function validator;

  const CustomTextFormField({
    this.text: '',
    this.hintText,
    this.onSave,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomText(
            text: text,
            color: Colors.grey.shade900,
            fontSize: 14.0,
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                color: Colors.black,
              ),
              fillColor: Colors.white,
              filled: true,
            ),
            onSaved: onSave,
            validator: validator,
          ),
        ],
      ),
    );
  }
}
