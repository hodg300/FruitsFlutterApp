import 'package:fruitsapp/db/db.dart';
import 'package:fruitsapp/home/models/fruit_model.dart';
import 'package:fruitsapp/utils/app_logger.dart';

class DBService{

  /// Get all fruits from the server
  static Future<List<FruitModel>> getAllFruits() async{
    List<FruitModel> fruitsList = [];
    try{
      var map = await DB.getData(route: "https://dev-api.com/fruitsBT/getFruits");
      fruitsList = List.of(map["fruits"]).map((e) => FruitModel.fromJson(e)).toList();
      AppLogger.log("fruitsList: $fruitsList");
      return fruitsList;
    }catch(e){
      return fruitsList;
    }

  }
}