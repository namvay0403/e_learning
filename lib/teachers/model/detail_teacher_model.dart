class DetailTeacher {
  DetailTeacher({
    this.video,
    this.bio,
    this.education,
    this.experience,
    this.profession,
    this.accent,
    this.targetStudent,
    this.interests,
    this.languages,
    this.specialties,
    this.rating,
    this.isNative,
    this.youtubeVideoId,
    this.detail,
    this.isFavorite,
    this.avgRating,
    this.totalFeedback,
  });
  late final dynamic video;
  late final dynamic bio;
  late final dynamic education;
  late final dynamic experience;
  late final dynamic profession;
  late final dynamic accent;
  late final dynamic targetStudent;
  late final dynamic interests;
  late final dynamic languages;
  late final dynamic specialties;
  late final dynamic rating;
  late final dynamic isNative;
  late final dynamic youtubeVideoId;
  late final Detail? detail;
  late final dynamic isFavorite;
  late final dynamic avgRating;
  late final dynamic totalFeedback;

  DetailTeacher.fromJson(Map<String, dynamic> json) {
    video = json['video'];
    bio = json['bio'];
    education = json['education'];
    experience = json['experience'];
    profession = json['profession'];
    accent = json['accent'];
    targetStudent = json['targetStudent'];
    interests = json['interests'];
    languages = json['languages'];
    specialties = json['specialties'];
    rating = json['rating'];
    isNative = json['isNative'];
    youtubeVideoId = json['youtubeVideoId'];
    detail = Detail.fromJson(json['User']);
    isFavorite = json['isFavorite'];
    avgRating = json['avgRating'];
    totalFeedback = json['totalFeedback'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['video'] = video;
    _data['bio'] = bio;
    _data['education'] = education;
    _data['experience'] = experience;
    _data['profession'] = profession;
    _data['accent'] = accent;
    _data['targetStudent'] = targetStudent;
    _data['interests'] = interests;
    _data['languages'] = languages;
    _data['specialties'] = specialties;
    _data['rating'] = rating;
    _data['isNative'] = isNative;
    _data['youtubeVideoId'] = youtubeVideoId;
    _data['User'] = detail!.toJson();
    _data['isFavorite'] = isFavorite;
    _data['avgRating'] = avgRating;
    _data['totalFeedback'] = totalFeedback;
    return _data;
  }
}

class Detail {
  Detail({
    this.id,
    this.level,
    this.avatar,
    this.name,
    this.country,
    this.language,
    this.isPublicRecord,
    this.caredByStaffId,
    this.zaloUserId,
    this.studentGroupId,
    this.courses,
  });
  late final dynamic id;
  late final dynamic level;
  late final dynamic avatar;
  late final dynamic name;
  late final dynamic country;
  late final dynamic language;
  late final dynamic isPublicRecord;
  late final dynamic caredByStaffId;
  late final dynamic zaloUserId;
  late final dynamic studentGroupId;
  late final List<Courses>? courses;

  Detail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    level = json['level'];
    avatar = json['avatar'];
    name = json['name'];
    country = json['country'];
    language = json['language'];
    isPublicRecord = json['isPublicRecord'];
    caredByStaffId = json['caredByStaffId'];
    zaloUserId = json['zaloUserId'];
    studentGroupId = json['studentGroupId'];
    courses =
        List.from(json['courses']).map((e) => Courses.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['level'] = level;
    _data['avatar'] = avatar;
    _data['name'] = name;
    _data['country'] = country;
    _data['language'] = language;
    _data['isPublicRecord'] = isPublicRecord;
    _data['caredByStaffId'] = caredByStaffId;
    _data['zaloUserId'] = zaloUserId;
    _data['studentGroupId'] = studentGroupId;
    _data['courses'] = courses!.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Courses {
  Courses({
    required this.id,
    required this.name,
    required this.tutorCourse,
  });
  late final dynamic id;
  late final dynamic name;
  late final TutorCourse tutorCourse;

  Courses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    tutorCourse = TutorCourse.fromJson(json['TutorCourse']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['TutorCourse'] = tutorCourse.toJson();
    return _data;
  }
}

class TutorCourse {
  TutorCourse({
    required this.UserId,
    required this.CourseId,
    required this.createdAt,
    required this.updatedAt,
  });
  late final dynamic UserId;
  late final dynamic CourseId;
  late final dynamic createdAt;
  late final dynamic updatedAt;

  TutorCourse.fromJson(Map<String, dynamic> json) {
    UserId = json['UserId'];
    CourseId = json['CourseId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['UserId'] = UserId;
    _data['CourseId'] = CourseId;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    return _data;
  }
}
