import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/publication_notifier.dart';
import '../widgets/publication_card.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_routes.dart';

class CommunityPage extends ConsumerStatefulWidget {
  const CommunityPage({
    super.key,
  });

  @override
  ConsumerState<CommunityPage> createState() =>
      _CommunityPageState();
}

class _CommunityPageState
    extends ConsumerState<CommunityPage> {

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref
          .read(publicationProvider.notifier)
          .loadAllPublications();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state =
        ref.watch(publicationProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Communauté",
        ),
      ),

      floatingActionButton:
          FloatingActionButton(
        onPressed: () {
          context.push(
            AppRoutes.createPublication,
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),

      body: RefreshIndicator(
        onRefresh: () async {
          await ref
              .read(
                publicationProvider.notifier,
              )
              .loadAllPublications();
        },
        child: state.isLoading &&
                state.publications.isEmpty
            ? const Center(
                child:
                    CircularProgressIndicator(),
              )
            : ListView.separated(
                padding:
                    const EdgeInsets.all(16),

                itemCount:
                    state.publications.length,

                separatorBuilder:
                    (_, __) =>
                        const SizedBox(
                  height: 16,
                ),

                itemBuilder: (_, index) {
                  return PublicationCard(
                    publication:
                        state.publications[
                            index],
                  );
                },
              ),
      ),
    );
  }
}