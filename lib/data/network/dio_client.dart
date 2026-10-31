import 'package:dio/dio.dart';

Dio createDio() {
  return Dio(
    BaseOptions(
      baseUrl: "https://jsonplaceholder.typicode.com",
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 60),
      headers: {"Accept": "application/json"},
    ),
  );
}
