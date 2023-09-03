import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tajer/helpers/cache_helper.dart';
import 'package:tajer/model/social_model.dart';
import 'package:tajer/screens/log_in_screen/login_screen.dart';
import 'package:tajer/screens/setting_screen/services/setting_services.dart';
import 'package:tajer/screens/splash_screen/splash_screen.dart';
import 'package:tajer/utils/app_constants.dart';
import '../../../model/setting_model.dart';

class SettingsController extends GetxController {
  SettingsModel model = SettingsModel();
  SocialModel socialModel = SocialModel();
  final services = SettingServices();
  final isLoading = false.obs;
  final deliveryAreaEnable = false.obs;
  final nameEnable = false.obs;
  final isDisable = true.obs;
  final companyEnable = false.obs;
  final socialLoading = false.obs;
  final emailEnable = false.obs;
  final addressEnable = false.obs;
  final deliveryAreaController = TextEditingController();
  final companyNameController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  var token;

  @override
  onInit() async {
    token = await CacheHelper.getData(key: AppConstants.token);
    isLoading.value = true;
    // isLoading.value=true;
    await getUserData(token);
    await getSocial(token);

    print(token);
    isDisable.value = false;
    isLoading.value = false;
    super.onInit();
  }

  Future<SettingsModel?> getUserData(String token) async {
    isLoading.value = true;
    try {
      model = await SettingServices.fetchLoggedUser(token);
      return model;
    } catch (error) {
      print('$error');
    }

    isLoading.value = false;
  }


  getSocial(token)async{
    socialLoading.value = true;
    try {
     socialModel=await SettingServices.getSocial(token);
      return model;
    } catch (error) {
      print('$error');
    }

    socialLoading.value = false;
  }

  deliveryAreaIsClickedToEnable(context, {field, required value}) {
    deliveryAreaEnable.value = !deliveryAreaEnable.value;
    if (deliveryAreaEnable.value == false) {
      updateData(context, field: field, value: int.parse(value.toString()));
    }
    print(deliveryAreaEnable.value);
  }

  nameIsClickedToEnable(context, {field, value}) {
    nameEnable.value = !nameEnable.value;
    if (nameEnable.value == false) {
      updateData(context, field: field, value: value);
    }
    print(nameEnable.value);
  }

  emailIsClickedToEnable(context, {field, value}) {
    emailEnable.value = !emailEnable.value;
    if (emailEnable.value == false) {
      updateData(context, field: field, value: value);
    }
    print(emailEnable.value);
  }

  addressIsClickedToEnable(context, {field, value}) {
    addressEnable.value = !addressEnable.value;
    if (addressEnable.value == false) {
      updateData(context, field: field, value: value);
    }
    print(addressEnable.value);
  }

  companyIsClickedToEnable(context, {field, value}) {
    companyEnable.value = !companyEnable.value;
    if (companyEnable.value == false) {
      updateData(context, field: field, value: value);
    }
    print(companyEnable.value);
  }

  updateData(context, {field, value}) async {
    Data data = Data();
    Data existingData = Data();

    await getUserData(token).then((value) {
      existingData = value!.data!;
      data.name = existingData.name;
      data.companyName = existingData.companyName;
      data.address = existingData.address;
      data.government = existingData.government;
      data.latitude = existingData.latitude;
      data.longitude = existingData.longitude;
      data.deliveryArea = existingData.deliveryArea;
    });

    // Copy the existing data to the new data object

    if (field == 'name') {
      data.name = value;
    } else if (field == 'companyName') {
      data.companyName = value;
    } else if (field == 'address') {
      data.address = value;
    } else if (field == 'government') {
      data.government = value;
    } else if (field == 'latitude') {
      data.latitude = value;
    } else if (field == 'longitude') {
      data.longitude = value;
    } else if (field == 'deliveryArea') {
      data.deliveryArea = value;
    }

    await SettingServices.update(data, context: context);
  }

  delete() async {
    await services.deleteAccount();
    CacheHelper.clearData();
    Get.offAll(() => SplashScreen());
  }

  logOut() async {
    await services.singOut();
    CacheHelper.clearData();
    Get.offAll(() => LogInScreen());
  }


}
