class Teacher {
  Teacher({
    required this.avatar,
    required this.country,
    required this.id,
    required this.name,
    required this.bio,
    this.isNative,
    required this.specialties,
    required this.rating,
    required this.userId,
    required this.schedulesTimes,
    required this.isFavoriteTutor,
    required this.price,
  });
  late final String avatar;
  late final String country;
  late final String id;
  late final String name;
  late final String bio;
  late final dynamic isNative;
  late final String specialties;
  late final dynamic rating;
  late final String userId;
  late final dynamic schedulesTimes;
  late final dynamic isFavoriteTutor;
  late final int price;

  Teacher.fromJson(Map<String, dynamic> json) {
    avatar = json['avatar'];
    country = json['country'];
    id = json['id'];
    name = json['name'];
    bio = json['bio'];
    isNative = json['isNative'];
    specialties = json['specialties'];
    rating = json['rating'];
    userId = json['userId'];
    schedulesTimes = json['schedulesTimes'];
    isFavoriteTutor = json['isFavoriteTutor'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['avatar'] = avatar;
    _data['country'] = country;
    _data['id'] = id;
    _data['name'] = name;
    _data['bio'] = bio;
    _data['isNative'] = isNative;
    _data['specialties'] = specialties;
    _data['rating'] = rating;
    _data['userId'] = userId;
    _data['schedulesTimes'] = schedulesTimes;
    _data['isFavoriteTutor'] = isFavoriteTutor;
    _data['price'] = price;
    return _data;
  }
}
