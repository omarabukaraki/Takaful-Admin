part of 'get_users_cubit.dart';

@immutable
abstract class GetUsersState {}

final class GetUsersInitial extends GetUsersState {}

// ignore: must_be_immutable
final class GetUsersSuccess extends GetUsersState {
  List<UserModel> users;
  GetUsersSuccess({required this.users});
}

final class GetUsersLoading extends GetUsersState {}

final class GetUsersFailure extends GetUsersState {}
