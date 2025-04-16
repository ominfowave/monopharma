import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../model/divisions/divisions_listing/divisions_listing_response.dart';
import '../model/login/login_response.dart';

import '../model/product/generate pdf/generate_product_response.dart';
import '../model/product/product_listing/product_listing_response.dart';
import '../model/product/search product/search_product_response.dart';
import '../model/product/user all pdf/user_all_pdf_response.dart';
import '../model/register/register_response.dart';
import '../model/segments/segments_listing/segments_listing_response.dart';
import '../utils/utils.dart';
import '../model/product/product view/product_view_response.dart';
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
 // product listing
  productListing(BuildContext context, Function(String) onError,
      Function(dynamic) onSuccess) async {
    // check internet
    if (await Utils.isInternetConnected()) {
      try {
        ProductListingResponse productListingResponse = await apiClient.productListing();
        onSuccess(productListingResponse);
      } on DioException catch (e) {
        Utils.getErrorApi(e, onError, context);
      }
    } else {
      onError("Please check your internet connection and try again.");
    }
  }

  // for product view
  productView(
      BuildContext context,
      int id,
      Function(String) onError,
      Function(dynamic) onSuccess) async {
    // check internet
    if (await Utils.isInternetConnected()) {
      try {
        ProductViewResponse productViewResponse = await apiClient.productView(id);
        onSuccess(productViewResponse);
      } on DioException catch (e) {
        Utils.getErrorApi(e, onError, context);
      }
    } else {
      onError("Please check your internet connection and try again.");
    }
  }

  // divisions listing
  divisionsListing(BuildContext context, Function(String) onError,
      Function(dynamic) onSuccess) async {
    // check internet
    if (await Utils.isInternetConnected()) {
      try {
        DivisionsListingResponse divisionsListingResponse = await apiClient.divisionsListing();
        onSuccess(divisionsListingResponse);
      } on DioException catch (e) {
        Utils.getErrorApi(e, onError, context);
      }
    } else {
      onError("Please check your internet connection and try again.");
    }
  }

  // segments listing
  segmentsListing(BuildContext context, Function(String) onError,
      Function(dynamic) onSuccess) async {
    // check internet
    if (await Utils.isInternetConnected()) {
      try {
        SegmentsListingResponse segmentsListingResponse = await apiClient.segmentsListing();
        onSuccess(segmentsListingResponse);
      } on DioException catch (e) {
        Utils.getErrorApi(e, onError, context);
      }
    } else {
      onError("Please check your internet connection and try again.");
    }
  }

  //login
 login(BuildContext context,
     String fullName,
     String password,
     Function(String) onError,
      Function(dynamic) onSuccess) async {
    // check internet
    if (await Utils.isInternetConnected()) {
      try {
        LoginResponse loginResponse = await apiClient.login(fullName,password);
        onSuccess(loginResponse);
      } on DioException catch (e) {
        Utils.getErrorApi(e, onError, context);
      }
    } else {
      onError("Please check your internet connection and try again.");
    }
  }

  //Register
  register(BuildContext context,
      String firmName,
      String fullName,
      String email,
      String whatsappNo,
      String birthDate,
      int stateId,
      String city,
      String address,
      String pincode,
      int role,
      String password,
      String cPassword,
      Function(String) onError,
      Function(dynamic) onSuccess) async {
    // check internet
    if (await Utils.isInternetConnected()) {
      try {
        RegisterResponse registerResponse = await apiClient.register(firmName,
           fullName,
           email,
           whatsappNo,
           birthDate,
           stateId,
           city,
           address,
           pincode,
           role,
           password,
           cPassword,);
        onSuccess(registerResponse);
      } on DioException catch (e) {
        Utils.getErrorApi(e, onError, context);
      }
    } else {
      onError("Please check your internet connection and try again.");
    }
  }


  // search product
  searchProduct(
      BuildContext context,
      int segmentId,
      String? composition,
      Function(String) onError,
      Function(dynamic) onSuccess) async {
    // check internet
    if (await Utils.isInternetConnected()) {
      try {
        SearchProductResponse searchProductResponse = await apiClient.searchProduct(segmentId,composition);
        onSuccess(searchProductResponse);
      } on DioException catch (e) {
        Utils.getErrorApi(e, onError, context);
      }
    } else {
      onError("Please check your internet connection and try again.");
    }
  }

  //user all pdf
  userAllPdf(BuildContext context, Function(String) onError,
      Function(dynamic) onSuccess) async {
    // check internet
    if (await Utils.isInternetConnected()) {
      try {
        UserAllPdfResponse userAllPdfResponse = await apiClient.userAllPdf();
        onSuccess(userAllPdfResponse);
      } on DioException catch (e) {
        Utils.getErrorApi(e, onError, context);
      }
    } else {
      onError("Please check your internet connection and try again.");
    }
  }

  //Generate product pdf
  generateProductPdf(BuildContext context,
      int segmentId,
      int divisionId,
      Function(String) onError,
      Function(dynamic) onSuccess) async {
    // check internet
    if (await Utils.isInternetConnected()) {
      try {
        GenerateProductResponse generateProductResponse = await apiClient.generateProductPdf(segmentId,divisionId);
        onSuccess(generateProductResponse);
      } on DioException catch (e) {
        Utils.getErrorApi(e, onError, context);
      }
    } else {
      onError("Please check your internet connection and try again.");
    }
  }

}