import 'package:dio/dio.dart';
import 'package:e_learning/courses/model/course_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../utilities/constants/constants.dart';

class CourseRepo {
  Future<List<Course>> getCourses() async {
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
      final response =
          await dio.get('course', queryParameters: {'page': 1, 'size': 100});
      if (response.statusCode == 200) {
        List<Course> courses = [];
        courses = response.data['data']['rows']
            .map<Course>((e) => Course.fromJson(e))
            .toList();

        print(
            "-------------------------------------------------------------------------------");
        print('data reponse: ${response.data['data']['rows'].length}');
        print(
            "-------------------------------------------------------------------------------");

        return courses;
        ;
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

  Future<List<Course>> filter(String text) async {
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
      final response = await dio
          .get('course', queryParameters: {'page': 1, 'size': 100, 'q': text});
      if (response.statusCode == 200) {
        List<Course> courses = [];
        courses = response.data['data']['rows']
            .map<Course>((e) => Course.fromJson(e))
            .toList();

        print(
            "-------------------------------------------------------------------------------");
        print('data reponse: ${response.data['data']['rows'].length}');
        print(
            "-------------------------------------------------------------------------------");

        return courses;
        ;
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
