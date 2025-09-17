import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tea_challenge/app/dependencies/locator.dart';
import 'package:tea_challenge/app/theming/app_spacing.dart';
import 'package:tea_challenge/features/entries/data/models/entry.dart';
import 'package:tea_challenge/features/entries/data/models/water_progress.dart';
import 'package:tea_challenge/features/entries/entries.dart';
import 'package:tea_challenge/features/entries/ui/view_models/entry_type.dart';
import 'package:tea_challenge/features/home/ui/view_models/home_view_model.dart';
import 'package:tea_challenge/features/home/ui/views/components/main_progress_ring.dart';
import 'package:tea_challenge/features/home/ui/views/components/secondary_progress_ring.dart';
import 'package:tea_challenge/features/user/data/models/user_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = getIt<HomeViewModel>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _viewModel.load();
    });
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: Scaffold(
        // appBar:
        body: CustomScrollView(
          slivers: [
            SliverAppBar.medium(
              title: const Text('Home'),
              bottom: PreferredSize(
                preferredSize: const Size(double.infinity, AppSpacing.xs),
                child: Selector<HomeViewModel, bool>(
                  selector: (context, viewModel) => viewModel.isLoading || viewModel.isRefreshing,
                  builder: (context, showProgress, child) => showProgress ? const LinearProgressIndicator() : child!,
                  child: const SizedBox.shrink(),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Selector<HomeViewModel, UserData>(
                        selector: (context, viewModel) => viewModel.userData,
                        builder: (context, userData, child) {
                          return ListTile(
                            title: Text('Hello, ${userData.name}!', style: theme.textTheme.titleLarge),
                            subtitle:
                                !userData.wasUpdated ? Text('Did you know you can update your profile?', style: theme.textTheme.bodyMedium) : null,
                            trailing: const Icon(Icons.chevron_right),
                            onTap: () {
                              if (context.mounted) {
                                // context.pushNamed(UpdateProfileScreen.routeName);
                              }
                            },
                          );
                        },
                      ),
                      const Gap(AppSpacing.lg),
                      // Food Progress Card
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                        child: Wrap(
                          spacing: AppSpacing.md,
                          runSpacing: AppSpacing.md,
                          alignment: WrapAlignment.spaceBetween,
                          children: [
                            Selector<HomeViewModel, FoodProgress>(
                              selector: (context, viewModel) => viewModel.foodProgress,
                              builder: (context, progress, child) {
                                return MainProgressRing(
                                  progressPercentage: progress.caloriesProgressPercentage,
                                  topLabel: '${progress.totalCalories.toInt()}',
                                  middleLabel: 'of ${progress.caloriesGoal.toInt()} kcal',
                                  bottomLabel: '${(progress.caloriesProgressPercentage * 100).toInt()}%',
                                  color: Colors.orange,
                                  size: 180,
                                );
                              },
                            ),
                            Selector<HomeViewModel, WaterProgress>(
                              selector: (context, viewModel) => viewModel.waterProgress,
                              builder: (context, progress, child) {
                                return MainProgressRing(
                                  progressPercentage: progress.progressPercentage,
                                  topLabel: '${progress.totalAmountInLiters.toInt()}L',
                                  middleLabel: 'of ${progress.goalInLiters.toInt()}L',
                                  bottomLabel: '${(progress.progressPercentage * 100).toInt()}%',
                                  color: Colors.blue,
                                  size: 180,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            PinnedHeaderSliver(
              child: Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                color: theme.scaffoldBackgroundColor,
                child: Wrap(
                  spacing: AppSpacing.md,
                  runSpacing: AppSpacing.md,
                  alignment: WrapAlignment.spaceBetween,
                  crossAxisAlignment: WrapCrossAlignment.end,
                  children: [
                    // Carbs
                    Selector<HomeViewModel, FoodProgress>(
                      selector: (context, viewModel) => viewModel.foodProgress,
                      builder: (context, progress, child) {
                        return SecondaryProgressRing(
                          progressPercentage: progress.carbsProgressPercentage,
                          totalLabel: '${progress.totalCarbs.toInt()}g',
                          description: 'of ${progress.carbsGoal.toInt()}g',
                          color: Colors.amber,
                        );
                      },
                    ),
                    // Protein
                    Selector<HomeViewModel, FoodProgress>(
                      selector: (context, viewModel) => viewModel.foodProgress,
                      builder: (context, progress, child) {
                        return SecondaryProgressRing(
                          progressPercentage: progress.proteinProgressPercentage,
                          totalLabel: '${progress.totalProtein.toInt()}g',
                          description: 'of ${progress.proteinGoal.toInt()}g',
                          color: Colors.green,
                        );
                      },
                    ),
                    // Fat
                    Selector<HomeViewModel, FoodProgress>(
                      selector: (context, viewModel) => viewModel.foodProgress,
                      builder: (context, progress, child) {
                        return SecondaryProgressRing(
                          progressPercentage: progress.fatProgressPercentage,
                          totalLabel: '${progress.totalFat.toInt()}g',
                          description: 'of ${progress.fatGoal.toInt()}g',
                          color: Colors.red,
                        );
                      },
                    ),
                    // Water Progress Details
                    Column(
                      spacing: AppSpacing.md,
                      children: [
                        Selector<HomeViewModel, double>(
                          selector: (context, viewModel) => viewModel.waterProgress.remainingInLiters,
                          builder: (context, remaining, child) {
                            return Column(
                              children: [
                                Text('${remaining.toStringAsFixed(1)}L', style: theme.textTheme.titleLarge?.copyWith(color: Colors.orange)),
                                Text('Remaining', style: theme.textTheme.bodyMedium),
                              ],
                            );
                          },
                        ),
                        Selector<HomeViewModel, bool>(
                          selector: (context, viewModel) => viewModel.waterProgress.isGoalReached,
                          builder: (context, isGoalReached, child) {
                            return Column(
                              children: [
                                Icon(
                                  isGoalReached ? Icons.check_circle : Icons.water_drop,
                                  color: isGoalReached ? Colors.green : Colors.blue,
                                  size: 32,
                                ),
                                Text(
                                  isGoalReached ? 'Goal Reached!' : 'Keep Going',
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: isGoalReached ? Colors.green : Colors.blue,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Consumer<HomeViewModel>(
              builder: (context, viewModel, child) {
                if (viewModel.isLoading) {
                  return const SliverFillRemaining(hasScrollBody: false, child: Center(child: CircularProgressIndicator()));
                }

                if (viewModel.noRecords) {
                  return const SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.water_drop, size: 64, color: Colors.grey),
                          SizedBox(height: AppSpacing.md),
                          Text('No water entries found', style: TextStyle(fontSize: 18, color: Colors.grey)),
                          SizedBox(height: AppSpacing.sm),
                          Text('Start tracking your water intake!', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ),
                  );
                }

                return SliverPadding(
                  padding: const EdgeInsets.only(bottom: 120),
                  sliver: SliverList.separated(
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: viewModel.entries.length,
                    itemBuilder: (context, index) {
                      final entry = viewModel.entries[index];

                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: switch (entry) {
                            WaterEntry() => Colors.blue,
                            FoodEntry() => Colors.green,
                            _ => Colors.grey,
                          },
                          child: Icon(switch (entry) {
                            WaterEntry() => Icons.water_drop,
                            FoodEntry() => Icons.restaurant,
                            _ => Icons.question_mark,
                          }, color: Colors.white),
                        ),
                        title: Text(entry.displayName),
                        subtitle: Text(switch (entry) {
                          WaterEntry() => 'Water',
                          FoodEntry() => 'Food',
                          _ => 'Unknown',
                        }),
                        trailing:
                            entry.createdAt != null
                                ? Text(
                                  '${entry.createdAt!.hour.toString().padLeft(2, '0')}:${entry.createdAt!.minute.toString().padLeft(2, '0')}',
                                  style: theme.textTheme.bodySmall,
                                )
                                : null,
                        onTap: () {
                          if (context.mounted) {
                            context.goNamed(
                              CreateEntryScreen.routeName,
                              queryParameters: {
                                'id': entry.id.toString(),
                                'type': switch (entry) {
                                  WaterEntry() => EntryType.water.value,
                                  FoodEntry() => EntryType.food.value,
                                  _ => EntryType.food.value,
                                },
                              },
                            );
                          }
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            if (context.mounted) {
              final _ = await context.pushNamed(CreateEntryScreen.routeName);
              _viewModel.refresh();
            }
          },
          label: const Text('Add Entry'),
          icon: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
