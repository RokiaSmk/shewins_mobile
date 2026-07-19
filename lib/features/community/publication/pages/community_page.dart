import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/constants/app_routes.dart';

import '../providers/publication_notifier.dart';
import '../widgets/publication_card.dart';

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
    final state = ref.watch(publicationProvider);

    return Scaffold(
      backgroundColor: const Color(0xffF8F5FA),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Communauté",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primary,
        icon: const Icon(Icons.edit),
        label: const Text(
          "Publier",
        ),
        onPressed: () {
          context.push(
            AppRoutes.createPublication,
          );
        },
      ),

      body: RefreshIndicator(
        onRefresh: () async {
          await ref
              .read(publicationProvider.notifier)
              .loadAllPublications();
        },
        child: state.isLoading &&
                state.publications.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : state.publications.isEmpty
                ? ListView(
                    children: const [
                      SizedBox(height: 120),
                      Icon(
                        Icons.forum_outlined,
                        size: 90,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: Text(
                          "Aucune publication",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 30,
                          ),
                          child: Text(
                            "Soyez la première à partager une expérience, un conseil ou une question avec la communauté ❤️",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      Container(
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppColors.primary.withOpacity(.12),
                              Colors.white,
                            ],
                          ),
                          borderRadius:
                              BorderRadius.circular(18),
                        ),
                        child: const Row(
                          children: [
                            CircleAvatar(
                              radius: 24,
                              child: Icon(
                                Icons.people_alt_outlined,
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                "Échangez avec d'autres femmes, partagez vos expériences et trouvez du soutien dans une communauté bienveillante.",
                                style: TextStyle(
                                  height: 1.4,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      ...state.publications.map(
                        (publication) => Padding(
                          padding:
                              const EdgeInsets.only(
                            bottom: 16,
                          ),
                          child: PublicationCard(
                            publication: publication,
                          ),
                        ),
                      ),
                    ],
                  ),
      ),
    );
  }
}