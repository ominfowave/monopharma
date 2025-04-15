import 'package:flutter/material.dart';
import 'package:mono/utils/colors.dart';
import 'package:mono/utils/custom_strings.dart';
import 'package:mono/utils/image_constant.dart';
import 'package:mono/utils/utils.dart';
import 'package:mono/widgets/text_widget.dart';

import '../../Api/api_repo.dart';
import '../../Api/my_api_utils.dart';
import '../../model/product/product view/product_view_response.dart';
import '../../utils/shared_preference.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  static String routeName = '/product_screen';

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  bool isLoading = false;
  ProductViewResponse productViewResponse = ProductViewResponse();
  SharedPref prefs = SharedPref();
  bool isFirst = true;

  @override
  Widget build(BuildContext context) {
    if(isFirst) {
      final args = ModalRoute.of(context)!.settings.arguments as Map;
      fetchProductView(args["productId"]);
      isFirst = false;
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: TextWrapper(
          textShow: CustomString.productDetail,
          textColor: CustomColor.themeColor,
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
      body: isLoading ? const Center(
        child: CircularProgressIndicator(),
      ): Container(
        decoration: Utils.getDecorationBg(),
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  elevation: 10,
                  child: Image.network(
                      productViewResponse.data!.productImage!,
                    width: 280.0,
                    height: 250.0,
                    fit: BoxFit.cover,

                  )),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWrapper(
                        textShow:CustomString.name,
                        textColor: CustomColor.themeColor,
                        fontSize: 14,
                      ),

                      const SizedBox(height: 5),
                      TextWrapper(
                        textShow: productViewResponse.data!.productName ?? '',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(Utils.getImagePath(
                          ImageConstant.cartIconProductDetail)),
                      const SizedBox(
                        width: 20,
                      ),
                      Image.asset(Utils.getImagePath(
                          ImageConstant.favoriteIconProductDetail)),
                      const SizedBox(
                        width: 20,
                      ),
                      Image.asset(Utils.getImagePath(
                          ImageConstant.shareIconProductDetail)),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextWrapper(
                textShow: CustomString.composition,
                textColor: CustomColor.themeColor,
                fontSize: 14,
              ),
              const SizedBox(height: 5),
              TextWrapper(
                textShow: productViewResponse.data!.compositionName ?? '',
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      TextWrapper(
                        textShow: CustomString.category,
                        textColor: CustomColor.themeColor,
                        fontSize: 14,
                      ),
                      const SizedBox(height: 5),
                      TextWrapper(
                        textShow: productViewResponse.data!.categoryName ?? '',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      TextWrapper(
                        textShow: CustomString.division,
                        textColor: CustomColor.themeColor,
                        fontSize: 14,
                      ),
                      const SizedBox(height: 5),
                       TextWrapper(
                        textShow: productViewResponse.data!.divisionName ?? '',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextWrapper(
                textShow: CustomString.segment,
                textColor: CustomColor.themeColor,
                fontSize: 14,
              ),
              const SizedBox(height: 5),
               TextWrapper(
                textShow: productViewResponse.data!.segmentName ?? '',
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card(
                    color: Colors.white,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 20),
                      child: Column(
                        children: [
                          const TextWrapper(
                            textShow: "M.R.P",
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                           TextWrapper(
                            textShow: "₹ ${productViewResponse.data!.productPrice ?? ''}",
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            textColor: CustomColor.themeColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 20),
                      child: Column(
                        children: [
                          const TextWrapper(
                            textShow: "Pack",
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                           TextWrapper(
                            textShow:  productViewResponse.data!.productPack ?? '',
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            textColor: CustomColor.themeColor,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {

                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: CustomColor.themeColor,
                      borderRadius: BorderRadius.circular(50)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Center(
                        child: TextWrapper(
                      textShow: CustomString.lbc,
                      height: 0,
                      textColor: CustomColor.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    )),
                  ),
                ),
              ),
              ],
          ),
        ),
      ),
    );
  }

  // product view api call
  Future<void> fetchProductView(int id ) async {
    setState(() {
      isLoading = true;
    });
    try {
      String? token = await prefs.getToken();
      ApiRepo(token, null, baseUrl: MyApiUtils.baseUrl).productView(
        context,
        id,
        (error) {
          print('API Error: $error');
          Utils.showToast("Server Error: $error");
        },
        (response) {
          setState(() {
            productViewResponse = response;
            isLoading = false;
          });
        },
      );
    } catch (error) {
      print("Error fetching delete product: $error");
    }
  }
}
