class Review {
  Review({
    required this.id,
    required this.bookingId,
    required this.firstId,
    required this.secondId,
    required this.rating,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    required this.firstInfo,
  });
  late final dynamic id;
  late final dynamic bookingId;
  late final dynamic firstId;
  late final dynamic secondId;
  late final dynamic rating;
  late final dynamic content;
  late final String createdAt;
  late final String updatedAt;
  late final FirstInfo firstInfo;

  Review.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookingId = json['bookingId'];
    firstId = json['firstId'];
    secondId = json['secondId'];
    rating = json['rating'];
    content = json['content'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    firstInfo = FirstInfo.fromJson(json['firstInfo']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['bookingId'] = bookingId;
    _data['firstId'] = firstId;
    _data['secondId'] = secondId;
    _data['rating'] = rating;
    _data['content'] = content;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['firstInfo'] = firstInfo.toJson();
    return _data;
  }
}

class FirstInfo {
  FirstInfo({
    required this.name,
    required this.avatar,
  });
  late final dynamic name;
  late final dynamic avatar;

  FirstInfo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['avatar'] = avatar;
    return _data;
  }
}
