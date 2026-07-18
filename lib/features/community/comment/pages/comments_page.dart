import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../publication/models/publication.dart';

import '../providers/comment_notifier.dart';
import '../requests/create_comment_request.dart';
import '../widgets/comment_card.dart';

class CommentsPage extends ConsumerStatefulWidget {
  final Publication publication;

  const CommentsPage({
    super.key,
    required this.publication,
  });

  @override
  ConsumerState<CommentsPage> createState() =>
      _CommentsPageState();
}

class _CommentsPageState
    extends ConsumerState<CommentsPage> {

  final TextEditingController _controller =
      TextEditingController();

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref
          .read(commentProvider.notifier)
          .loadComments(
            widget.publication.id,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(commentProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Commentaires",
        ),
      ),

      body: Column(
        children: [
          Expanded(
            child: state.isLoading
                ? const Center(
                    child:
                        CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount:
                        state.comments.length,
                    itemBuilder:
                        (_, index) {

                      final comment =
                          state.comments[index];

                      return CommentCard(
                        publicationId:
                            widget.publication.id,
                        comment: comment,
                      );
                    },
                  ),
          ),

          SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller:
                          _controller,
                      decoration:
                          const InputDecoration(
                        hintText:
                            "Ajouter un commentaire...",
                      ),
                    ),
                  ),

                  IconButton(
                    icon: const Icon(
                      Icons.send,
                    ),
                    onPressed: () async {

                      if (_controller.text
                          .trim()
                          .isEmpty) {
                        return;
                      }

                      await ref
                          .read(
                            commentProvider
                                .notifier,
                          )
                          .createComment(
                            widget
                                .publication
                                .id,

                            CreateCommentRequest(
                              content:
                                  _controller
                                      .text
                                      .trim(),
                            ),
                          );

                      _controller.clear();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}