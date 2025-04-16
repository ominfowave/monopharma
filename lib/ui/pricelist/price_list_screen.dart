import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mono/utils/colors.dart';
import 'package:mono/utils/custom_strings.dart';
import 'package:mono/utils/utils.dart';
import 'package:mono/widgets/text_widget.dart';

import '../../Api/api_repo.dart';
import '../../Api/my_api_utils.dart';
import '../../model/divisions/divisions_listing/divisions_listing_response.dart';

import '../../model/product/generate pdf/generate_product_response.dart';
import '../../model/product/user all pdf/user_all_pdf_response.dart';
import '../../model/segments/segments_listing/segments_listing_response.dart';
import '../../utils/shared_preference.dart';


class PriceListScreen extends StatefulWidget {
  const PriceListScreen({super.key});

  @override
  State<PriceListScreen> createState() => _PriceListScreenState();
}

class _PriceListScreenState extends State<PriceListScreen> {
  bool isLoading = false;
  SharedPref prefs = SharedPref();

  SegmentsListingResponse segmentsListingResponse = SegmentsListingResponse();
  DivisionsListingResponse divisionsListingResponse = DivisionsListingResponse();
  UserAllPdfResponse userAllPdfResponse = UserAllPdfResponse();
  GenerateProductResponse generateProductResponse = GenerateProductResponse();
  TextEditingController divisionController = TextEditingController();

  String? currentSelectedSegment;
  String? currentSelectedDivision;

  @override
  void initState() {
    super.initState();
    fetchSegment();
    fetchUserPdf();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: TextWrapper(
          textShow: CustomString.priceList,
          fontWeight: FontWeight.bold,
          fontSize: 25,
          textColor: CustomColor.themeColor,
        ),
      ),
      body: Container(
        decoration: Utils.getDecorationBg(),
        padding: const EdgeInsets.all(20),
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
          children: [
            // Segment Dropdown
            InputDecorator(
              decoration: InputDecoration(
                labelStyle: GoogleFonts.poppins(color: CustomColor.themeColor, fontSize: 16.0),
                errorStyle: GoogleFonts.poppins(color: CustomColor.themeColor, fontSize: 16.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: CustomColor.prefixIconColor),
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
                      final selectedSegment = segmentsListingResponse.data?.firstWhere(
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

            const SizedBox(height: 20),

            // Division TextField
            TextField(
              controller: divisionController,
              decoration: InputDecoration(
                hintText: 'Select a Division',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Generate PDF Button
            GestureDetector(
              onTap: () {
                // Add your logic for generating the PDF
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
                      textShow: CustomString.generatePDF,
                      height: 0,
                      textColor: CustomColor.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Note Text
            TextWrapper(
              textShow: CustomString.generatePDFShowBelow,
              fontSize: 16,
            ),
            const SizedBox(height: 20),

            // ListView to display segments or other data
            Expanded(
              child: ListView.builder(
                itemCount: userAllPdfResponse.data?.length ?? 0,
                itemBuilder: (context, index) {


                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(
                        userAllPdfResponse.data![index].url ??'Unknown Segment',
                        style: GoogleFonts.poppins(fontSize: 16),
                      ),

                    ),
                  );
                },
              ),
            ),
          ],
        ),





    ));}

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

  Future<void> fetchUserPdf() async {
    setState(() {
      isLoading = true;
    });
    try {
      String? token = await prefs.getToken();
      ApiRepo(token, null, baseUrl: MyApiUtils.baseUrl).userAllPdf(
        context,
            (error) {
          setState(() {
            isLoading = false;
          });
          Utils.showToast("Server Error: $error");
        },
            (response) {
          setState(() {
            userAllPdfResponse = response;
            isLoading = false;
          });
        },
      );
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      print("Error fetching user PDFs: $error");
    }
  }
}
