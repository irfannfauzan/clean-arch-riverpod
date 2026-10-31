import 'package:clean_arch_riverpod/domain/entity/comments.dart';

class CommentsDTO {
  final int id;
  final int postId;
  final String name;
  final String email;
  final String body;

  const CommentsDTO({
    required this.id,
    required this.postId,
    required this.name,
    required this.email,
    required this.body,
  });

  factory CommentsDTO.fromJson(Map<String, dynamic> json) {
    return CommentsDTO(
      id: json['id'] as int,
      postId: json['postId'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      body: json['body'] as String,
    );
  }

  Comments toDomain() =>
      Comments(id: id, postId: postId, name: name, email: email, body: body);
}
