import 'package:http/http.dart' as http;
import 'user_model.dart';
import 'constants.dart';
import 'dart:developer';

class ApiService {
  Future<List<UserModel>?> getUsers() async {
    // This method fetches a list of users from the API.
    // It returns a Future because HTTP calls are asynchronous.
    try
    {
      // Combine the base URL and endpoint (e.g. "https://.../users")
      var url = Uri.parse(ApiConstants.baseURL + ApiConstants.usersEndPoint);
      //Send the GET request
      var response = await http.get(url);
      if (response.statusCode == 200) {
        // If status code is 200 (OK), decode the JSON into a list of UserModel
        List<UserModel> _model = userModelFromJson(response.body);

       //return list
        return _model;
      }
    }
    // If status code isn't 200, just return null (or you can throw an error)

    catch (e) {
      log(e.toString());
    }
  }
}
