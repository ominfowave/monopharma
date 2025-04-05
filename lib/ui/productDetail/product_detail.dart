import 'package:flutter/material.dart';
import 'package:mono/utils/colors.dart';
import 'package:mono/utils/custom_strings.dart';
import 'package:mono/utils/image_constant.dart';
import 'package:mono/utils/utils.dart';
import 'package:mono/widgets/text_widget.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  static String routeName = '/product_screen';

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
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
      body: Container(
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
                  child: Image.asset(
                      Utils.getImagePath(ImageConstant.productDetail)),
                ),
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
                        textShow: CustomString.name,
                        textColor: CustomColor.themeColor,
                        fontSize: 14,
                      ),
                      const SizedBox(height: 5),
                      const TextWrapper(
                        textShow: "Ketotek - DT",
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
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
              const TextWrapper(
                textShow: "White Soft Paraffin 13.2 % w/w + Liquid Paraffin",
                fontWeight: FontWeight.w500,
                fontSize: 18,
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
                      const TextWrapper(
                        textShow: "Anti-biotic",
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
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
                      const TextWrapper(
                        textShow: "Nemi Pharmaceuticals",
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
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
              const TextWrapper(
                textShow: "Demaroz, Skin Care Soap / Lotion & Wash",
                fontWeight: FontWeight.w500,
                fontSize: 18,
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
                          horizontal: 50.0, vertical: 20),
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
                          const TextWrapper(
                            textShow: "250.00",
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
                          horizontal: 50.0, vertical: 20),
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
                          const TextWrapper(
                            textShow: "1*75gm",
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
                onTap: () {},
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
}
