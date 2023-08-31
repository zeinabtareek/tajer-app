// class HomeServices{
//
//   static Future<SettingsModel> fetchLoggedUser(String token) async {
//     const String baseUrl = 'auth/loggedUser';
//     DioUtilNew.getInstance(); // Create the DioUtilNew instance
//
//     DioUtilNew.dio!.options.headers['Authorization'] = 'Bearer $token';
//
//     try {
//       final response = await DioUtilNew.dio!.get(baseUrl);
//
//       if (response.statusCode == 200) {
//         return SettingsModel.fromJson(response.data);
//       } else {
//         print(
//             'Failed to fetch logged user. Status code: ${response.statusCode}');
//         throw Exception(
//             'Failed to fetch logged user. Status code: ${response.statusCode}');
//       }
//     } catch (error) {
//       print('An error occurred: $error');
//       throw Exception('An error occurred: $error');
//     }
//   }
//
//
//
// }