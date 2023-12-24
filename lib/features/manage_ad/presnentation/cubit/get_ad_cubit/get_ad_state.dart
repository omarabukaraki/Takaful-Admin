import '../../../data/ad_model.dart';

abstract class GetAdState {}

final class GetAdInitialState extends GetAdState {}

final class GetAdLodingState extends GetAdState {}

final class GetAdSuccessState extends GetAdState {
  List<AdModel> adList;
  List<String> adIdList;

  GetAdSuccessState({required this.adList, required this.adIdList});
}

final class GetAdFailureState extends GetAdState {}
