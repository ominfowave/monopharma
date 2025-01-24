import 'package:flutter/material.dart';

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
}