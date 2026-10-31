import 'package:clean_arch_riverpod/domain/failure/failure.dart';
import 'package:clean_arch_riverpod/presentation/features/home/providers/home_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final commentsAsync = ref.watch(commentsProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Comments'),
      ),
      body: commentsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                commentsAsync.isLoading
                    ? 'Retrying...'
                    : error is Failure
                    ? error.message
                    : 'Terjadi kesalahan.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              if (commentsAsync.isLoading)
                const CircularProgressIndicator()
              else
                ElevatedButton(
                  onPressed: () => ref.invalidate(commentsProvider),
                  child: const Text('Coba lagi'),
                ),
            ],
          ),
        ),
        data: (comments) => RefreshIndicator(
          onRefresh: () => ref.refresh(commentsProvider.future),
          child: ListView.builder(
            itemCount: comments.length,
            itemBuilder: (context, index) {
              final comment = comments[index];
              return ListTile(
                leading: Text("${comment.id}"),
                title: Text(comment.name),
                subtitle: Text(
                  comment.body,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
