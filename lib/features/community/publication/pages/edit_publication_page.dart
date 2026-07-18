import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/publication.dart';
import '../models/enums/publication_category.dart';

import '../providers/publication_notifier.dart';

import '../requests/update_publication_request.dart';

class EditPublicationPage
    extends ConsumerStatefulWidget {
  final Publication publication;

  const EditPublicationPage({
    super.key,
    required this.publication,
  });

  @override
  ConsumerState<EditPublicationPage>
      createState() =>
          _EditPublicationPageState();
}

class _EditPublicationPageState
    extends ConsumerState<EditPublicationPage> {

  late final TextEditingController
      _titleController;

  late final TextEditingController
      _contentController;

  late PublicationCategory _category;

  late bool _commentsEnabled;

  @override
  void initState() {
    super.initState();

    _titleController =
        TextEditingController(
      text: widget.publication.title,
    );

    _contentController =
        TextEditingController(
      text: widget.publication.content,
    );

    _category =
        widget.publication.category;

    _commentsEnabled =
        widget.publication.commentsEnabled;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state =
        ref.watch(publicationProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Modifier la publication",
        ),
      ),

      body: Padding(
        padding:
            const EdgeInsets.all(20),

        child: Column(
          children: [

            TextField(
              controller:
                  _titleController,
              decoration:
                  const InputDecoration(
                labelText: "Titre",
              ),
            ),

            const SizedBox(height: 16),

            DropdownButtonFormField<
                PublicationCategory>(
              value: _category,

              items:
                  PublicationCategory
                      .values
                      .map(
                        (category) =>
                            DropdownMenuItem(
                          value: category,
                          child: Text(
                            category.name
                                .toUpperCase(),
                          ),
                        ),
                      )
                      .toList(),

              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _category = value;
                  });
                }
              },
            ),

            const SizedBox(height: 16),

            Expanded(
              child: TextField(
                controller:
                    _contentController,
                expands: true,
                maxLines: null,
                decoration:
                    const InputDecoration(
                  alignLabelWithHint:
                      true,
                  labelText:
                      "Contenu",
                ),
              ),
            ),

            const SizedBox(height: 16),

            SwitchListTile(
              value:
                  _commentsEnabled,

              title: const Text(
                "Autoriser les commentaires",
              ),

              onChanged: (value) {
                setState(() {
                  _commentsEnabled =
                      value;
                });
              },
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,

              child: FilledButton(
                onPressed:
                    state.isLoading
                        ? null
                        : () async {

                            await ref
                                .read(
                                  publicationProvider
                                      .notifier,
                                )
                                .updatePublication(

                                  widget
                                      .publication
                                      .id,

                                  UpdatePublicationRequest(

                                    title:
                                        _titleController
                                            .text,

                                    content:
                                        _contentController
                                            .text,

                                    category:
                                        _category,

                                    commentsEnabled:
                                        _commentsEnabled,

                                  ),
                                );

                            if (!mounted) {
                              return;
                            }

                            Navigator.pop(
                              context,
                            );
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