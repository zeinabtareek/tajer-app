import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/style.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

// class CustomDropDown extends StatelessWidget {
//   final String text;
//   final String dropdownValue;
//   final ValueChanged<String> onChanged;
//   final bool isDropDown;
//
//   CustomDropDown({
//     Key? key,
//     required this.text,
//     required this.isDropDown,
//     required this.dropdownValue,
//     required this.onChanged,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Container(
//         margin: EdgeInsets.all(20),
//         decoration: BoxDecoration(
//           color: K.lightMainColor,
//           borderRadius: BorderRadius.circular(10.0),
//           border: Border.all(
//             color: K.lightMainColor,
//             width: 2.0,
//           ),
//         ),
//         child: isDropDown
//             ? DropdownButton<String>(
//           borderRadius: BorderRadius.circular(10),
//           alignment: AlignmentDirectional.centerStart,
//           isExpanded: true,
//           underline: SizedBox(),
//           value: dropdownValue.isNotEmpty ? dropdownValue : null,
//           icon: Icon(
//             Icons.arrow_drop_down,
//             size: 20.sp,
//             color: K.blackColor,
//           ),
//           onChanged: (String? newValue) {
//             onChanged(newValue!);
//           },
//           items: <String>[
//             'مقبول',
//             'مرفوض',
//             'في انتظار المراجعة'
//           ].map<DropdownMenuItem<String>>((String value) {
//             String dropdownValue;
//             if (value == 'مقبول') {
//               dropdownValue = 'accepted';
//             } else if (value == 'مرفوض') {
//               dropdownValue = 'canceled';
//             } else {
//               dropdownValue = 'pending';
//             }
//
//             return DropdownMenuItem<String>(
//               value: dropdownValue,
//               child: Container(
//                 padding: EdgeInsets.all(5),
//                 alignment: Alignment.centerRight,
//                 child: Text(
//                   value,
//                   textDirection: TextDirection.ltr,
//                   style: K.boldBlackSmallText,
//                 ),
//               ),
//             );
//           }).toList(),
//         )
//             : ListTile(
//           title: Text(
//             text,
//             style: K.boldBlackSmallText,
//           ),
//         ),
//       ),
//     );
//   }
// }
class CustomDropDown extends StatelessWidget {
  String hint;
  List listOfItems;
  void Function(String?)? onSaved;
  void Function(String?)? onChanged;

  CustomDropDown({
    Key? key,
    required this.hint,
    required this.listOfItems,
    required this.onSaved,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      isExpanded: true,
      decoration: InputDecoration(
        filled: true,
        fillColor: K.mainColor.withOpacity(.088),
        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none, // Remove the bottom border
        ),
        // Add margin
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
      hint: Center(
        child:   Text(
            hint,
            style: TextStyle(fontSize: 14, color: K.blackColor),
          ),
        // ),
      ),
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
            alignment: Alignment.centerRight,
            child: Text(
              value,
              textDirection: TextDirection.ltr,
              style: TextStyle(fontSize: 14, color: K.blackColor),
            ),
          ),
        );
      }).toList(),
      validator: (value) {
        if (value == null) {
          return 'Please select Value';
        }
        return null;
      },
      onChanged: onChanged,
      onSaved: onSaved,
      buttonStyleData: ButtonStyleData(
        padding: EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(15),
          // color: K.mainColor.withOpacity(.088),
        ),
      ),
      iconStyleData: IconStyleData(
        icon: Icon(Icons.arrow_drop_down, color: K.blackColor),
        iconSize: 24,
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      menuItemStyleData: const MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }
}