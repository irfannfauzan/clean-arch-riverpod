import 'package:clean_arch_riverpod/data/datasources/comments_remote_data_source.dart';
import 'package:clean_arch_riverpod/data/network/dio_exception.dart';
import 'package:clean_arch_riverpod/domain/entity/comments.dart';
import 'package:clean_arch_riverpod/domain/failure/failure.dart';
import 'package:clean_arch_riverpod/domain/repositories/comments_repository.dart';
import 'package:dio/dio.dart';

class CommentsRepositoryImpl implements CommentsRepository {
  CommentsRepositoryImpl(this._remote);

  final CommentsRemoteDataSource _remote;

  @override
  Future<List<Comments>> fetchComments({int limit = 20}) async {
    try {
      final dtos = await _remote.fetchComments(limit: limit);
      return dtos.map((e) => e.toDomain()).toList();
    } on DioException catch (e) {
      throw e.toFailure();
    } on FormatException catch (e) {
      throw UnexpectedFailure(e.message);
    } on TypeError {
      throw const UnexpectedFailure('Format data tidak sesuai!');
    }
  }
}
