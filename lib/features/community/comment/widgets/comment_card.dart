import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/widgets/app_card.dart';

import '../../../profile/providers/profile_notifier.dart';

import '../models/comment.dart';
import '../pages/edit_comment_page.dart';
import '../providers/comment_notifier.dart';

class CommentCard extends ConsumerWidget {
  final String publicationId;

  final Comment comment;

  const CommentCard({
    super.key,
    required this.publicationId,
    required this.comment,
  });

  void _showCommentMenu(
    BuildContext context,
    WidgetRef ref,
  ) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (_) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 12),

              ListTile(
                leading: const Icon(
                  Icons.edit_outlined,
                ),
                title: const Text(
                  "Modifier",
                ),
                onTap: () {
                  Navigator.pop(context);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => EditCommentPage(
                        publicationId: publicationId,
                        comment: comment,
                      ),
                    ),
                  );
                },
              ),

              ListTile(
                leading: const Icon(
                  Icons.delete_outline,
                  color: Colors.red,
                ),
                title: const Text(
                  "Supprimer",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
                onTap: () async {
                  Navigator.pop(context);

                  final confirm =
                      await showDialog<bool>(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text(
                        "Supprimer le commentaire",
                      ),
                      content: const Text(
                        "Voulez-vous vraiment supprimer ce commentaire ?",
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(
                              context,
                              false,
                            );
                          },
                          child: const Text(
                            "Annuler",
                          ),
                        ),
                        FilledButton(
                          onPressed: () {
                            Navigator.pop(
                              context,
                              true,
                            );
                          },
                          child: const Text(
                            "Supprimer",
                          ),
                        ),
                      ],
                    ),
                  );

                  if (confirm != true) {
                    return;
                  }

                  await ref
                      .read(
                        commentProvider.notifier,
                      )
                      .deleteComment(
                        publicationId,
                        comment.id,
                      );
                },
              ),

              const SizedBox(height: 12),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final formatter =
        DateFormat("dd/MM/yyyy HH:mm");

    final profile =
        ref.watch(profileProvider).profile;

    final canManage =
        profile != null &&
        comment.authorId == profile.memberId;

    return AppCard(
      icon: Icons.chat_bubble_outline,
      title: "Commentaire",
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor:
                Theme.of(context)
                    .primaryColor
                    .withOpacity(.1),
            child: Text(
              comment.authorFirstName.isNotEmpty
                  ? comment.authorFirstName[0]
                      .toUpperCase()
                  : "?",
              style: TextStyle(
                color: Theme.of(context)
                    .primaryColor,
                fontWeight:
                    FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "${comment.authorFirstName} ${comment.authorLastName}",
                        style: const TextStyle(
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                    ),

                    if (canManage)
                      IconButton(
                        onPressed: () {
                          _showCommentMenu(
                            context,
                            ref,
                          );
                        },
                        icon: const Icon(
                          Icons.more_horiz,
                        ),
                      ),
                  ],
                ),

                Text(
                  comment.content,
                ),

                const SizedBox(height: 8),

                Text(
                  formatter.format(
                    comment.createdAt,
                  ),
                  style: TextStyle(
                    color:
                        Colors.grey.shade600,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}