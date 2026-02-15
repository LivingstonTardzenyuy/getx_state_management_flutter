import 'package:dio/dio.dart';
import 'package:getx/consts.dart';

class HttpService {
  final Dio _dio = Dio();

  // Creating a constructor class.
  HttpService() {
    _configureDio();
  }

  void _configureDio() {
    _dio.options = BaseOptions(
      baseUrl: "https://api.cryptorank.io/v2/",
      // queryParameters: {
      //     "api_key": CRYPTO_RANK_API_KEY
      // }
      headers: {
        "X-Api-Key": CRYPTO_RANK_API_KEY,
        "Accept": "application/json"
      },
    );
  }


  Future<dynamic> get(String path) async {
    try {
      Response response = await _dio.get(path);
      return response.data;
    } catch(e) {
      print(e);
    }
  }


}