import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:going_green/cubit/user_profile_cubit.dart';

import '../route.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'GREEN THING',
          style: TextStyle(
              color: Color(0xFF007940),
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SizedBox(
            height: screenHeight * 0.9,
            child: SingleChildScrollView(
              child: SizedBox(
                height: screenHeight * 0.9,
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                          const Text(
                            "Create new account",
                            style: TextStyle(
                                fontFamily: "Raleway",
                                fontWeight: FontWeight.bold,
                                fontSize: 32),
                          ),
                          SizedBox(
                            height: screenHeight * 0.008,
                          ),
                          const Text(
                            "Please sign up to fill details continue using app",
                            style: TextStyle(
                              fontFamily: "Raleway",
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.05,
                          ),
                          TextFormField(
                            validator: (value) {
                              int count = 0;
                              for (int i = 0; i < value!.length; i++) {
                                if (value[i] == ' ') {
                                  count++;
                                }
                              }
                              if (count == value.length) {
                                return 'Please enter name';
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.name,
                            controller: _nameController,
                            decoration: InputDecoration(
                              labelText: 'Enter your name',
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
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                          TextFormField(
                            validator: (value) {
                              RegExp regex = RegExp(
                                  r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
                              if (!regex.hasMatch(value!)) {
                                return 'Enter Valid Email';
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.emailAddress,
                            controller: _emailController,
                            decoration: InputDecoration(
                              labelText: 'Enter your email',
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
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                          TextFormField(
                            validator: (value) {
                              RegExp regex = RegExp(
                                  r'^\(?(\d{3})\)?[- ]?(\d{3})[- ]?(\d{4})$');
                              if (!regex.hasMatch(value!)) {
                                return 'Enter Valid Phone Number';
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.phone,
                            controller: _phoneController,
                            decoration: InputDecoration(
                              labelText: 'Enter your phone number',
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
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                          TextFormField(
                            validator: (value) {
                              int count = 0;
                              for (int i = 0; i < value!.length; i++) {
                                if (value[i] == ' ') {
                                  count++;
                                }
                              }
                              if (count == value.length) {
                                return 'Please enter password';
                              } else if (value.length < 6) {
                                return 'Password must be atleast 6 characters';
                              } else {
                                return null;
                              }
                            },
                            controller: _passwordController,
                            decoration: InputDecoration(
                              labelText: 'Enter your password',
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
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value != _passwordController.text) {
                                return 'Password not matched';
                              }
                              return null;
                            },
                            controller: _confirmPasswordController,
                            decoration: InputDecoration(
                              labelText: 'Confirm your password',
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
                          SizedBox(
                            height: screenHeight * 0.05,
                          ),
                          GestureDetector(
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                if (_passwordController.text ==
                                    _confirmPasswordController.text) {
                                  BlocProvider.of<UserProfileCubit>(context)
                                      .signUpUsingEmailPassword(
                                          _emailController.text,
                                          _passwordController.text,
                                          _nameController.text,
                                          _phoneController.text,
                                          context);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Password not matched',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontFamily: 'Raleway',
                                          fontWeight: FontWeight.w700,
                                          height: 0,
                                        ),
                                      ),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
                              }
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
                                child: BlocBuilder<UserProfileCubit,
                                    UserProfileState>(
                                  builder: (context, state) {
                                    if (state is UserProfileInitial) {
                                      return const Text(
                                        'Sign Up',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontFamily: 'Raleway',
                                          fontWeight: FontWeight.w700,
                                          height: 0,
                                        ),
                                      );
                                    } else {
                                      return const Text(
                                        'Loading...',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
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
                        ],
                      ),
                    ),
                    const Spacer(),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account? ',
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
                              'Login',
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
                                  .goNamed(MyAppRouteConstants.initialScreen);
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
          ),
        ),
      ),
    );
  }
}
