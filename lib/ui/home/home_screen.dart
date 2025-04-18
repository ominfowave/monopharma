import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mono/ui/productDetail/product_detail.dart';
import 'package:mono/utils/colors.dart';
import 'package:mono/utils/custom_strings.dart';
import 'package:mono/widgets/text_widget.dart';

import '../../Api/api_repo.dart';
import '../../Api/my_api_utils.dart';
import '../../model/product/product_listing/product_listing_response.dart';
import '../../model/product/search product/search_product_response.dart';
import '../../model/segments/segments_listing/segments_listing_response.dart';
import '../../utils/image_constant.dart';
import '../../utils/shared_preference.dart';
import '../../utils/utils.dart';
import '../login/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  SharedPref prefs = SharedPref();
  ProductListingResponse productListingResponse = ProductListingResponse();
  SegmentsListingResponse segmentsListingResponse = SegmentsListingResponse();

  SearchProductResponse searchProductResponse = SearchProductResponse();
  TextEditingController divisionController = TextEditingController();
  TextEditingController compositionController = TextEditingController();

  String? currentSelectedSegment;
  SegmentData? selectedSegment;
  String? currentSelectedDivision;

  @override
  void initState() {
    super.initState();
    fetchProductListing();
    fetchSegment();

  }



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
                "Log Out", 18, () {

                  prefs.setToken("");
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                }, CustomColor.themeColor),
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
                  onTap: () {
                    showBottomSheetFilter(context);
                  },
                  child:
                      Image.asset(Utils.getImagePath(ImageConstant.filterIcon)),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: isLoading? const Center(
                  child: CircularProgressIndicator(),
                ): GridView.builder(
              itemCount: productListingResponse.data!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.87,
                  crossAxisSpacing: 10),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, ProductDetail.routeName,arguments: {"productId" : productListingResponse.data![index].id!});
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      children: [
                        Card(
                          color: Colors.white,
                          elevation: 5,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Image.network(productListingResponse.data![index].productImage!),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.3,
                                  child: TextWrapper(
                                    textShow:productListingResponse.data![index].productName,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    maxLine: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                 TextWrapper(
                                  textShow: "₹ ${productListingResponse.data![index].productPrice}",
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  textColor: CustomColor.greenColor,
                                ),
                              ],
                            ),
                            Image.asset(
                                Utils.getImagePath(ImageConstant.cartIcon))
                          ],
                        ),
                      ],
                    ),
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

  showBottomSheetFilter(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
      ),
      builder: (BuildContext context) {
        return Wrap(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child:
              isLoading
                  ? const Center(child: CircularProgressIndicator())
                  :
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWrapper(
                        textShow: CustomString.filters,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      TextWrapper(
                        textShow: CustomString.clear,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        textColor: CustomColor.themeColor,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  InputDecorator(
                    decoration: InputDecoration(
                      labelStyle: GoogleFonts.poppins(color: CustomColor.themeColor, fontSize: 16.0),
                      errorStyle: GoogleFonts.poppins(color: CustomColor.themeColor, fontSize: 16.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                    ),
                    isEmpty: currentSelectedSegment == null,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        dropdownColor: CustomColor.white,
                        value: currentSelectedSegment,
                        isDense: true,
                        hint: Text('Please select Segment', style: GoogleFonts.poppins()),
                        onChanged: (String? newValue) {
                          setState(() {
                            currentSelectedSegment = newValue;

                            // Find the corresponding division name based on the selected segment
                            selectedSegment = segmentsListingResponse.data?.firstWhere(
                                  (segment) => segment.segmentName == currentSelectedSegment,
                            );

                            // Update the division controller with the division name
                            divisionController.text = selectedSegment?.divisionName ?? '';
                          });
                        },
                        items: (segmentsListingResponse.data ?? []).map((segment) {
                          return DropdownMenuItem<String>(
                            value: segment.segmentName,
                            child: Text(segment.segmentName ?? '', style: GoogleFonts.poppins(fontSize: 14)),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextField(
                    controller: divisionController,
                    decoration: InputDecoration(
                      hintText: 'Select a Division',
                      enabled: false,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextField(
                    controller: compositionController,
                    decoration: InputDecoration(
                      hintText: 'Select a Composition',
                      enabled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30,),
                  InkWell(
                    onTap: () {

                  if(selectedSegment != null && compositionController.text.isNotEmpty){
                    int? segmentId  =  selectedSegment?.id;

                    if(segmentId != null){
                      fetchSearchProduct(segmentId, compositionController.text);
                      Navigator.pop(context);
                    }
                  }
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
                              textShow: CustomString.search,
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
          ],
        );
      },
    );
  }

  //product listing api call
  Future<void> fetchProductListing() async {
    setState(() {
      isLoading = true;
    });
    try {
      String? token = await prefs.getToken();
      ApiRepo(token,null, baseUrl: MyApiUtils.baseUrl).productListing(
        context,
            (error) {
          setState(() {
            isLoading = false;
          });
          print('API Error: $error');
          Utils.showToast("Server Error: $error");
        },
            (response) {
          setState(() {
            productListingResponse = response;
            isLoading = false;
          });
        },
      );
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      print("Error fetching product list: $error");
    }
  }

  Future<void> fetchSegment() async {
    setState(() {
      isLoading = true;
    });
    try {
      String? token = await prefs.getToken();
      ApiRepo(token, null, baseUrl: MyApiUtils.baseUrl).segmentsListing(
        context,
            (error) {
          setState(() {
            isLoading = false;
          });
          Utils.showToast("Server Error: $error");
        },
            (response) {
          setState(() {
            segmentsListingResponse = response;
            isLoading = false;
          });
        },
      );
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      print("Error fetching segment list: $error");
    }
  }

  Future<void> fetchSearchProduct(int segmentId, String? composition,) async {
    setState(() {
      isLoading = true;
    });
    try {
      String? token = await prefs.getToken();
      ApiRepo(token, null, baseUrl: MyApiUtils.baseUrl).searchProduct(
        context,
        segmentId,
        composition,
            (error) {
          setState(() {
            isLoading = false;
          });
          Utils.showToast("Server Error: $error");
        },
            (response) {
          setState(() {
            searchProductResponse = response;
            isLoading = false;
          });
        },
      );
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      print("Error fetching segment list: $error");
    }
  }
}
