// ignore_for_file: public_member_api_docs, sort_constructors_first

class RequestModel {
  String timeRequest;
  RequestModel({
    required this.timeRequest,
  });

  factory RequestModel.fromJson(jsonData) {
    return RequestModel(timeRequest: jsonData['timeRequest']);
  }
}
