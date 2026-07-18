import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/comment.dart';

import '../providers/comment_notifier.dart';

import '../requests/update_comment_request.dart';

class EditCommentPage extends ConsumerStatefulWidget {
  final String publicationId;

  final Comment comment;

  const EditCommentPage({
    super.key,
    required this.publicationId,
    required this.comment,
  });

  @override
  ConsumerState<EditCommentPage> createState() =>
      _EditCommentPageState();
}

class _EditCommentPageState
    extends ConsumerState<EditCommentPage> {

  late final TextEditingController
      _controller;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController(
      text: widget.comment.content,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final state =
        ref.watch(commentProvider);

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Modifier le commentaire",
        ),
      ),

      body: Padding(
        padding:
            const EdgeInsets.all(20),

        child: Column(
          children: [

            Expanded(
              child: TextField(
                controller:
                    _controller,
                expands: true,
                maxLines: null,
                decoration:
                    const InputDecoration(
                  alignLabelWithHint: true,
                  labelText:
                      "Commentaire",
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: FilledButton(
               onPressed: state.isLoading
              ? null
              : () async {
                  if (_controller.text.trim().isEmpty) {
                    return;
                  }

                  await ref
                      .read(commentProvider.notifier)
                      .updateComment(
                        widget.publicationId,
                        widget.comment.id,
                        UpdateCommentRequest(
                          content: _controller.text.trim(),
                        ),
                      );

                  if (!mounted) return;

                  Navigator.pop(context);
                },
                child: const Text(
                  "Enregistrer",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}