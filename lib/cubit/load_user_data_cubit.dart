import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:going_green/local_storage.dart';
import 'package:meta/meta.dart';

part 'load_user_data_state.dart';

class LoadUserDataCubit extends Cubit<LoadUserDataState> {
  LoadUserDataCubit() : super(LoadUserDataInitial());

  String? userEmail = "";
  String? userName = "";
  String? userPhotoUrl = "";

  void loadUserData() async {
    emit(LoadUserDataLoading());
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
      emit(LoadUserDataLoaded(
          userName: userName ?? "User",
          userEmail: userEmail ?? "",
          userPhotoUrl: userPhotoUrl),);
    } catch (e) {
      emit(LoadUserDataError());
    }
  }
}
