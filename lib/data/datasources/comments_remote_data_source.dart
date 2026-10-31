import 'package:clean_arch_riverpod/data/dto/comments_dto.dart';
import 'package:dio/dio.dart';

abstract interface class CommentsRemoteDataSource {
  Future<List<CommentsDTO>> fetchComments({int limit = 20});
}

class CommentsRemoteDataSourceImpl implements CommentsRemoteDataSource {
  CommentsRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<List<CommentsDTO>> fetchComments({int limit = 20}) async {
    final response = await _dio.get<List<dynamic>>(
      '/comments',
      queryParameters: {'_limit': limit},
    );
    final data = response.data;

    if (data == null) throw const FormatException('Data kosong!');

    return data
        .map((e) => CommentsDTO.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
