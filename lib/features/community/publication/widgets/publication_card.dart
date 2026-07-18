
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../../core/widgets/app_card.dart';

import '../../comment/pages/comments_page.dart';
import '../../../profile/providers/profile_notifier.dart';

import '../../reaction/models/enums/reaction_type.dart';
import '../../reaction/providers/reaction_notifier.dart';
import '../../reaction/requests/create_reaction_request.dart';
import '../../report/pages/report_publication_page.dart';

import '../models/enums/publication_category.dart';
import '../models/publication.dart';

import '../pages/edit_publication_page.dart';
import '../providers/publication_notifier.dart';

class PublicationCard extends ConsumerWidget {
  final Publication publication;

  const PublicationCard({
    super.key,
    required this.publication,
  });

  Color _categoryColor() {
    switch (publication.category) {
      case PublicationCategory.question:
        return Colors.blue;

      case PublicationCategory.experience:
        return Colors.green;

      case PublicationCategory.conseil:
        return Colors.orange;

      case PublicationCategory.temoignage:
        return Colors.purple;
    }
  }

  IconData _categoryIcon() {
    switch (publication.category) {
      case PublicationCategory.question:
        return Icons.help_outline;

      case PublicationCategory.experience:
        return Icons.auto_stories;

      case PublicationCategory.conseil:
        return Icons.tips_and_updates;

      case PublicationCategory.temoignage:
        return Icons.favorite;
    }
  }

  void _showReactionMenu(
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
              ListTile(
                leading: const Icon(Icons.lightbulb_outline),
                title: const Text("Utile"),
                onTap: () async {
                  Navigator.pop(context);

                  await ref
                      .read(reactionProvider.notifier)
                      .reactToPublication(
                        publication.id,
                        const CreateReactionRequest(
                          reactionType: ReactionType.helpful,
                        ),
                      );

                  await ref
                      .read(publicationProvider.notifier)
                      .loadAllPublications();
                },
              ),

              ListTile(
                leading: const Icon(Icons.favorite),
                title: const Text("Soutien"),
                onTap: () async {
                  Navigator.pop(context);

                  await ref
                      .read(reactionProvider.notifier)
                      .reactToPublication(
                        publication.id,
                        const CreateReactionRequest(
                          reactionType: ReactionType.support,
                        ),
                      );

                  await ref
                      .read(publicationProvider.notifier)
                      .loadAllPublications();
                },
              ),

              ListTile(
                leading: const Icon(Icons.volunteer_activism),
                title: const Text("Merci"),
                onTap: () async {
                  Navigator.pop(context);

                  await ref
                      .read(reactionProvider.notifier)
                      .reactToPublication(
                        publication.id,
                        const CreateReactionRequest(
                          reactionType: ReactionType.thankYou,
                        ),
                      );

                  await ref
                      .read(publicationProvider.notifier)
                      .loadAllPublications();
                },
              ),

              const Divider(),

              ListTile(
                leading: const Icon(
                  Icons.delete_outline,
                  color: Colors.red,
                ),
                title: const Text(
                  "Retirer ma réaction",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
                onTap: () async {
                  Navigator.pop(context);

                  await ref
                      .read(reactionProvider.notifier)
                      .removeReaction(
                        publication.id,
                      );

                  await ref
                      .read(publicationProvider.notifier)
                      .loadAllPublications();
                },
              ),

              const SizedBox(height: 12),
            ],
          ),
        );
      },
    );
  }

  void _showPublicationMenu(
  BuildContext context,
  WidgetRef ref,
  ) {
    final profileState = ref.read(profileProvider);

    final isMine =
        profileState.profile?.memberId ==
        publication.authorId;

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

              if (isMine)
                ListTile(
                  leading: const Icon(
                    Icons.edit_outlined,
                  ),
                  title: const Text("Modifier"),
                  onTap: () {
                    Navigator.pop(context);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => EditPublicationPage(
                          publication: publication,
                        ),
                      ),
                    );
                  },
                ),

              if (!isMine)
                ListTile(
                  leading: const Icon(
                    Icons.flag_outlined,
                    color: Colors.orange,
                  ),
                  title: const Text("Signaler"),
                  onTap: () {
                    Navigator.pop(context);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ReportPublicationPage(
                          publicationId: publication.id,
                        ),
                      ),
                    );
                  },
                ),

              if (isMine)
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
                          "Supprimer la publication",
                        ),
                        content: const Text(
                          "Voulez-vous vraiment supprimer cette publication ?",
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
                          publicationProvider.notifier,
                        )
                        .deletePublication(
                          publication.id,
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

    return AppCard(
      icon: _categoryIcon(),
      title: publication.category.name,
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          /// HEADER
          Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor:
                    Theme.of(context)
                        .primaryColor
                        .withOpacity(.12),
                child: Text(
                  publication.authorFirstName
                          .isNotEmpty
                      ? publication
                          .authorFirstName[0]
                          .toUpperCase()
                      : "?",
                  style: TextStyle(
                    color:
                        Theme.of(context)
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
                      CrossAxisAlignment
                          .start,
                  children: [
                    Text(
                      "${publication.authorFirstName} ${publication.authorLastName}",
                      style:
                          const TextStyle(
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    Text(
                      formatter.format(
                        publication.createdAt,
                      ),
                      style: TextStyle(
                        color: Colors
                            .grey.shade600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color:
                      _categoryColor()
                          .withOpacity(.12),
                  borderRadius:
                      BorderRadius.circular(
                    30,
                  ),
                ),
                child: Row(
                  mainAxisSize:
                      MainAxisSize.min,
                  children: [
                    Icon(
                      _categoryIcon(),
                      size: 15,
                      color:
                          _categoryColor(),
                    ),

                    const SizedBox(
                      width: 5,
                    ),

                    Text(
                      publication
                          .category.name,
                      style: TextStyle(
                        color:
                            _categoryColor(),
                        fontWeight:
                            FontWeight
                                .bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          Text(
            publication.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight:
                  FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            publication.content,
          ),

          const SizedBox(height: 22),

          const Divider(),

          Row(
            mainAxisAlignment:
                MainAxisAlignment
                    .spaceAround,
            children: [

              /// ❤️ Réactions
              InkWell(
                borderRadius:
                    BorderRadius.circular(
                  8,
                ),
                onTap: () {
                  _showReactionMenu(
                    context,
                    ref,
                  );
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons
                          .favorite_border,
                      size: 20,
                    ),

                    const SizedBox(
                      width: 6,
                    ),

                    Text(
                      "${publication.reactionCount}",
                    ),
                  ],
                ),
              ),

              /// 💬 Commentaires
              InkWell(
                borderRadius:
                    BorderRadius.circular(
                  8,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          CommentsPage(
                        publication:
                            publication,
                      ),
                    ),
                  ).then((_) {
                    ref
                        .read(
                          publicationProvider
                              .notifier,
                        )
                        .loadAllPublications();
                  });
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons
                          .chat_bubble_outline,
                      size: 20,
                    ),

                    const SizedBox(
                      width: 6,
                    ),

                    Text(
                      "${publication.commentCount}",
                    ),
                  ],
                ),
              ),

              /// ⋮ Menu
              IconButton(
                onPressed: () {
                  _showPublicationMenu(
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
        ],
      ),
    );
  }
}