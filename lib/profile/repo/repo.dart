import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:e_learning/authenticate/model/user_model.dart';
import 'package:e_learning/utilities/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';

class ProfileRepo {
  Future<User> updateProfile(String fullName, String country) async {
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
      final response = await dio.put(
        'user/info',
        data: {
          "name": fullName,
          "country": country,
        },
      );
      if (response.statusCode == 200) {
        print('test repo update: ${response.data['user']}');
        return User.fromJson(response.data['user']);
      } else {
        String message = jsonEncode(response.data['message']);
        throw message;
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

  Future<User> getUserInfo() async {
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
      final response = await dio.get('user/info');
      if (response.statusCode == 200) {
        print('test repo: ${response.data['user']}');
        return User.fromJson(response.data['user']);
      } else {
        String message = jsonEncode(response.data['message']);
        throw message;
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

  Future<String> updateAvatar() async {
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

    ImagePicker picker = ImagePicker();
    File? image;

    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      image = File(pickedFile.path);
      String fileName = image.path.split('/').last;
      FormData formData = FormData.fromMap({
        'avatar': await MultipartFile.fromFile(image.path, filename: fileName),
      });

      try {
        final response = await dio.post(
          'user/uploadAvatar',
          data: formData,
        );
        print(image.absolute.path);
        if (response.statusCode == 200) {
          print('test repo update: ${response.data}');
          print('data type : ${response.data['avatar'].runtimeType}');
          return response.data['avatar'];
        } else {
          String message = jsonEncode(response.data['message']);
          throw message;
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
    } else {
      throw 'No Image';
    }
  }
}
