import 'package:clean_arch_riverpod/domain/entity/comments.dart';

abstract interface class CommentsRepository {
  Future<List<Comments>> fetchComments({int limit = 20});
}
