import 'package:dio/dio.dart';

import 'my_api_client.dart';
import 'my_api_utils.dart';

class ApiRepo {
  late MyApiClient apiClient;
  late MyApiUtils myApiUtils;
  late String baseUrl;

  /// ------------------------------------ Login APIs --------------------------------------------------------

  // pass base url
  ApiRepo(String? token, String? contentType, {required String baseUrl}) {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      headers: contentType != null
          ? {'Content-Type': contentType, "Authorization": token}
          : {"Authorization": token},
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 90),
      // 90 seconds
      receiveTimeout: const Duration(seconds: 90), // 90 seconds
    );
    Dio dio = Dio(options);
    apiClient = MyApiClient(dio, baseUrl: baseUrl);
  }

}