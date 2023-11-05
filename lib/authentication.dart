import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:going_green/route.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'local_storage.dart';

class UserAuth {
  Future signInWithGoogle(BuildContext context) async {
    try {
      await GoogleSignIn().signIn().then((value) async {
        var email = value?.email;
        var name = value?.displayName;
        var photoUrl = value?.photoUrl;
        await LocalStorage.setString('email', email ?? "").then((value) => {
              LocalStorage.setString('name', name ?? "").then((value) => {
                    LocalStorage.setString('photoUrl', photoUrl ?? "")
                        .then((value) =>
              GoRouter.of(context).goNamed(MyAppRouteConstants.homeScreen))
                  })
            });
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<bool> checkLogin() async => await GoogleSignIn().isSignedIn();

  Future signOutFromGoogle() async {
    if (await checkLogin()) {
      await GoogleSignIn().signOut();
    }
  }
}
