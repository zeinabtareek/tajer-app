import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/style.dart';

// class CustomDropDown extends StatelessWidget {
//   String text='';
//   bool isDropDown;
//   CustomDropDown({
//     super.key,
//     required this.text,
//     required this.isDropDown,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(20),
//       // width: MediaQuery.of(context).size.width/1,
//       decoration: BoxDecoration(
//         color: K.lightMainColor,
//         borderRadius: BorderRadius.circular(10.0), // set border radius
//         border: Border.all(
//           color: K.lightMainColor,
//           width: 2.0, // set border width
//         ),
//       ),
//       child: ListTile(
//         title: Text(text,style: K.boldBlackSmallText,),
//         trailing: isDropDown?Icon(Icons.arrow_drop_down,size: 20.sp,color: K.blackColor,):SizedBox()
//       ),
//     );
//   }
// }
class CustomDropDown extends StatelessWidget {
  final String text;
  final String dropdownValue;
  final ValueChanged<String> onChanged;
  final bool isDropDown;

  CustomDropDown({
    Key? key,
    required this.text,
    required this.isDropDown,
    required this.dropdownValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: K.lightMainColor,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: K.lightMainColor,
            width: 2.0,
          ),
        ),
        child: isDropDown
            ? DropdownButton<String>(
          borderRadius: BorderRadius.circular(10),
          alignment: AlignmentDirectional.centerStart,
          isExpanded: true,
          underline: SizedBox(),
          value: dropdownValue.isNotEmpty ? dropdownValue : null,
          icon: Icon(
            Icons.arrow_drop_down,
            size: 20.sp,
            color: K.blackColor,
          ),
          onChanged: (String? newValue) {
            onChanged(newValue!);
          },
          items: <String>[
            'مقبول',
            'مرفوض',
            'في انتظار المراجعة'
          ].map<DropdownMenuItem<String>>((String value) {
            String dropdownValue;
            if (value == 'مقبول') {
              dropdownValue = 'accepted';
            } else if (value == 'مرفوض') {
              dropdownValue = 'canceled';
            } else {
              dropdownValue = 'pending';
            }

            return DropdownMenuItem<String>(
              value: dropdownValue,
              child: Container(
                padding: EdgeInsets.all(5),
                alignment: Alignment.centerRight,
                child: Text(
                  value,
                  textDirection: TextDirection.ltr,
                  style: K.boldBlackSmallText,
                ),
              ),
            );
          }).toList(),
        )
            : ListTile(
          title: Text(
            text,
            style: K.boldBlackSmallText,
          ),
        ),
      ),
    );
  }
}
