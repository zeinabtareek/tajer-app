import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../componants/custom_button.dart';
import '../../constants/style.dart';
import 'controller/setting_controller.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingsController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'الاعدادات',
          style: K.boldBlackText,
        ),
        leading: SizedBox(),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? Center(
                child: CupertinoActivityIndicator(
                  color: K.primaryColor,
                ),
              )
            : Directionality(
                textDirection: TextDirection.rtl,
                child:   SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        K.sizedboxH,
                        K.sizedboxH,
                        ///name
                        (controller.model.data?.name != null &&
                                controller.model.data?.name != '' &&
                                controller.model.data?.name != '')
                            ? Obx(
                                () => CustomTextField(
                                  type: TextInputType.phone,
                                  controller: controller.nameController,
                                  onEditPressed: () {
                                    controller.nameIsClickedToEnable(context,
                                        field: 'name',
                                        value: controller.nameController.text);
                                  },
                                  enabled: controller.nameEnable.value,
                                  hint: controller.model.data?.name ?? 'الاسم'.tr,
                                  label: (controller.nameEnable.value ||
                                          controller.nameController.text != '')
                                      ? ''
                                      : controller.model.data?.name ?? 'الاسم'.tr,
                                  onChange: (v) {},
                                ),
                              )
                            : SizedBox(),
                        K.sizedboxH,
                        ///email
                        (controller.model.data?.email != null &&
                                controller.model.data?.email != '' &&
                                controller.model.data?.email != '')
                            ? Obx(
                                () => CustomTextField(
                                  type: TextInputType.emailAddress,
                                  controller: controller.emailController,
                                  onEditPressed: () {
                                    controller.emailIsClickedToEnable(context,
                                        field: 'email',
                                        value: controller.emailController.text);
                                  },
                                  enabled: controller.emailEnable.value,
                                  hint: controller.model.data?.email ??
                                      'البريد الإلكتروني'.tr,
                                  label: (controller.emailEnable.value ||
                                          controller.emailController.text != '')
                                      ? ''
                                      : controller.model.data?.email ??
                                          'البريد الإلكتروني'.tr,
                                  onChange: (v) {},
                                ),
                              )
                            : SizedBox(),
                        K.sizedboxH,
                        ///address
                        (controller.model.data?.address != null &&
                                controller.model.data?.address != '' &&
                                controller.model.data?.address != '')
                            ? Obx(
                                () => CustomTextField(
                                  type: TextInputType.text,
                                  controller: controller.addressController,
                                  onEditPressed: () {
                                    controller.addressIsClickedToEnable(context,
                                        field: 'address',
                                        value: controller.addressController.text);
                                  },
                                  enabled: controller.addressEnable.value,
                                  hint: controller.model.data?.address ??
                                      'العنوان'.tr,
                                  label: (controller.addressEnable.value ||
                                          controller.addressController.text != '')
                                      ? ''
                                      : controller.model.data?.address ??
                                          'العنوان'.tr,
                                  onChange: (v) {},
                                ),
                              )
                            : SizedBox(),
                        K.sizedboxH,
                        ///deliveryArea
                        (controller.model.data?.deliveryArea != null &&
                                controller.model.data?.deliveryArea != '' &&
                                controller.model.data?.deliveryArea != '')
                            ? Obx(
                                () => CustomTextField(
                                  type: TextInputType.number,
                                  controller: controller.deliveryAreaController,
                                  onEditPressed: () {
                                    controller.deliveryAreaIsClickedToEnable(
                                        context,
                                        field: "deliveryArea",
                                        value:
                                            controller.deliveryAreaController.text);
                                  },
                                  enabled: controller.deliveryAreaEnable.value,
                                  hint: controller.model.data?.deliveryArea
                                          .toString() ??
                                      '  منطقة التسليم'.tr,
                                  label: (controller.deliveryAreaEnable.value ||
                                          controller.deliveryAreaController.text !=
                                              '')
                                      ? ''
                                      : controller.model.data?.deliveryArea
                                              .toString() ??
                                          ' منطقة التسليم'.tr,
                                  onChange: (v) {},
                                ),
                              )
                            : SizedBox(),
                        K.sizedboxH,
                        ///company
                        (controller.model.data?.companyName != null &&
                                controller.model.data?.companyName != '' &&
                                controller.model.data?.companyName != '')
                            ? Obx(
                                () => CustomTextField(
                                  type: TextInputType.text,
                                  controller: controller.companyNameController,
                                  onEditPressed: () {
                                    controller.companyIsClickedToEnable(context,
                                        field: "companyName",
                                        value:
                                            controller.companyNameController.text);
                                  },
                                  enabled: controller.companyEnable.value,
                                  hint: controller.model.data?.companyName
                                          .toString() ??
                                      'اسم الشركة'.tr,
                                  label: (controller.companyEnable.value ||
                                          controller.companyNameController.text !=
                                              '')
                                      ? ''
                                      : controller.model.data?.companyName
                                              .toString() ??
                                          'اسم الشركة'.tr,
                                  onChange: (v) {},
                                ),
                              )
                            : SizedBox(),
                        K.sizedboxH,
                        K.sizedboxH,

                        controller.socialModel.data!=null?    Directionality(
                          textDirection: TextDirection.ltr,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ...List.generate(controller.socialModel.data!.length, (index) =>  GestureDetector(
                                onTap: (){
                                  controller.launch(url: controller.socialModel.data?[index].url.toString());
                                },
                                child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: K.mainColor.withOpacity(.088),
                                         borderRadius: BorderRadius.circular(15)),
                                    child:SvgPicture.network(controller.socialModel.data![index].icon.toString()??'',
                                      placeholderBuilder: (BuildContext context) => CupertinoActivityIndicator(),
                                    ),



                                      height: 55.h,
                                      width: 55.w,
                                    )),
                              ),
                              ],
                          ),
                        ):SizedBox(),
                        K.sizedboxH,

                        Column(
                          children: [
                            Obx(
                                  () => controller.isDisable.value
                                  ? const SizedBox()
                                  : Button(
                                  color: K.semiDarkRed,
                                  text: ' تسجيل خروج'.tr,
                                  size: MediaQuery.of(context).size.width / 1.5.w,
                                  height: MediaQuery.of(context).size.height / 20.h,
                                  isFramed: false,
                                  fontSize: 15.sp,
                                  onPressed: () async {
                                    controller.logOut();
                                  }),
                            ),
                            Button(
                                color: K.semiDarkRed,
                                text: 'حذف الحساب'.tr,
                                size: MediaQuery.of(context).size.width / 1.5.w,
                                height: MediaQuery.of(context).size.height / 20.h,
                                isFramed: false,
                                fontSize: 15.sp,
                                onPressed: () async {
                                  controller.delete();
                                }),

                          ],
                        )

                      ],
                    ),
                ),
                ),
              ),
      // ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {Key? key,
      this.hint,
      this.onEditPressed,
      this.label,
      this.onChange,
      this.controller,
      this.obSecure = false,
      this.enabled = true,
      this.prefixIcon,
      this.padding,
      this.type})
      : super(key: key);
  final Function(String)? onChange;
  final String? label;
  final String? hint;

  // final IconButton? icon;
  // final IconButton? icon;
  void Function()? onEditPressed;
  final TextInputType? type;
  final bool? obSecure;
  final IconData? prefixIcon;
  final bool? enabled;
  EdgeInsets? padding;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      height: 60.h,
      decoration: enabled == true
          ? K.boxDecorationWithGreyBorder
          : K.boxDecorationLightGrey,
      child: ListTile(
        title: TextField(
          cursorHeight: 20,
          // you can put your ideal height here

          controller: controller,
          keyboardType: type,
          onChanged: onChange,
          autofocus: true,
          enabled: enabled,

          obscureText: obSecure!,
          decoration: InputDecoration(
              labelText: label!,
              labelStyle: K.boldBlackSmallText,
              hintStyle: K.boldBlackSmallText,
              hintText: hint!,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(20),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(5))),
        ),
        trailing: IconButton(
            icon: Icon(
              Icons.edit,
              color: K.mainColor,
              size: 20,
            ),
            onPressed: onEditPressed),
      ),
    );
  }
}
