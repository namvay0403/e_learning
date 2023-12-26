class ScheduleModel {
  ScheduleModel({
    this.createdAtTimeStamp,
    this.updatedAtTimeStamp,
    this.id,
    this.userId,
    this.scheduleDetailId,
    this.tutorMeetingLink,
    this.googleMeetLink,
    this.studentRequest,
    this.scoreByTutor,
    this.recordUrl,
    this.cancelReasonId,
    this.lessonPlanId,
    this.cancelNote,
    this.calendarId,
    this.isDeleted,
    this.isTrial,
    this.convertedLesson,
    this.scheduleDetailInfo,
    this.classReview,
  });
  late dynamic createdAtTimeStamp;
  late dynamic updatedAtTimeStamp;
  late dynamic id;
  late dynamic userId;
  late dynamic scheduleDetailId;
  late dynamic tutorMeetingLink;
  late dynamic googleMeetLink;
  late dynamic studentRequest;
  late dynamic scoreByTutor;
  late dynamic recordUrl;
  late dynamic cancelReasonId;
  late dynamic lessonPlanId;
  late dynamic cancelNote;
  late dynamic calendarId;
  late dynamic isDeleted;
  late dynamic isTrial;
  late dynamic convertedLesson;
  late dynamic scheduleDetailInfo;
  late dynamic classReview;

  ScheduleModel.fromJson(Map<dynamic, dynamic> json) {
    createdAtTimeStamp = json['createdAtTimeStamp'];
    updatedAtTimeStamp = json['updatedAtTimeStamp'];
    id = json['id'];
    userId = json['userId'];
    scheduleDetailId = json['scheduleDetailId'];
    tutorMeetingLink = json['tutorMeetingLink'];
    googleMeetLink = json['googleMeetLink'];
    studentRequest = json['studentRequest'];
    scoreByTutor = json['scoreByTutor'];
    recordUrl = json['recordUrl'];
    cancelReasonId = json['cancelReasonId'];
    lessonPlanId = json['lessonPlanId'];
    cancelNote = json['cancelNote'];
    calendarId = json['calendarId'];
    isDeleted = json['isDeleted'];
    isTrial = json['isTrial'];
    convertedLesson = json['convertedLesson'];
    scheduleDetailInfo =
        ScheduleDetailInfo.fromJson(json['scheduleDetailInfo']);
    // classReview = ClassReview.fromJson(json['classReview']);
    classReview = null;
  }

  Map<dynamic, dynamic> toJson() {
    final _data = <dynamic, dynamic>{};
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
  late dynamic startPeriodTimestamp;
  late dynamic endPeriodTimestamp;
  late dynamic id;
  late dynamic scheduleId;
  late dynamic startPeriod;
  late dynamic endPeriod;
  late dynamic createdAt;
  late dynamic updatedAt;
  late dynamic scheduleInfo;

  ScheduleDetailInfo.fromJson(Map<dynamic, dynamic> json) {
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

  Map<dynamic, dynamic> toJson() {
    final _data = <dynamic, dynamic>{};
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
  late dynamic date;
  late dynamic startTimestamp;
  late dynamic endTimestamp;
  late dynamic id;
  late dynamic tutorId;
  late dynamic startTime;
  late dynamic endTime;
  late dynamic isDeleted;
  late dynamic createdAt;
  late dynamic updatedAt;
  late dynamic tutorInfo;

  ScheduleInfo.fromJson(Map<dynamic, dynamic> json) {
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

  Map<dynamic, dynamic> toJson() {
    final _data = <dynamic, dynamic>{};
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
  late dynamic id;
  late dynamic name;
  late dynamic email;
  late dynamic country;
  late dynamic avatar;
  late dynamic birthday;
  late dynamic timezone;

  TutorInfo.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    country = json['country'];
    avatar = json['avatar'];
    birthday = json['birthday'];
    timezone = json['timezone'];
  }

  Map<dynamic, dynamic> toJson() {
    final _data = <dynamic, dynamic>{};
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
  late dynamic id;
  late dynamic bookingId;
  late dynamic lessonStatusId;
  late dynamic book;
  late dynamic unit;
  late dynamic lesson;
  late dynamic page;
  late dynamic lessonProgress;
  late dynamic behaviorRating;
  late dynamic behaviorComment;
  late dynamic listeningRating;
  late dynamic listeningComment;
  late dynamic speakingRating;
  late dynamic speakingComment;
  late dynamic vocabularyRating;
  late dynamic vocabularyComment;
  late dynamic homeworkComment;
  late dynamic overallComment;
  late dynamic lessonStatus;

  ClassReview.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    bookingId = json['bookingId'];
    lessonStatusId = json['lessonStatusId'];
    book = json['book'];
    unit = json['unit'];
    lesson = json['lesson'];
    page = json['page'];
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

  Map<dynamic, dynamic> toJson() {
    final _data = <dynamic, dynamic>{};
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
  late dynamic id;
  late dynamic status;
  late dynamic createdAt;
  late dynamic updatedAt;

  LessonStatus.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<dynamic, dynamic> toJson() {
    final _data = <dynamic, dynamic>{};
    _data['id'] = id;
    _data['status'] = status;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    return _data;
  }
}
