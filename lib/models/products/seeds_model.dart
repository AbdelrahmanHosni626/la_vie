class SeedsModel {
  String? type;
  String? message;
  List<SeedsData>? data;


  SeedsModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    if (json['data'] != null) {
      data = <SeedsData>[];
      json['data'].forEach((v) {
        data!.add(new SeedsData.fromJson(v));
      });
    }
  }
}

class SeedsData {
  String? seedId;
  String? name;
  String? description;
  String? imageUrl;


  SeedsData.fromJson(Map<String, dynamic> json) {
    seedId = json['seedId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }
}
