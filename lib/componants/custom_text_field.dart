import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constants/style.dart';

class CustomAddressTextField extends StatelessWidget {
    CustomAddressTextField({
    Key? key,
    // required this.textEditingController,
    required this.hintText,
    required this.labelText,
    required this.onChanged,
    required this.width,
        this.maxLines,
  }) : super(key: key);

  // final TextEditingController textEditingController;
  final String hintText;
  final String labelText;
    int ?maxLines=1;
    void Function(String)? onChanged;
    final width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: TextFormField(
          // controller: textEditingController,
          cursorColor: K.mainColor,
          onChanged: onChanged,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          maxLines: maxLines,
          decoration:InputDecoration(
            hintText: hintText.toString().tr,
            label: Text(labelText.tr,),
            labelStyle: TextStyle(color: K.mainColor,fontSize: 16.sp),


            fillColor: K.lightMainColor,
            filled: true,
            isDense: true,
            contentPadding: EdgeInsets.all(22.sp),

            hintStyle: TextStyle(color: K.mainColor,fontSize: 18,fontWeight: FontWeight.bold),
            border: OutlineInputBorder(
              borderSide: BorderSide(

                color: K.lightMainColor
              ),
              borderRadius: BorderRadius.circular(50.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: K.primaryColor,
              ),
              borderRadius: BorderRadius.circular(50.r),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.transparent
                // color: K.primaryColor,
              ),
              borderRadius: BorderRadius.circular(50.r),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: K.mainColor,
              ),
              borderRadius: BorderRadius.circular(50.r),
            ),)
      ),
    );
  }

}
