import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:going_green/route.dart';

import '../local_storage.dart';

part 'user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit() : super(UserProfileInitial());

  String userEmail = "";
  String userName = "";
  String userPhotoUrl = "";

  void getUserProfile() async {
    emit(UserProfileLoading());
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      final User? user = auth.currentUser;
      userEmail = (user?.email ?? await LocalStorage.getString('email'))!;
      userName = (user?.displayName ?? await LocalStorage.getString('name'))!;
      try {
        userPhotoUrl =
        (user?.photoURL ?? await LocalStorage.getString('photoUrl'))!;
      } catch (e) {
        userPhotoUrl = "https://via.placeholder.com/150";
      }
      emit(UserProfileLoaded(
          userName: userName, userEmail: userEmail, userPhotoUrl: userPhotoUrl));
    } catch (e) {
      emit(UserProfileError());
    }
  }

  Future signInUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    emit(UserProfileSigninLoading());
    await auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then(
      (value) async {
        await LocalStorage.setString('email', email)
            .then((value) async =>
                await LocalStorage.setString('name', 'John').then(
                  (value) => (value) async {
                    emit(UserProfileSigned());
                    GoRouter.of(context)
                        .goNamed(MyAppRouteConstants.homeScreen);
                  },
                ))
            .catchError(
          (e) async {
            emit(UserProfileSigninError());
            switch (e.code) {
              case 'user-not-found':
                return e.code;
              case 'wrong-password':
                return e.code;
              default:
                return e.code;
            }
          },
        );
      },
    ).catchError(
      (e) async {
        emit(UserProfileSigninError());
        switch (e.code) {
          case 'user-not-found':
            return e.code;
          case 'wrong-password':
            return e.code;
          default:
            return e.code;
        }
      },
    );
  }

  Future signUpUsingEmailPassword(
    String email,
    String password,
    String name,
    String phone,
    BuildContext context,
  ) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    try {
      emit(UserProfileSigninLoading());
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then(
        (value) async {
          await LocalStorage.setString('email', email).then(
            (value) async => await LocalStorage.setString('name', name).then(
              (value) async {
                emit(UserProfileSigned());
                GoRouter.of(context).goNamed(MyAppRouteConstants.homeScreen);
              },
            ),
          );
        },
      );
      return true;
    } on FirebaseAuthException catch (e) {
      emit(UserProfileSigninError());
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
        return false;
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
        return false;
      }
    } catch (e) {
      debugPrint(e as String?);
      return false;
    }
  }

  Future signOut(BuildContext context) async {
    emit(UserProfileSignOutLoading());
    try {
      await LocalStorage.remove('email')
          .then((value) async => await LocalStorage.remove('name'));
      try {
        await LocalStorage.remove('photoUrl');
      } catch (e) {
        debugPrint(e.toString());
      }
      emit(UserProfileSignedOut());
    } catch (e) {
      emit(UserProfileSignOutError());
    }
    try {
      await FirebaseAuth.instance.signOut();
      emit(UserProfileSignedOut());
    } catch (e) {
      emit(UserProfileSignedOut());
    }
  }
}
