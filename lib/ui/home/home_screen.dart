import 'package:flutter/material.dart';
import 'package:mono/utils/colors.dart';
import 'package:mono/utils/custom_strings.dart';
import 'package:mono/widgets/text_widget.dart';

import '../../utils/image_constant.dart';
import '../../utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextWrapper(
          textShow: CustomString.monoPharmaCare,
          fontSize: 25,
          textColor: CustomColor.themeColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      drawer: Drawer(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Drawer Header
            drawerHeader(),

            // list options
            listTileOption(true, Colors.black, ImageConstant.orderIcon,
                "Doctor", 18, () {}, CustomColor.themeColor),
            listTileOption(true, Colors.black, ImageConstant.orderIcon,
                "What is New", 18, () {}, CustomColor.themeColor),
            listTileOption(true, Colors.black, ImageConstant.orderIcon,
                "Favorite Product", 18, () {}, CustomColor.themeColor),
            listTileOption(true, Colors.black, ImageConstant.orderIcon,
                "Glossary", 18, () {}, CustomColor.themeColor),
            listTileOption(true, Colors.black, ImageConstant.orderIcon,
                "Price List", 18, () {}, CustomColor.themeColor),
            listTileOption(true, Colors.black, ImageConstant.orderIcon,
                "Orders", 18, () {}, CustomColor.themeColor),
            listTileOption(true, Colors.black, ImageConstant.orderIcon,
                "My Cart", 18, () {}, CustomColor.themeColor),
            listTileOption(true, Colors.black, ImageConstant.orderIcon,
                "About Us", 18, () {}, CustomColor.themeColor),
            listTileOption(true, Colors.black, ImageConstant.orderIcon,
                "Log Out", 18, () {}, CustomColor.themeColor),
          ],
        ),
      ),
      body: Container(
        decoration: Utils.getDecorationBg(),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: TextField(
                    cursorColor: CustomColor.themeColor,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: const EdgeInsets.all(8),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(
                                color: CustomColor.doNotAccTextColor,
                                width: 1.0)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                color: CustomColor.doNotAccTextColor,
                                width: 1.0)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                color: CustomColor.doNotAccTextColor,
                                width: 1.0)),
                        hintText: 'Find Products ...',
                        hintStyle: const TextStyle(
                            color: CustomColor.doNotAccTextColor, fontSize: 18),
                        suffixIcon: Container(
                          padding: const EdgeInsets.all(15),
                          width: 18,
                          child: const Icon(Icons.search),
                        )),
                    onChanged: (String value) {
                      /*if (value.isNotEmpty) {
                        setState(() {
                          isSearching = true;
                        });
                      }
                      updateSearchQuery(value);*/
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  child:
                      Image.asset(Utils.getImagePath(ImageConstant.filterIcon)),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: GridView.builder(
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,childAspectRatio: 0.9,crossAxisSpacing: 10),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      Card(
                        color: Colors.white,
                        elevation: 5,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        child: Image.asset(
                            Utils.getImagePath(ImageConstant.productImage)),
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWrapper(textShow: "Ketotek - DT",fontSize: 16,fontWeight: FontWeight.bold,),
                              SizedBox(height: 5,),
                              TextWrapper(textShow: "₹ 280.00",fontSize: 14,fontWeight: FontWeight.bold,textColor: CustomColor.greenColor,),
                            ],
                          ),
                          Image.asset(Utils.getImagePath(ImageConstant.cartIcon))
                        ],
                      ),
                    ],
                  ),
                );
              },
            ))
          ],
        ),
      ),
    );
  }

  Widget drawerHeader() {
    return DrawerHeader(
        padding: EdgeInsets.zero,
        child: Container(
          padding: const EdgeInsets.only(left: 15, bottom: 15),
          decoration: BoxDecoration(
              color: CustomColor.themeColor,
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(Utils.getImagePath(ImageConstant.drawerPersonIcon)),
              const SizedBox(
                height: 10,
              ),
              const TextWrapper(
                textShow: "Dhruvit Jikadra",
                textColor: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 10,
              ),
              const TextWrapper(
                textShow: "jikadradhruvit.jd@gmail.com",
                textColor: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              )
            ],
          ),
        ));
  }

  Widget listTileOption(bool isLeading, Color textColor, String? imagePath,
      String message, double fontSize, VoidCallback onTap, Color bgColor) {
    return ListTile(
      onTap: onTap,
      leading: Image.asset(
        Utils.getImagePath(imagePath!),
        color: CustomColor.themeColor,
      ),
      title: TextWrapper(
        textShow: message,
        textColor: textColor,
        fontWeight: FontWeight.w500,
        fontSize: fontSize,
      ),
    );
  }
}
