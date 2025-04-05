import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../model/divisions/divisions_listing/divisions_listing_response.dart';
import '../model/product/product view/product_view_response.dart';
import '../model/product/product_listing/product_listing_response.dart';
import '../model/segments/segments_listing/segments_listing_response.dart';
import 'my_api_utils.dart';

part 'my_api_client.g.dart';

@RestApi(baseUrl: MyApiUtils.baseUrl)
abstract class MyApiClient {
  factory MyApiClient(Dio dio, {String? baseUrl}) = _MyApiClient;

  //For department List
  @GET("products")
  Future<ProductListingResponse> productListing();

  //product view
  @POST("product/view")
  Future<ProductViewResponse> productView(@Query("id") int id);

  // divisions listing
  @GET("divisions")
  Future<DivisionsListingResponse> divisionsListing();

  // segments listing
  @GET("segments")
  Future<SegmentsListingResponse> segmentsListing();
}
