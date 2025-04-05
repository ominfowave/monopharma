import 'package:flutter/material.dart';
import 'package:mono/ui/cart/cart_screen.dart';
import 'package:mono/ui/favourite/favourite_screen.dart';
import 'package:mono/ui/pricelist/price_list_screen.dart';
import 'package:mono/utils/colors.dart';

import '../../utils/custom_strings.dart';
import '../../utils/image_constant.dart';
import '../../utils/utils.dart';
import '../home/home_screen.dart';
import '../order/order_screen.dart';

class DashboardBaseScreen extends StatefulWidget {
  const DashboardBaseScreen({super.key});

  static String routeName = '/dashboardBase_screen';

  @override
  State<DashboardBaseScreen> createState() => _DashboardBaseScreenState();
}

class _DashboardBaseScreenState extends State<DashboardBaseScreen> {
  late List<Widget> screen;
  int selectedIndex = 0;
  bool isFirst = true;

  @override
  Widget build(BuildContext context) {
    if(isFirst) {
      screen = [
         const HomeScreen(),
        const OrderScreen(),
        const CartScreen(),
        const PriceListScreen(),
        const FavouriteScreen()
      ];
      isFirst = false;
    }
    return Scaffold(
      body: screen[selectedIndex],
      bottomNavigationBar: btmNavigationBar(),
    );
  }

  Widget btmNavigationBar(){
    return BottomNavigationBar(
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: CustomColor.themeColor,
        unselectedItemColor: CustomColor.doNotAccTextColor,
        onTap: (value) {
          /* if (value == 0 && selectedIndex == 0) {
            final currentTime = DateTime.now();
            if (_lastTappedTime != null &&
                currentTime.difference(_lastTappedTime!) <=
                    const Duration(seconds: 1)) {
              if (Platform.isAndroid) {
                SystemNavigator.pop();
              } else if (Platform.isIOS) {
                exit(0);
              }
            }
            _lastTappedTime = currentTime;
          } else {
            setState(() {
              selectedIndex = value;
            });
          }*/
          setState(() {
            selectedIndex = value;
          });
        },
        elevation: 2,
        items: [
          navigationItem(ImageConstant.orderIcon, CustomString.home),
          navigationItem(ImageConstant.orderIcon, CustomString.order),
          navigationItem(ImageConstant.myCartIcon, CustomString.myCart),
          navigationItem(ImageConstant.priceListIcon, CustomString.priceList),
          navigationItem(ImageConstant.favoriteIcon, CustomString.favorite),
        ]);
  }

  BottomNavigationBarItem navigationItem(String imagePath, String labelName){
    return  BottomNavigationBarItem(
      icon: Image.asset(
        Utils.getImagePath(imagePath),
        color: CustomColor.doNotAccTextColor,
      ),
      label: labelName,
      activeIcon: Image.asset(
        Utils.getImagePath(imagePath),
        color: CustomColor.themeColor,
      ),
    );
  }
}
