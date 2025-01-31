import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mono/utils/colors.dart';
import 'package:mono/utils/custom_strings.dart';
import 'package:mono/utils/utils.dart';
import 'package:mono/widgets/text_widget.dart';

class PriceListScreen extends StatefulWidget {
  const PriceListScreen({super.key});

  @override
  State<PriceListScreen> createState() => _PriceListScreenState();
}

class _PriceListScreenState extends State<PriceListScreen> {
  var segments = [
    "Segment 1",
    "Segment 2",
  ];

  var division = [
    "Division 1",
    "Division 2",
  ];
  String currentSelectedSegment = "Segment 1";
  String currentSelectedDivision = "Division 1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: TextWrapper(textShow: CustomString.priceList,fontWeight: FontWeight.bold,fontSize: 25,textColor: CustomColor.themeColor,),
      ),
      body: Container(
        decoration: Utils.getDecorationBg(),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            InputDecorator(
              decoration: InputDecoration(
                labelStyle:  GoogleFonts.poppins(color: CustomColor.themeColor, fontSize: 16.0),
                errorStyle: GoogleFonts.poppins(color: CustomColor.themeColor, fontSize: 16.0),
                hintText: 'Please select State',
                border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: CustomColor.prefixIconColor,)),),
              isEmpty: currentSelectedSegment == '',
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  dropdownColor: CustomColor.white,
                  value: currentSelectedSegment,
                  isDense: true,
                  onChanged: (String? newValue) {
                    setState(() {
                      currentSelectedSegment = newValue!;
                      // state.didChange(newValue);
                    });
                  },
                  items: segments.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            InputDecorator(
              decoration: InputDecoration(
                labelStyle:  GoogleFonts.poppins(color: CustomColor.themeColor, fontSize: 16.0),
                errorStyle: GoogleFonts.poppins(color: CustomColor.themeColor, fontSize: 16.0),
                hintText: 'Please select State',
                border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: CustomColor.prefixIconColor,)),),
              isEmpty: currentSelectedDivision == '',
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  dropdownColor: CustomColor.white,
                  value: currentSelectedDivision,
                  isDense: true,
                  onChanged: (String? newValue) {
                    setState(() {
                      currentSelectedDivision = newValue!;
                    });
                  },
                  items: division.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            GestureDetector(
              onTap: () {
                // show list below
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
                      )),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            TextWrapper(textShow: CustomString.generatePDFShowBelow,fontSize: 16,)
          ],
        ),
      ),
    );
  }
}
