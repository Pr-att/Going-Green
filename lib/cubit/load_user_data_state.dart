part of 'load_user_data_cubit.dart';

@immutable
abstract class LoadUserDataState {}

class LoadUserDataInitial extends LoadUserDataState {}

class LoadUserDataLoading extends LoadUserDataState {}

class LoadUserDataLoaded extends LoadUserDataState {
  final String? userName;
  final String? userEmail;
  final String? userPhotoUrl;

  LoadUserDataLoaded(
      {required this.userName, required this.userEmail, required this.userPhotoUrl});
}

class LoadUserDataError extends LoadUserDataState {}
