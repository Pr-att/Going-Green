import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:going_green/home_icons.dart';
import 'package:going_green/route.dart';
import 'package:image_picker/image_picker.dart';

class TaskScreen extends StatefulWidget {
  final String kTaskName;
  final int kLoyaltyPoints;
  const TaskScreen(
      {super.key, required this.kTaskName, required this.kLoyaltyPoints});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(
        () {
          _images.add(
            Image.file(
              File(image.path),
              height: 50,
              width: 50,
            ),
          );
        },
      );
    }
  }

  final List<Widget> _images = [
    Image.asset(
      'asset/images/images/tree.png',
      height: 50,
      width: 50,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Task',
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 20, right: 20),
          child: Column(
            children: [
              Image.asset(
                'asset/images/images/tree.png',
                height: 100,
                width: 200,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.kTaskName,
                style: const TextStyle(
                  fontSize: 25,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF007940),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Get',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Raleway',
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  SvgPicture.asset(
                    'asset/images/svg/star.svg',
                    height: 25,
                    width: 25,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    widget.kLoyaltyPoints.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    'Loyalty Points',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Raleway',
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: screenWidth,
                height: 130,
                decoration: ShapeDecoration(
                  color: const Color(0xFFEAFFF6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Row(
                          children: [
                            for (int i = 0; i < 70; i++)
                              Container(
                                width: 5,
                                height: 1,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF007940),
                                  border: Border(
                                    bottom: BorderSide(
                                      width: 1,
                                      color: i % 2 == 0
                                          ? const Color.fromRGBO(
                                              214, 211, 211, 1)
                                          : Colors.transparent,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () async {
                          if (_images.length < 10) await pickImage();
                        },
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'asset/images/svg/add.svg',
                                height: 30,
                                width: 30,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                'Add Upto 10 Images',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF007940),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Row(
                          children: [
                            for (int i = 0; i < 70; i++)
                              Container(
                                width: 5,
                                height: 1,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF007940),
                                  border: Border(
                                    bottom: BorderSide(
                                      width: 1,
                                      color: i % 2 == 0
                                          ? const Color.fromRGBO(
                                              214, 211, 211, 1)
                                          : Colors.transparent,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              FutureBuilder(
                future: null,
                builder: (context, value) => GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(5),
                      child: Stack(
                        children: [
                          _images[index],
                          Positioned(
                            top: -10,
                            right: -10,
                            child: GestureDetector(
                              onTap: () {
                                setState(
                                  () {
                                    _images.removeAt(index);
                                  },
                                );
                              },
                              child: SvgPicture.asset(
                                'asset/images/svg/close.svg',
                                height: 30,
                                width: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: _images.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () async {},
                child: Container(
                  width: screenWidth,
                  height: 45,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF007940),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Done',
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

class DotWidget extends StatelessWidget {
  final double totalWidth, dashWidth, emptyWidth, dashHeight;
  final Color dashColor;
  final Widget child;

  const DotWidget({
    super.key,
    this.totalWidth = 100,
    this.dashWidth = 10,
    this.emptyWidth = 5,
    this.dashHeight = 2,
    this.dashColor = Colors.black,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        totalWidth ~/ (dashWidth + emptyWidth),
        (_) => Container(
          width: dashWidth,
          height: dashHeight,
          color: dashColor,
          margin: EdgeInsets.only(left: emptyWidth / 2, right: emptyWidth / 2),
        ),
      ),
    );
  }
}
