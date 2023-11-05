import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:going_green/route.dart';

import '../home_icons.dart';

class OfferCompanyScreen extends StatelessWidget {
  final String kCompanyName;
  final int kNoOfCoupons;
  final Widget kCompanyLogo;
  const OfferCompanyScreen(
      {super.key,
      required this.kCompanyName,
      required this.kNoOfCoupons,
      required this.kCompanyLogo});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GREEN THING',
          style: TextStyle(
            color: Color(0xFF007940),
            fontSize: 22,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w900,
            height: 0,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            kCompanyLogo,
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: screenHeight * 0.75,
              child: ListView.builder(
                itemCount: kNoOfCoupons,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0.5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 130,
                            width: 130,
                            decoration: BoxDecoration(
                              color: const Color(0xffeafff6),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: kCompanyLogo),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'ARTICLE #203/GY',
                                style: TextStyle(
                                  color: Color(0xff8c8c8c),
                                  fontSize: 12,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.bold,
                                  height: 0,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'asset/images/svg/star.svg',
                                    height: 20,
                                    width: 20,
                                    color: Colors.yellow,
                                  ),
                                  const Text(
                                    '100',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800,
                                      height: 0,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text(
                                    'Loyalty points',
                                    style: TextStyle(
                                      color: Color(0xFF007940),
                                      fontSize: 12,
                                      fontFamily: 'Raleway',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: const Text(
                                  'Get 20% Discount',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.w800,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 80.0),
                            child: GestureDetector(
                              onTap: () {},
                              child: const CircleAvatar(
                                radius: 16,
                                backgroundColor: Color(0xff007940),
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 17,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
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
