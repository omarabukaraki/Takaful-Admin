import '../../../data/ad_model.dart';

abstract class GetAdState {}

final class GetAdInitialState extends GetAdState {}

final class GetAdLodingState extends GetAdState {}

final class GetAdSuccessState extends GetAdState {
  List<AdModel> adList = [];

  GetAdSuccessState(this.adList);
}

final class GetAdFailureState extends GetAdState {}
