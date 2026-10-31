import 'package:clean_arch_riverpod/data/datasources/comments_remote_data_source.dart';
import 'package:clean_arch_riverpod/data/network/dio_client.dart';
import 'package:clean_arch_riverpod/data/repositories/comments_repository_impl.dart';
import 'package:clean_arch_riverpod/domain/repositories/comments_repository.dart';
import 'package:clean_arch_riverpod/domain/usecases/get_comments_use_case.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>((ref) => createDio());

final commentsRemoteDataSourceProvider = Provider<CommentsRemoteDataSource>(
  (ref) => CommentsRemoteDataSourceImpl(ref.watch(dioProvider)),
);

final commentsRepositoryProvider = Provider<CommentsRepository>(
  (ref) => CommentsRepositoryImpl(ref.watch(commentsRemoteDataSourceProvider)),
);

final getCommentsUseCaseProvider = Provider<GetCommentsUseCase>(
  (ref) => GetCommentsUseCase(ref.watch(commentsRepositoryProvider)),
);
