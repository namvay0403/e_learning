import 'package:dio/dio.dart';
import 'package:e_learning/teachers/model/detail_teacher_model.dart';
import 'package:e_learning/teachers/model/teacher_model.dart';
import 'package:e_learning/utilities/constants/constants.dart';
import 'package:e_learning/utilities/constants/list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TeacherRepo {
  Future<List<Teacher>> getTeachers(String pageNumber) async {
    final storage = FlutterSecureStorage();
    String accessToken = await storage.read(key: 'accessToken') ?? "";
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        contentType: 'application/json',
        headers: {'Authorization': 'Bearer $accessToken'},
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
    try {
      final response = await dio.post('tutor/search', data: {
        "filters": {
          "specialties": [],
          "date": null,
          "nationality": {},
          "tutoringTimeAvailable": [null, null]
        },
        "page": pageNumber,
        "perPage": 10
      });
      if (response.statusCode == 200) {
        List<Teacher> teachersTemp = [];
        teachersTemp = response.data['rows']
            .map<Teacher>((e) => Teacher.fromJson(e))
            .toList();

        print(
            "-------------------------------------------------------------------------------");
        print('data reponse: ${response.data['rows'].length}');
        print(
            "-------------------------------------------------------------------------------");

        return teachersTemp;
      } else {
        throw response.data['message'];
      }
    } on DioException catch (e) {
      debugPrint(e.type.toString());
      if (e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.connectionTimeout) {
        throw 'Connection Timeout';
      }

      if (e.type == DioExceptionType.unknown ||
          e.type == DioExceptionType.connectionError) {
        throw 'Internet Error or Server Error';
      }
      debugPrint(e.type.toString());
      throw 'Server Error';
    }
  }

  Future<DetailTeacher> getTeacherById(String id) async {
    final storage = FlutterSecureStorage();
    String accessToken = await storage.read(key: 'accessToken') ?? "";
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        contentType: 'application/json',
        headers: {'Authorization': 'Bearer $accessToken'},
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
    try {
      final response = await dio.get(
        'tutor/$id',
      );
      if (response.statusCode == 200) {
        print(
            "-------------------------------------------------------------------------------");
        print('data reponse: ${response.data.toString()}');
        print(
            "-------------------------------------------------------------------------------");

        return DetailTeacher.fromJson(response.data);
      } else {
        throw response.data['message'];
      }
    } on DioException catch (e) {
      debugPrint(e.type.toString());
      if (e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.connectionTimeout) {
        throw 'Connection Timeout';
      }

      if (e.type == DioExceptionType.unknown ||
          e.type == DioExceptionType.connectionError) {
        throw 'Internet Error or Server Error';
      }
      debugPrint(e.type.toString());
      throw 'Server Error';
    }
  }

  Future<void> addTeacherFavourite(String id) async {
    final storage = FlutterSecureStorage();
    String accessToken = await storage.read(key: 'accessToken') ?? "";
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        contentType: 'application/json',
        headers: {'Authorization': 'Bearer $accessToken'},
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
    try {
      final response = await dio.post(
        'user/manageFavoriteTutor',
        data: {'tutorId': id},
      );
      if (response.statusCode == 200) {
        return;
      } else {
        throw response.data['message'];
      }
    } on DioException catch (e) {
      debugPrint(e.type.toString());
      if (e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.connectionTimeout) {
        throw 'Connection Timeout';
      }

      if (e.type == DioExceptionType.unknown ||
          e.type == DioExceptionType.connectionError) {
        throw 'Internet Error or Server Error';
      }
      debugPrint(e.type.toString());
      throw 'Server Error';
    }
  }
}
