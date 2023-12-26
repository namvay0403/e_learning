import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../utilities/constants/constants.dart';
import '../model/schedule_model.dart';

class ScheduleRepo {
  Future<List<dynamic>> getSchedules() async {
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
      final response = await dio.get('booking/list/student', queryParameters: {
        'page': 1,
        'perPage': 10,
        'inFuture': 0,
        'orderBy': 'meeting',
        'sortBy': 'asc'
      });
      if (response.statusCode == 200) {
        List<ScheduleModel> schedules = [];
        schedules = response.data['data']['rows']
            .map<ScheduleModel>((e) => ScheduleModel.fromJson(e))
            .toList();

        print(
            "-------------------------------------------------------------------------------");
        print('data reponse: ${response.data['data']['rows'].length}');
        print(
            "-------------------------------------------------------------------------------");

        return schedules;
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
