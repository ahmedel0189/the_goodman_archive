import 'package:dio/dio.dart';

import '../../constants/string.dart';

class CharactersApi {
  late Dio dio;
  CharactersApi() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
    dio = Dio(options);
  }
  Future<List<dynamic>> getallcharaters() async {
    try {
      Response response = await dio.get(
        'characters',
      );
      return response.data;
    } catch (e) {
      return [];
    }
  }
}
