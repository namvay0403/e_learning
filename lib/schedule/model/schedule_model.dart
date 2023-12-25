class ScheduleModel {
  ScheduleModel({
    required this.createdAtTimeStamp,
    required this.updatedAtTimeStamp,
    required this.id,
    required this.userId,
    required this.scheduleDetailId,
    this.googleMeetLink,
    this.studentRequest,
    this.scoreByTutor,
    this.recordUrl,
    this.cancelReasonId,
    required this.lessonPlanId,
    this.cancelNote,
    this.calendarId,
    required this.isDeleted,
    required this.isTrial,
    required this.convertedLesson,
    required this.scheduleDetailInfo,
    required this.classReview,
  });
  late final dynamic createdAtTimeStamp;
  late final dynamic updatedAtTimeStamp;
  late final dynamic id;
  late final dynamic userId;
  late final dynamic scheduleDetailId;
  late final dynamic googleMeetLink;
  late final dynamic studentRequest;
  late final dynamic scoreByTutor;
  late final dynamic recordUrl;
  late final dynamic cancelReasonId;
  late final dynamic lessonPlanId;
  late final dynamic cancelNote;
  late final dynamic calendarId;
  late final dynamic isDeleted;
  late final dynamic isTrial;
  late final dynamic convertedLesson;
  late final ScheduleDetailInfo? scheduleDetailInfo;
  late final ClassReview? classReview;

  ScheduleModel.fromJson(Map<String, dynamic> json) {
    createdAtTimeStamp = json['createdAtTimeStamp'];
    updatedAtTimeStamp = json['updatedAtTimeStamp'];
    id = json['id'];
    userId = json['userId'];
    scheduleDetailId = json['scheduleDetailId'];
    googleMeetLink = null;
    studentRequest = null;
    scoreByTutor = null;
    recordUrl = null;
    cancelReasonId = null;
    lessonPlanId = json['lessonPlanId'];
    cancelNote = null;
    calendarId = null;
    isDeleted = json['isDeleted'];
    isTrial = json['isTrial'];
    convertedLesson = json['convertedLesson'];
    scheduleDetailInfo =
        ScheduleDetailInfo.fromJson(json['scheduleDetailInfo']);
    classReview = ClassReview.fromJson(json['classReview']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['createdAtTimeStamp'] = createdAtTimeStamp;
    _data['updatedAtTimeStamp'] = updatedAtTimeStamp;
    _data['id'] = id;
    _data['userId'] = userId;
    _data['scheduleDetailId'] = scheduleDetailId;
    _data['googleMeetLink'] = googleMeetLink;
    _data['studentRequest'] = studentRequest;
    _data['scoreByTutor'] = scoreByTutor;
    _data['recordUrl'] = recordUrl;
    _data['cancelReasonId'] = cancelReasonId;
    _data['lessonPlanId'] = lessonPlanId;
    _data['cancelNote'] = cancelNote;
    _data['calendarId'] = calendarId;
    _data['isDeleted'] = isDeleted;
    _data['isTrial'] = isTrial;
    _data['convertedLesson'] = convertedLesson;
    _data['scheduleDetailInfo'] = scheduleDetailInfo!.toJson();
    _data['classReview'] = classReview!.toJson();
    return _data;
  }
}

class ScheduleDetailInfo {
  ScheduleDetailInfo({
    required this.startPeriodTimestamp,
    required this.endPeriodTimestamp,
    required this.id,
    required this.scheduleId,
    required this.startPeriod,
    required this.endPeriod,
    required this.createdAt,
    required this.updatedAt,
    required this.scheduleInfo,
  });
  late final dynamic startPeriodTimestamp;
  late final dynamic endPeriodTimestamp;
  late final dynamic id;
  late final dynamic scheduleId;
  late final dynamic startPeriod;
  late final dynamic endPeriod;
  late final dynamic createdAt;
  late final dynamic updatedAt;
  late final ScheduleInfo? scheduleInfo;

  ScheduleDetailInfo.fromJson(Map<String, dynamic> json) {
    startPeriodTimestamp = json['startPeriodTimestamp'];
    endPeriodTimestamp = json['endPeriodTimestamp'];
    id = json['id'];
    scheduleId = json['scheduleId'];
    startPeriod = json['startPeriod'];
    endPeriod = json['endPeriod'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    scheduleInfo = ScheduleInfo.fromJson(json['scheduleInfo']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['startPeriodTimestamp'] = startPeriodTimestamp;
    _data['endPeriodTimestamp'] = endPeriodTimestamp;
    _data['id'] = id;
    _data['scheduleId'] = scheduleId;
    _data['startPeriod'] = startPeriod;
    _data['endPeriod'] = endPeriod;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['scheduleInfo'] = scheduleInfo!.toJson();
    return _data;
  }
}

class ScheduleInfo {
  ScheduleInfo({
    required this.date,
    required this.startTimestamp,
    required this.endTimestamp,
    required this.id,
    required this.tutorId,
    required this.startTime,
    required this.endTime,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.tutorInfo,
  });
  late final dynamic date;
  late final dynamic startTimestamp;
  late final dynamic endTimestamp;
  late final dynamic id;
  late final dynamic tutorId;
  late final dynamic startTime;
  late final dynamic endTime;
  late final dynamic isDeleted;
  late final dynamic createdAt;
  late final dynamic updatedAt;
  late final TutorInfo? tutorInfo;

  ScheduleInfo.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    startTimestamp = json['startTimestamp'];
    endTimestamp = json['endTimestamp'];
    id = json['id'];
    tutorId = json['tutorId'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    tutorInfo = TutorInfo.fromJson(json['tutorInfo']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['date'] = date;
    _data['startTimestamp'] = startTimestamp;
    _data['endTimestamp'] = endTimestamp;
    _data['id'] = id;
    _data['tutorId'] = tutorId;
    _data['startTime'] = startTime;
    _data['endTime'] = endTime;
    _data['isDeleted'] = isDeleted;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['tutorInfo'] = tutorInfo!.toJson();
    return _data;
  }
}

class TutorInfo {
  TutorInfo({
    required this.id,
    required this.name,
    required this.email,
    required this.country,
    required this.avatar,
    required this.birthday,
    required this.timezone,
  });
  late final dynamic id;
  late final dynamic name;
  late final dynamic email;
  late final dynamic country;
  late final dynamic avatar;
  late final dynamic birthday;
  late final dynamic timezone;

  TutorInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    country = json['country'];
    avatar = json['avatar'];
    birthday = json['birthday'];
    timezone = json['timezone'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['email'] = email;
    _data['country'] = country;
    _data['avatar'] = avatar;
    _data['birthday'] = birthday;
    _data['timezone'] = timezone;
    return _data;
  }
}

class ClassReview {
  ClassReview({
    required this.id,
    required this.bookingId,
    required this.lessonStatusId,
    this.book,
    this.unit,
    this.lesson,
    this.page,
    required this.lessonProgress,
    required this.behaviorRating,
    required this.behaviorComment,
    required this.listeningRating,
    required this.listeningComment,
    required this.speakingRating,
    required this.speakingComment,
    required this.vocabularyRating,
    required this.vocabularyComment,
    required this.homeworkComment,
    required this.overallComment,
    required this.lessonStatus,
  });
  late final dynamic id;
  late final dynamic bookingId;
  late final dynamic lessonStatusId;
  late final dynamic book;
  late final dynamic unit;
  late final dynamic lesson;
  late final dynamic page;
  late final dynamic lessonProgress;
  late final dynamic behaviorRating;
  late final dynamic behaviorComment;
  late final dynamic listeningRating;
  late final dynamic listeningComment;
  late final dynamic speakingRating;
  late final dynamic speakingComment;
  late final dynamic vocabularyRating;
  late final dynamic vocabularyComment;
  late final dynamic homeworkComment;
  late final dynamic overallComment;
  late final LessonStatus? lessonStatus;

  ClassReview.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookingId = json['bookingId'];
    lessonStatusId = json['lessonStatusId'];
    book = null;
    unit = null;
    lesson = null;
    page = null;
    lessonProgress = json['lessonProgress'];
    behaviorRating = json['behaviorRating'];
    behaviorComment = json['behaviorComment'];
    listeningRating = json['listeningRating'];
    listeningComment = json['listeningComment'];
    speakingRating = json['speakingRating'];
    speakingComment = json['speakingComment'];
    vocabularyRating = json['vocabularyRating'];
    vocabularyComment = json['vocabularyComment'];
    homeworkComment = json['homeworkComment'];
    overallComment = json['overallComment'];
    lessonStatus = LessonStatus.fromJson(json['lessonStatus']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['bookingId'] = bookingId;
    _data['lessonStatusId'] = lessonStatusId;
    _data['book'] = book;
    _data['unit'] = unit;
    _data['lesson'] = lesson;
    _data['page'] = page;
    _data['lessonProgress'] = lessonProgress;
    _data['behaviorRating'] = behaviorRating;
    _data['behaviorComment'] = behaviorComment;
    _data['listeningRating'] = listeningRating;
    _data['listeningComment'] = listeningComment;
    _data['speakingRating'] = speakingRating;
    _data['speakingComment'] = speakingComment;
    _data['vocabularyRating'] = vocabularyRating;
    _data['vocabularyComment'] = vocabularyComment;
    _data['homeworkComment'] = homeworkComment;
    _data['overallComment'] = overallComment;
    _data['lessonStatus'] = lessonStatus!.toJson();
    return _data;
  }
}

class LessonStatus {
  LessonStatus({
    required this.id,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });
  late final dynamic id;
  late final dynamic status;
  late final dynamic createdAt;
  late final dynamic updatedAt;

  LessonStatus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['status'] = status;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    return _data;
  }
}
