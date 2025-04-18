import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'image_constant.dart';

class Utils{
  /*
  * This method is use to load image from assets
  * */
  static String getImagePath(String imageName) {
    return "assets/images/$imageName";
  }

  /*
  * This method is used to put background decoration
  * */
  static BoxDecoration getDecorationBg(){
    return BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage(
            Utils.getImagePath(ImageConstant.backgroundImage),
          ),
          fit: BoxFit.cover,
        ));
  }
  // check internet is connected or not
  static Future<bool> isInternetConnected() async {
    if (await InternetConnectionChecker().hasConnection) {
      // Mobile data detected & internet connection confirmed.
      return true;
    } else {
      // Mobile data detected but no internet connection found.
      return false;
    }
  }
  static getErrorApi(DioException e, Function(String p1) onError, BuildContext context){
    if(e.type == DioExceptionType.connectionTimeout || e.type == DioExceptionType.receiveTimeout || e.type == DioExceptionType.unknown){
      onError("Connection timeout. Please check your internet connection and try again.");
    } else if (e.response == null){
      onError("Something went wrong. Please try again later.");
    }else if(e.response!.statusCode == 400){
      onError(e.response!.data.toString());
    }else if(e.response!.statusCode == 404){
      onError(e.response!.data["message"] ?? "");
    }else {
      onError("Something went wrong. Please try again later.");
    }
  }
  static showToast(String toastMsg) {
    Fluttertoast.showToast(msg: toastMsg);
  }

}
