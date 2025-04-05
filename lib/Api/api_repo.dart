import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../model/divisions/divisions_listing/divisions_listing_response.dart';
import '../model/product/product_listing/product_listing_response.dart';
import '../model/segments/segments_listing/segments_listing_response.dart';
import '../utils/utils.dart';
import '../model/product/product view/product_view_response.dart';
import '../utils/utils.dart';
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
}