import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../model/divisions/divisions_listing/divisions_listing_response.dart';
import '../model/login/login_response.dart';
import '../model/product/product view/product_view_response.dart';
import '../model/product/product_listing/product_listing_response.dart';
import '../model/register/register_response.dart';
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

  // login
  @POST("auth/login")
  Future<LoginResponse> login(@Query("full_name") String fullName, @Query("password") String password,
  );

  //register
  @POST("auth/register")
  Future<RegisterResponse> register(
      @Query("firm_name")  String firmName,
      @Query("full_name")   String fullName,
      @Query("email") String email,
      @Query("whatsapp_no") String whatsappNo,
      @Query("birth_date") String birthDate,
      @Query("state_id")  int stateId,
      @Query("city") String city,
      @Query("address")    String address,
      @Query("pincode")     String pincode,
      @Query("role")    int role,
      @Query("password") String password,
      @Query("c_password") String cPassword,
      );
}
