import 'dart:collection';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../utils/app_logger.dart';


class DB{


  /// Send Get Request - generic
  static Future<Map<String, dynamic>> getData({required String route}) async {
    Map<String, dynamic> responseData = HashMap();
    try {
      final response = await http.get(
        Uri.parse(route));
      if(response.statusCode == 201 || response.statusCode == 200){
        responseData = jsonDecode(response.body);
        AppLogger.log("postData - success - $route - $responseData");
      }else{
        AppLogger.error("postData - error - $route - ${response.statusCode}}");
      }
    } catch (e) {
      AppLogger.error("postData - error - $route - $e");
      return responseData;
    }
    return responseData;
  }
}