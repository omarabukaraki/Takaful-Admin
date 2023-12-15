class PostModel {
  final String? id;
  final bool? postState;
  final String? title;
  final List<dynamic>? image;
  final String? category;
  final String? itemOrService;
  final String? description;
  final String? location;
  final String? subLocation;
  final int? count;
  final String? state;
  final String? createAt;
  final String? donarAccount;
  final String? typeOfDonation;
  final bool? isTaken;
  PostModel(
      {this.id,
      this.postState,
      this.title,
      this.image,
      this.category,
      this.itemOrService,
      this.description,
      this.location,
      this.subLocation,
      this.count,
      this.state,
      this.createAt,
      this.donarAccount,
      this.typeOfDonation,
      this.isTaken});

  factory PostModel.fromJson(dynamic jsonData) {
    return PostModel(
        title: jsonData['title'],
        id: jsonData['id'],
        postState: jsonData['postState'],
        image: jsonData['image'],
        category: jsonData['category'],
        itemOrService: jsonData['itemOrService'],
        description: jsonData['description'],
        location: jsonData['location'],
        subLocation: jsonData['subLocation'],
        count: jsonData['count'],
        state: jsonData['state'],
        createAt: jsonData['createAt'],
        donarAccount: jsonData['donarAccount'],
        typeOfDonation: jsonData['typeOfDonation'],
        isTaken: jsonData['isTaken']);
  }
}
