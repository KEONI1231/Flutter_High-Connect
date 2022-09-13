import 'dart:convert';
import 'package:dio/dio.dart';
import '../constant/data.dart';
import '../model/meal.model.dart';

class MealRepository {
  static Future<List<MealModel>> fetchData() async {
    final date = DateTime.now().year.toString() + DateTime.now().month.toString().padLeft(2, '0');
    final response = await Dio().get(
      'https://open.neis.go.kr/hub/mealServiceDietInfo',
      queryParameters: {
        'serviceKey': serviceKey,
        'Type': 'json',
        'pIndex': 1,
        'pSize': 30,
        'ATPT_OFCDC_SC_CODE': 'E10',
        'SD_SCHUL_CODE': '7310069',
        'MLSV_YMD': date,
      },
    );
    Map<String, dynamic> meal = jsonDecode(response.data);
    return meal['mealServiceDietInfo'][1]['row']
        .map<MealModel>(
          (item) => MealModel.fromJson(json: item),
    )
        .toList();
  }
}
