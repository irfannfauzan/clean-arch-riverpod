import 'package:clean_arch_riverpod/domain/entity/comments.dart';
import 'package:clean_arch_riverpod/domain/repositories/comments_repository.dart';

class GetCommentsUseCase {
  final CommentsRepository repository;

  GetCommentsUseCase(this.repository);

  Future<List<Comments>> execute({int limit = 20}) =>
      repository.fetchComments(limit: limit);
}
