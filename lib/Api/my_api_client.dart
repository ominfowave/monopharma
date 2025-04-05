import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../model/product/product_listing/product_listing_response.dart';
import 'my_api_utils.dart';

part 'my_api_client.g.dart';

@RestApi(baseUrl: MyApiUtils.baseUrl)
abstract class MyApiClient {
  factory MyApiClient(Dio dio, {String? baseUrl}) = _MyApiClient;

  //For department List
  @GET("products")
  Future<ProductListingResponse> productListing();

}
