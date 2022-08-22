class ToolsModel {
  String? type;
  String? message;
  List<ToolsData>? data;


  ToolsModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ToolsData>[];
      json['data'].forEach((v) {
        data!.add(ToolsData.fromJson(v));
      });
    }
  }
}

class ToolsData {
  String? toolId;
  String? name;
  String? description;
  String? imageUrl;

  ToolsData.fromJson(Map<String, dynamic> json) {
    toolId = json['toolId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }
}
