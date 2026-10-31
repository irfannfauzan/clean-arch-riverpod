import 'package:clean_arch_riverpod/core/di/providers.dart';
import 'package:clean_arch_riverpod/domain/entity/comments.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final commentsProvider = FutureProvider.autoDispose<List<Comments>>((ref) {
  final getComments = ref.watch(getCommentsUseCaseProvider);
  return getComments.execute(limit: 10);
});
