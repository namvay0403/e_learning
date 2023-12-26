class User {
  User({
    this.id = '1',
    this.email,
    this.name,
    this.avatar,
    this.country,
    this.phone,
    this.roles,
    this.language,
    this.birthday,
    this.isActivated,
    this.walletInfo,
    this.courses,
    this.requireNote,
    this.level,
    this.learnTopics,
    this.testPreparations,
    this.isPhoneActivated,
    this.timezone,
    this.studySchedule,
    this.canSendMessage,
  });
  late final String id;
  late final String? email;
  late final String? name;
  late final dynamic avatar;
  late final String? country;
  late final String? phone;
  late final List<String>? roles;
  late final dynamic language;
  late final String? birthday;
  late final bool? isActivated;
  late final WalletInfo? walletInfo;
  late final List<dynamic>? courses;
  late final String? requireNote;
  late final String? level;
  late final List<LearnTopics>? learnTopics;
  late final List<dynamic>? testPreparations;
  late final bool? isPhoneActivated;
  late final int? timezone;
  late final String? studySchedule;
  late final bool? canSendMessage;

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
    avatar = json['avatar'];
    country = json['country'];
    phone = json['phone'];
    roles = List.castFrom<dynamic, String>(json['roles']);
    language = null;
    birthday = json['birthday'];
    isActivated = json['isActivated'];
    walletInfo = WalletInfo.fromJson(json['walletInfo']);
    courses = List.castFrom<dynamic, dynamic>(json['courses']);
    requireNote = json['requireNote'];
    level = json['level'];
    learnTopics = List.from(json['learnTopics'])
        .map((e) => LearnTopics.fromJson(e))
        .toList();
    testPreparations =
        List.castFrom<dynamic, dynamic>(json['testPreparations']);
    isPhoneActivated = json['isPhoneActivated'];
    timezone = json['timezone'];
    studySchedule = json['studySchedule'];
    canSendMessage = json['canSendMessage'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['email'] = email;
    _data['name'] = name;
    _data['avatar'] = avatar;
    _data['country'] = country;
    _data['phone'] = phone;
    _data['roles'] = roles;
    _data['language'] = language;
    _data['birthday'] = birthday;
    _data['isActivated'] = isActivated;
    _data['walletInfo'] = walletInfo?.toJson();
    _data['courses'] = courses;
    _data['requireNote'] = requireNote;
    _data['level'] = level;
    _data['learnTopics'] = learnTopics?.map((e) => e.toJson()).toList();
    _data['testPreparations'] = testPreparations;
    _data['isPhoneActivated'] = isPhoneActivated;
    _data['timezone'] = timezone;
    _data['studySchedule'] = studySchedule;
    _data['canSendMessage'] = canSendMessage;
    return _data;
  }
}

class WalletInfo {
  WalletInfo({
    required this.id,
    required this.userId,
    required this.amount,
    required this.isBlocked,
    required this.createdAt,
    required this.updatedAt,
    required this.bonus,
  });
  late final String id;
  late final String userId;
  late final String amount;
  late final bool isBlocked;
  late final String createdAt;
  late final String updatedAt;
  late final int bonus;

  WalletInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    amount = json['amount'];
    isBlocked = json['isBlocked'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    bonus = json['bonus'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['userId'] = userId;
    _data['amount'] = amount;
    _data['isBlocked'] = isBlocked;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['bonus'] = bonus;
    return _data;
  }
}

class LearnTopics {
  LearnTopics({
    required this.id,
    required this.key,
    required this.name,
  });
  late final int id;
  late final String key;
  late final String name;

  LearnTopics.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['key'] = key;
    _data['name'] = name;
    return _data;
  }
}
