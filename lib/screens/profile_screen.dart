import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:going_green/cubit/load_user_data_cubit.dart';
import 'package:going_green/cubit/user_profile_cubit.dart';

import '../home_icons.dart';
import '../route.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<LoadUserDataCubit>(context).loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: screenHeight * 0.03),
                      BlocBuilder<LoadUserDataCubit, LoadUserDataState>(
                        builder: (context, state) {
                          if (state is LoadUserDataLoaded) {
                            return CircleAvatar(
                              radius: 25,
                              backgroundImage:
                                  NetworkImage(state.userPhotoUrl!),
                            );
                          } else {
                            return const CircleAvatar(
                              radius: 25,
                              backgroundImage: NetworkImage(
                                  'https://via.placeholder.com/150'),
                            );
                          }
                        },
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(height: screenHeight * 0.02),
                              BlocBuilder<LoadUserDataCubit, LoadUserDataState>(
                                builder: (context, state) {
                                  if (state is LoadUserDataLoaded) {
                                    return Text(
                                      state.userName!,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.w800,
                                        height: 0,
                                      ),
                                    );
                                  } else {
                                    return const Text(
                                      'Loading...',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    );
                                  }
                                },
                              ),
                              const SizedBox(width: 5),
                              const Icon(
                                Icons.edit_rounded,
                                color: Colors.black,
                                size: 18,
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          BlocBuilder<LoadUserDataCubit, LoadUserDataState>(
                            builder: (context, state) {
                              if (state is LoadUserDataLoaded) {
                                return Text(
                                  state.userEmail!,
                                  style: const TextStyle(
                                    color: Color(0xFF007940),
                                    fontSize: 18,
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                  ),
                                );
                              } else {
                                return const Text(
                                  'Loading...',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ],
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
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Completed Tasks',
                        style: TextStyle(
                          color: Color(0xFF303030),
                          fontSize: 15,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '(12)',
                        style: TextStyle(
                          color: Color(0xFF007940),
                          fontSize: 20,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Points Spend',
                        style: TextStyle(
                          color: Color(0xFF303030),
                          fontSize: 15,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '(596)',
                        style: TextStyle(
                          color: Color(0xFF007940),
                          fontSize: 20,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                  Visibility(
                    visible: false,
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Color(0xFF303030),
                      size: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Divider(),
              const Spacer(),
              GestureDetector(
                onTap: () async {
                  await BlocProvider.of<UserProfileCubit>(context)
                      .signOut(context)
                      .then((value) async => GoRouter.of(context)
                          .goNamed(MyAppRouteConstants.initialScreen));
                },
                child: Container(
                  width: screenWidth,
                  height: 45,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFef584d),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Logout',
                      style: TextStyle(
                        color: Color(0xFFFCFCFC),
                        fontSize: 14,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
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
