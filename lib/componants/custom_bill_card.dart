
import 'package:flutter/cupertino.dart';

import '../constants/style.dart';
import '../screens/home_screen/home_screen.dart';

class CustomBillCard extends StatelessWidget {
  const CustomBillCard(
      {Key? key, this.orderNumber,this.image, this.name,this.desc, this.discount, this.price})
      : super(key: key);
  final String? name;
  final String? price;
  final String? discount;
  final String? image;
  final String? orderNumber;
  final String? desc;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: K.lightMainColor,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 90.0,
            height: 90.0,
            decoration: BoxDecoration(
              // shape: BoxShape.circle,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(image.toString()),
                // image: AssetImage('assets/images/test.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              Text(
                name ?? "",
                style: K.boldBlackSmallText,
              ),
              K.sizedboxH,
              RichText(
                text: TextSpan(
                  text: ' عرض  ',
                  style: K.redTextStyle,
                  // children:<InlineSpan> [
                  children: [
                    TextSpan(
                      // text: 'عرض 2 ',
                      text: ' $discount ',
                      style: K.boldBlackSmallText,
                      // style:K.redTextStyle,
                    ), TextSpan(
                      // text: 'عرض 2 ',
                      text: ' دينار ',
                      style: K.boldBlackSmallText,
                      // style:K.redTextStyle,
                    ),
                    // K.sizedboxW,
                    WidgetSpan(
                      child: CustomSlopText(
                        text: ' $price ',
                        color: K.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              K.sizedboxH,
              Text(
               desc.toString(),
              ),
            ],
          ),
          K.sizedboxW,
          Text(
            '   $orderNumber  ',
            style: K.boldBlackSmallText,
          ),
        ],
      ),
    );
  }
}
