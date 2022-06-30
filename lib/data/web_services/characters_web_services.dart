import 'package:untitled/constants/strings.dart';
import 'package:untitled/data/models/characters.dart';
import 'package:dio/dio.dart';

class CharactersWebServices {
  late Dio dio;
  CharactersWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000,
    );
    dio = Dio(options);
  }
  Future <List<dynamic>> getAllCharacters() async {
    // you can make <List<Characters>> or you can make <List<dynamic>>
    try {
      Response response =
          await dio.get('characters'); //characters is the end point

      print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
