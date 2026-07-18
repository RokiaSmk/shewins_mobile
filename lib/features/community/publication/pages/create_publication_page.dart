import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/enums/publication_category.dart';
import '../providers/publication_notifier.dart';
import '../requests/create_publication_request.dart';

class CreatePublicationPage extends ConsumerStatefulWidget {
  const CreatePublicationPage({
    super.key,
  });

  @override
  ConsumerState<CreatePublicationPage> createState() =>
      _CreatePublicationPageState();
}

class _CreatePublicationPageState
    extends ConsumerState<CreatePublicationPage> {
  final _titleController = TextEditingController();

  final _contentController = TextEditingController();

  PublicationCategory _category =
      PublicationCategory.question;

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(publicationProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Nouvelle publication",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: "Titre",
              ),
            ),

            const SizedBox(height: 16),

            DropdownButtonFormField<PublicationCategory>(
              value: _category,
              items: PublicationCategory.values
                  .map(
                    (category) => DropdownMenuItem(
                      value: category,
                      child: Text(
                        category.name.toUpperCase(),
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
                controller: _contentController,
                maxLines: null,
                expands: true,
                decoration: const InputDecoration(
                  alignLabelWithHint: true,
                  labelText:
                      "Partagez votre expérience...",
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
                        if (_titleController.text
                                .trim()
                                .isEmpty ||
                            _contentController.text
                                .trim()
                                .isEmpty) {
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Veuillez remplir tous les champs.",
                              ),
                            ),
                          );
                          return;
                        }

                        await ref
                            .read(
                              publicationProvider
                                  .notifier,
                            )
                            .createPublication(
                              CreatePublicationRequest(
                                title:
                                    _titleController.text
                                        .trim(),
                                content:
                                    _contentController.text
                                        .trim(),
                                category: _category,
                              ),
                            );

                        if (!mounted) return;

                        final newState = ref.read(
                          publicationProvider,
                        );

                        if (newState.error == null) {
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Publication créée avec succès.",
                              ),
                            ),
                          );

                          Navigator.pop(context);
                        } else {
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(
                            SnackBar(
                              content: Text(
                                newState.error!,
                              ),
                            ),
                          );
                        }
                      },
                child: state.isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child:
                            CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text("Publier"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}