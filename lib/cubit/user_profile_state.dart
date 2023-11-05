part of 'user_profile_cubit.dart';

@immutable
abstract class UserProfileState {}

class UserProfileInitial extends UserProfileState {}

class UserProfileLoading extends UserProfileState {}

class UserProfileLoaded extends UserProfileState {
  final String userName;
  final String userEmail;
  final String? userPhotoUrl;
  UserProfileLoaded({required this.userName, required this.userEmail, this.userPhotoUrl});
}

class UserProfileError extends UserProfileState {}

class UserProfileSignOutLoading extends UserProfileState {}

class UserProfileSignedOut extends UserProfileState {}

class UserProfileSigninLoading extends UserProfileState {}

class UserProfileSigninError extends UserProfileState {}

class UserProfileSigned extends UserProfileState {}

class UserProfileSignupLoading extends UserProfileState {}

class UserProfileSignOutError extends UserProfileState {}
