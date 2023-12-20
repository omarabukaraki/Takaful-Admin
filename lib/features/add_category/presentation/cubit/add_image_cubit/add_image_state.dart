part of 'add_image_cubit.dart';

abstract class AddImageState {}

final class AddImageInitial extends AddImageState {}

final class AddImageSuccess extends AddImageState {
  String url;
  AddImageSuccess({required this.url});
}

final class AddImageLoading extends AddImageState {}

final class AddImageFailure extends AddImageState {}
