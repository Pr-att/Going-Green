import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:going_green/authentication.dart';
import 'package:going_green/constants.dart';
import 'package:going_green/local_storage.dart';
import 'package:going_green/route.dart';

import '../cubit/user_profile_cubit.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    LocalStorage.getString('email').then(
      (value) {
        if (value != null) {
          GoRouter.of(context).goNamed(MyAppRouteConstants.homeScreen);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.120,
              ),
              const Text(
                'Welcome to',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF282828),
                  fontSize: 18,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              const Text(
                'GREEN THING',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF007940),
                  fontSize: 40,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w900,
                  height: 0,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Login to ',
                      style: TextStyle(
                        color: Color(0xFF909090),
                        fontSize: 12,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: 'Going Thing',
                      style: TextStyle(
                        color: Color(0xFF007940),
                        fontSize: 12,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: ' and manage your daily tasks!',
                      style: TextStyle(
                        color: Color(0xFF909090),
                        fontSize: 12,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: screenHeight * 0.150,
              ),
              GestureDetector(
                onTap: () async {
                  showProgress(context);
                  await UserAuth().signInWithGoogle(context).then(
                        (value) => GoRouter.of(context).pop(),
                      );
                },
                child: Container(
                  width: screenWidth,
                  height: 45,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFCFCFC),
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 1, color: Color(0xFFEAEAEA)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'asset/images/svg/google.svg',
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Login with Google',
                        style: TextStyle(
                          color: Color(0xFF282828),
                          fontSize: 14,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'or continue with email',
                style: TextStyle(
                  color: Color(0xFF676767),
                  fontSize: 12,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: const TextStyle(
                    color: Color(0xff007940),
                    fontSize: 15,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide(
                      color: Color(0xffC2C2C2),
                    ),
                  ),
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Color(0xff007940),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: isPasswordVisible,
                keyboardType: TextInputType.visiblePassword,
                controller: _passwordController,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                    icon: Icon(
                      isPasswordVisible == true
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: const Color(0xFFC2C2C2),
                    ),
                  ),
                  labelText: 'Password',
                  labelStyle: const TextStyle(
                    color: Color(0xff007940),
                    fontSize: 15,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide(
                      color: Color(0xffC2C2C2),
                    ),
                  ),
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Color(0xff007940),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Color(0xFF007940),
                      fontSize: 15,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                      height: 0,
                    ),
                  ),
                  onPressed: () {
                    GoRouter.of(context)
                        .pushNamed(MyAppRouteConstants.forgotPasswordScreen);
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  BlocProvider.of<UserProfileCubit>(context)
                      .signInUsingEmailPassword(
                          email: _emailController.text,
                          password: _passwordController.text,
                          context: context);
                },
                child: Container(
                  width: screenWidth,
                  height: 45,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF007940),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Center(
                    child: BlocBuilder<UserProfileCubit, UserProfileState>(
                      builder: (context, state) {
                        if (state is UserProfileSigninLoading) {
                          return const Text(
                            'Loading...',
                            style: TextStyle(
                              color: Color(0xFFFCFCFC),
                              fontSize: 14,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          );
                        } else if (state is UserProfileSigninError) {
                          return const Text(
                            'Error',
                            style: TextStyle(
                              color: Color(0xFFFCFCFC),
                              fontSize: 14,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          );
                        } else {
                          return const Text(
                            'Login',
                            style: TextStyle(
                              color: Color(0xFFFCFCFC),
                              fontSize: 14,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Not register yet? ',
                      style: TextStyle(
                        color: Color(0xFF676767),
                        fontSize: 12,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                        // height: 0,
                      ),
                    ),
                    TextButton(
                      child: const Text(
                        'Create an account',
                        style: TextStyle(
                          color: Color(0xFF007940),
                          fontSize: 12,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w700,
                          // height: 0,
                        ),
                      ),
                      onPressed: () {
                        GoRouter.of(context)
                            .goNamed(MyAppRouteConstants.signUpScreen);
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
