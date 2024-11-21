import 'package:flutter/material.dart';
import 'package:habit_tracker/presentation/challenge/providers/finished_challenges_provider.dart';
import 'package:habit_tracker/presentation/common_widgets/finished_challenge_card.dart';
import 'package:habit_tracker/presentation/theme/app_spacing.dart';
import 'package:habit_tracker/presentation/theme/colors.dart';
import 'package:provider/provider.dart';

class FinishedChallengesPage extends StatelessWidget {
  const FinishedChallengesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.customScaffold,
      appBar: AppBar(
        title: const Text('Finished Challenges'),
      ),
      body: Consumer<FinishedChallengesProvider>(
        builder: (context, provider, child) {
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) => FinishedChallengeCard(
              challenge: provider.challenges.elementAt(index),
            ),
            separatorBuilder: (context, index) => AppSpacing.vertical16,
            itemCount: provider.challenges.length,
          );
        },
      ),
    );
  }
}
