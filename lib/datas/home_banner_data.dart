class HomeBannerData {
  List<BannerItemData>? data;
  int? errorCode;
  String? errorMsg;

  HomeBannerData({this.data, this.errorCode, this.errorMsg});

  HomeBannerData.fromJson(Map<String, dynamic> json) {
    if (json["data"] is List) {
      data = json["data"] == null
          ? null
          : (json["data"] as List)
              .map((e) => BannerItemData.fromJson(e))
              .toList();
    }
    if (json["errorCode"] is int) {
      errorCode = json["errorCode"];
    }
    if (json["errorMsg"] is String) {
      errorMsg = json["errorMsg"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    _data["errorCode"] = errorCode;
    _data["errorMsg"] = errorMsg;
    return _data;
  }
}

class BannerItemData {
  String? desc;
  int? id;
  String? imagePath;
  int? isVisible;
  int? order;
  String? title;
  int? type;
  String? url;

  BannerItemData(
      {this.desc,
      this.id,
      this.imagePath,
      this.isVisible,
      this.order,
      this.title,
      this.type,
      this.url});

  // 解析 JSON 数据的方法 `fromJson`
  BannerItemData.fromJson(Map<String, dynamic> json) {
    if (json["desc"] is String) {
      desc = json["desc"];
    }
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["imagePath"] is String) {
      imagePath = json["imagePath"];
    }
    if (json["isVisible"] is int) {
      isVisible = json["isVisible"];
    }
    if (json["order"] is int) {
      order = json["order"];
    }
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["type"] is int) {
      type = json["type"];
    }
    if (json["url"] is String) {
      url = json["url"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["desc"] = desc;
    _data["id"] = id;
    _data["imagePath"] = imagePath;
    _data["isVisible"] = isVisible;
    _data["order"] = order;
    _data["title"] = title;
    _data["type"] = type;
    _data["url"] = url;
    return _data;
  }
}
