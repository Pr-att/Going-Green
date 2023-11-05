import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../home_icons.dart';
import '../route.dart';

class OfferScreen extends StatefulWidget {
  final String offerId;
  final int kNoOfCoupons;
  final int kNoOfCompanies;
  const OfferScreen(
      {super.key,
      required this.offerId,
      required this.kNoOfCoupons,
      required this.kNoOfCompanies});

  @override
  State<OfferScreen> createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  final List<Widget> kCompanyLogos = [
    SvgPicture.asset(
      'asset/images/svg/mcd.svg',
      height: 50,
      width: 50,
    ),
    SvgPicture.asset(
      'asset/images/companyLogos/kfc.svg',
      height: 50,
      width: 50,
    ),
    SvgPicture.asset(
      'asset/images/companyLogos/burger-king.svg',
      height: 50,
      width: 50,
    ),
    SvgPicture.asset(
      'asset/images/companyLogos/subway.svg',
      height: 50,
      width: 50,
    ),
    SvgPicture.asset(
      'asset/images/companyLogos/pizza-hut.svg',
      height: 50,
      width: 50,
    ),
    SvgPicture.asset(
      'asset/images/companyLogos/dominos-pizza.svg',
      height: 50,
      width: 50,
    ),
    SvgPicture.asset(
      'asset/images/companyLogos/starbucks.svg',
      height: 50,
      width: 50,
    ),
    SvgPicture.asset(
      'asset/images/companyLogos/costa.svg',
      height: 50,
      width: 50,
    ),
    SvgPicture.asset(
      'asset/images/companyLogos/dunkin-donuts.svg',
      height: 50,
      width: 50,
    ),
  ];

  final List<String> kCompanyNames = [
    'MC Donald\'s',
    'KFC',
    'Burger King',
    'Subway',
    'Pizza Hut',
    'Domino\'s',
    'Starbucks',
    'Costa Coffee',
    'Dunkin\' Donuts',
  ];

  final List<int> kCouponsNumbers = [
    5,
    3,
    2,
    4,
    1,
    2,
    3,
    4,
    5,
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Offers',
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: GridView.builder(
            itemCount: kCompanyNames.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  GoRouter.of(context).pushNamed(
                    MyAppRouteConstants.offerCompanyScreen,
                    extra: {
                      'kCompanyName': kCompanyNames[index],
                      'kNoOfCoupons': kCouponsNumbers[index],
                      'kCompanyLogo': kCompanyLogos[index],
                    },
                  );
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    color: const Color(0xffeafff6),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        kCompanyLogos[index],
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: screenWidth * 0.3,
                          child: Text(
                            kCompanyNames[index],
                            style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: Colors.black,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${kCouponsNumbers[index]} Coupons Available',
                          style: const TextStyle(
                            color: Color(0xFF007940),
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xfffdfdfd),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Home.home,
              color: Color(0xFFD5D5D5),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Home.scan,
              color: Color(0xFFD5D5D5),
            ),
            label: 'Offers',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Home.offer,
              color: Color(0xFF007940),
            ),
            label: 'Offers',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            GoRouter.of(context).pushNamed(MyAppRouteConstants.homeScreen);
          } else if (index == 1) {
            GoRouter.of(context).pushNamed(MyAppRouteConstants.scanScreen,
                extra: {'offerId': 'offerId'});
          }
        },
      ),
    );
  }
}
