import 'package:dio/dio.dart';
import 'package:e_learning/detail_teacher/model/review_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../utilities/constants/constants.dart';

class ReviewRepo {
  Future<List<Review>> getReviews(String tutorId) async {
    final storage = FlutterSecureStorage();
    String accessToken = await storage.read(key: 'accessToken') ?? "";
    print('tutor id : ${tutorId}');
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
      final response = await dio.get('feedback/v2/$tutorId',
          queryParameters: {'page': 1, 'perPage': 10});
      if (response.statusCode == 200) {
        List<Review> reviews = [];
        reviews = response.data['data']['rows']
            .map<Review>((e) => Review.fromJson(e))
            .toList();

        print(
            "-------------------------------------------------------------------------------");
        print('data reponse: ${response.data['data']['rows'].length}');
        print(
            "-------------------------------------------------------------------------------");

        return reviews;
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
