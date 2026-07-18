import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/profile_notifier.dart';

import '../widgets/profile_actions_card.dart';
import '../widgets/profile_bio_card.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_information_card.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() =>
      _ProfilePageState();
}

class _ProfilePageState
    extends ConsumerState<ProfilePage> {

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref.read(profileProvider.notifier).loadProfile();
    });
  }

  Future<void> _refresh() async {
    await ref.read(profileProvider.notifier).loadProfile();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(profileProvider);

    if (state.isLoading && state.profile == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    final profile = state.profile;

    if (profile == null) {
      return const Scaffold(
        body: Center(
          child: Text(
            "Impossible de charger le profil.",
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF8F5FA),

      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F5FA),
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        title: const Text(
          "Mon profil",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: RefreshIndicator(
        onRefresh: _refresh,
        child: ListView(
          physics:
              const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20),
          children: [

            ProfileHeader(
              profile: profile,
            ),

            const SizedBox(height: 24),

            ProfileInformationCard(
              profile: profile,
            ),

            const SizedBox(height: 20),

            ProfileBioCard(
              profile: profile,
            ),

            const SizedBox(height: 20),

            const ProfileActionsCard(),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}