import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:going_green/firebase_options.dart';
import 'package:going_green/route.dart';

import 'cubit/load_user_data_cubit.dart';
import 'cubit/user_profile_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserProfileCubit(),
        ),
        BlocProvider(
          create: (context) => LoadUserDataCubit(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
