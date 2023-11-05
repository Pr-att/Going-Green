import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:going_green/home_icons.dart';
import 'package:going_green/route.dart';

import '../cubit/user_profile_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<UserProfileCubit>(context).getUserProfile();
  }

  final List<String> _taskNames = [
    'Clean up the Beach',
    'Join project bright',
    'Join a green community',
    'Join the Carbon capture movement',
    'Clean up the streets',
    'Plant a tree',
    'Recycle'
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xfffdfdfd),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.0734,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'GREEN THING',
                      style: TextStyle(
                        color: Color(0xFF007940),
                        fontSize: 22,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w900,
                        height: 0,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      const Text(
                        'loyalty points',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xFF303030),
                          fontSize: 12,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset('asset/images/svg/star.svg'),
                          const Text(
                            '1326',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Color(0xFF303030),
                              fontSize: 20,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * 0.04,
            ),
            Container(
              height: screenHeight * 0.76,
              width: screenWidth,
              decoration: const ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x19000000),
                    blurRadius: 50,
                    offset: Offset(0, 12),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(context)
                            .pushNamed(MyAppRouteConstants.profileScreen);
                      },
                      child: BlocBuilder<UserProfileCubit, UserProfileState>(
                        builder: (context, state) {
                          if (state is UserProfileLoaded) {
                            return Container(
                              width: 41,
                              height: 41,
                              decoration: ShapeDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(state.userPhotoUrl!),
                                  fit: BoxFit.fill,
                                ),
                                shape: const OvalBorder(),
                              ),
                            );
                          } else if (state is UserProfileLoading) {
                            return Container(
                              width: 41,
                              height: 41,
                              decoration: const ShapeDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://via.placeholder.com/41x41"),
                                  fit: BoxFit.fill,
                                ),
                                shape: OvalBorder(),
                              ),
                            );
                          } else {
                            return const Text('User');
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    BlocBuilder<UserProfileCubit, UserProfileState>(
                      builder: (context, state) {
                        if (state is UserProfileLoaded) {
                          return Text(
                            state.userName,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Color(0xFF282828),
                              fontSize: 18,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          );
                        } else if (state is UserProfileLoading) {
                          return const CircularProgressIndicator();
                        } else {
                          return const Text('User');
                        }
                      },
                    ),
                    SizedBox(
                      height: screenHeight * 0.001,
                    ),
                    SizedBox(
                      height: screenHeight * 0.64,
                      child: ListView.builder(
                        itemCount: _taskNames.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: GestureDetector(
                              onTap: () {
                                GoRouter.of(context).pushNamed(
                                  MyAppRouteConstants.taskScreen,
                                  extra: {
                                    'kTaskName': _taskNames[index],
                                    'kLoyaltyPoints': 15,
                                  },
                                );
                              },
                              child: Container(
                                width: screenWidth,
                                height: screenHeight * 0.14,
                                decoration: ShapeDecoration(
                                  shadows: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 0.5,
                                      blurRadius: 7,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                  color: const Color(0xFFeafff6),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: screenWidth * 0.6,
                                            child: Text(
                                              _taskNames[index],
                                              style: const TextStyle(
                                                color: Color(0xFF282828),
                                                fontSize: 16,
                                                overflow: TextOverflow.ellipsis,
                                                fontFamily: 'Raleway',
                                                fontWeight: FontWeight.w600,
                                                height: 0,
                                              ),
                                            ),
                                          ),
                                          const Text(
                                            'Choose this task.',
                                            style: TextStyle(
                                              color: Color(0xFF8C8C8C),
                                              fontSize: 12,
                                              fontFamily: 'Raleway',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                            ),
                                          ),
                                          const Spacer(),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                'asset/images/svg/arrow.svg',
                                                height: 30,
                                                width: 30,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              const Text(
                                                'Collect',
                                                style: TextStyle(
                                                  color: Color(0xFF007940),
                                                  fontSize: 12,
                                                  fontFamily: 'Raleway',
                                                  fontWeight: FontWeight.w500,
                                                  height: 0,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              SvgPicture.asset(
                                                'asset/images/svg/star.svg',
                                                height: 20,
                                                width: 20,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              const Text(
                                                '15',
                                                style: TextStyle(
                                                  color: Color(0xFF303030),
                                                  fontSize: 15,
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w600,
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
                                                  fontWeight: FontWeight.w400,
                                                  height: 0,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      const Spacer(),
                                      Image.asset(
                                          'asset/images/images/tree.png'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            )
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
              color: Color(0xFF007940),
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
              color: Color(0xFFD5D5D5),
            ),
            label: 'Offers',
          ),
        ],
        onTap: (index) {
          if (index == 1) {
            GoRouter.of(context).pushNamed(MyAppRouteConstants.scanScreen);
          } else if (index == 2) {
            GoRouter.of(context).pushNamed(
              MyAppRouteConstants.offerScreen,
              extra: {
                'offerId': 'offerId',
                'kNoOfCoupons': 2,
                'kNoOfCompanies': 6
              },
            );
          }
        },
      ),
    );
  }
}
