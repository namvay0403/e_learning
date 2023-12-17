import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:e_learning/authenticate/model/user_model.dart';
import 'package:e_learning/utilities/constants/constants.dart';
import 'package:flutter/material.dart';

import '../utilities/constants/list_provider.dart';
import '../login/model/login_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum AuthenticationStatus {
  unknown,
  authenticated,
  unauthenticated,
  inactive,
  error
}

class AuthenticationRepo {
  Future<LoginModel> logIn({
    required String username,
    required String password,
  }) async {
    final body = {
      "email": username,
      "password": password,
    };
    var options = BaseOptions(
      contentType: 'application/json',
      method: 'POST',
      baseUrl: baseUrl,
      validateStatus: (status) {
        return status! < 500;
      },
    );
    final dio = Dio(options);
    try {
      final response = await dio.request("auth/login", data: body);
      print(jsonEncode(response.data));
      if (response.statusCode == 200) {
        const storage = FlutterSecureStorage();
        await storage.write(
            key: 'accessToken',
            value: response.data['tokens']['access']['token']);
        String accessToken = await storage.read(key: 'accessToken') ?? "";
        print('token got: $accessToken');
        var loginModel = LoginModel(
          status: AuthenticationStatus.authenticated,
          user: User.fromJson(response.data['user']),
        );
        return loginModel;
      }
    } catch (error) {
      print('test: ${error.toString()}');
      if (error is DioError &&
          error.response?.statusCode == HttpStatus.unauthorized) {
        LoginModel loginModel = LoginModel(
          status: AuthenticationStatus.unauthenticated,
        );
        return loginModel;
      } else {
        LoginModel loginModel = LoginModel(
          status: AuthenticationStatus.error,
        );
        return loginModel;
      }
    }
    return LoginModel(
      status: AuthenticationStatus.error,
    );
  }

  Future<String> signUp(
      {required String email, required String password}) async {
    var options = BaseOptions(
      contentType: 'application/json',
      method: 'POST',
      baseUrl: baseUrl,
      validateStatus: (status) {
        return status! < 500;
      },
    );
    final dio = Dio(options);
    try {
      final response = await dio.request("auth/register",
          data: {"email": email, "password": password});
      print(response.data.toString());
      if (response.statusCode == 200) {
        return response.data['message'];
      } else {
        return response.data['message'];
      }
    } catch (error) {
      print('test: ${error.toString()}');
      if (error is DioError &&
          error.response?.statusCode == HttpStatus.unauthorized) {
        return error.message.toString();
      } else {
        print('error');
      }
    }
    return "";
  }

  Future<String> forgotPassword({required String email}) async {
    var options = BaseOptions(
      contentType: 'application/json',
      method: 'POST',
      baseUrl: baseUrl,
      validateStatus: (status) {
        return status! < 500;
      },
    );
    final dio = Dio(options);
    try {
      final response =
          await dio.request("user/forgotPassword", data: {"email": email});
      if (response.statusCode == 200) {
        return response.data['message'];
      } else {
        return response.data['message'];
      }
    } catch (error) {
      print('test: ${error.toString()}');
      if (error is DioError &&
          error.response?.statusCode == HttpStatus.unauthorized) {
        throw error.message.toString();
      } else {
        print('error');
      }
    }
    return "";
  }
}
