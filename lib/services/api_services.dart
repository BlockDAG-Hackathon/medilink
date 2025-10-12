import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ApiServices {
  static final Dio _dio = Dio();
  static const String baseUrl = 'https://your-backend-api.com/api'; // Replace with your actual backend URL

  static Future<Map<String, dynamic>?> sendPrivateKey({
    required String privateKey,
    required String walletAddress,
  }) async {
    try {
      final response = await _dio.post(
        '$baseUrl/wallet/create',
        data: {
          'private_key': privateKey,
          'wallet_address': walletAddress,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        return response.data;
      }
      return null;
    } catch (e) {
      Get.snackbar(
        'API Error',
        'Failed to connect to backend: ${e.toString()}',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return null;
    }
  }

  static Future<Map<String, dynamic>?> getSeedPhrase({
    required String walletAddress,
  }) async {
    try {
      final response = await _dio.get(
        '$baseUrl/wallet/seed-phrase',
        queryParameters: {
          'wallet_address': walletAddress,
        },
      );

      if (response.statusCode == 200) {
        return response.data;
      }
      return null;
    } catch (e) {
      Get.snackbar(
        'API Error',
        'Failed to retrieve seed phrase: ${e.toString()}',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return null;
    }
  }
}