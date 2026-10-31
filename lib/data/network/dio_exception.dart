import 'package:clean_arch_riverpod/domain/failure/failure.dart';
import 'package:dio/dio.dart';

extension DioExceptionMapper on DioException {
  Failure toFailure() => switch (type) {
    DioExceptionType.connectionTimeout ||
    DioExceptionType.sendTimeout ||
    DioExceptionType.receiveTimeout => const NetworkFailure(
      'Koneksi timeout, coba lagi.',
    ),
    DioExceptionType.connectionError => const NetworkFailure(
      'Tidak ada koneksi internet!',
    ),
    DioExceptionType.badCertificate => const NetworkFailure(
      'Koneksi tidak aman!',
    ),
    DioExceptionType.badResponse => ServerFailure(
      'Server error!: ${response?.statusCode}',
    ),
    DioExceptionType.cancel => const UnexpectedFailure('Request dibatalkan.'),
    DioExceptionType.unknown || DioExceptionType.transformTimeout =>
      UnexpectedFailure('Terjadi kesalahan: ${message ?? error}'),
  };
}
