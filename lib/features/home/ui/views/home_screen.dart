import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tea_challenge/app/dependencies/locator.dart';
import 'package:tea_challenge/app/theming/app_spacing.dart';
import 'package:tea_challenge/app/ui/sizing_constants.dart';
import 'package:tea_challenge/features/entries/data/models/entry.dart';
import 'package:tea_challenge/features/entries/data/models/water_progress.dart';
import 'package:tea_challenge/features/entries/entries.dart';
import 'package:tea_challenge/features/entries/ui/view_models/entry_type.dart';
import 'package:tea_challenge/features/home/ui/view_models/home_filter_type.dart';
import 'package:tea_challenge/features/home/ui/view_models/home_view_model.dart';
import 'package:tea_challenge/features/home/ui/views/components/empty_entries_content.dart';
import 'package:tea_challenge/features/home/ui/views/components/entries_list_content.dart';
import 'package:tea_challenge/features/home/ui/views/components/main_progress_ring.dart';
import 'package:tea_challenge/features/home/ui/views/components/secondary_progress_ring.dart';
import 'package:tea_challenge/features/home/ui/views/components/water_cup_progress.dart';
import 'package:tea_challenge/features/home/ui/views/dialogs/delete_entry_dialog.dart';
import 'package:tea_challenge/features/user/data/models/user_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeViewModel _viewModel = getIt<HomeViewModel>();

  @override
  void initState() {
    super.initState();
    _viewModel.load();
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
        body: Stack(
          children: [
            RefreshIndicator(
              onRefresh: _viewModel.refresh,
              edgeOffset: SizingConstants.refreshIndicatorEdgeOffset,
              child: CustomScrollView(
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
                              onTap: () {},
                            );
                          },
                        ),
                        const Gap(AppSpacing.md),
                        // Main Progress Rings
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              final ringSize = (constraints.maxWidth / 2) - AppSpacing.md;

                              return Wrap(
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
                                        size: ringSize,
                                      );
                                    },
                                  ),
                                  Selector<HomeViewModel, WaterProgress>(
                                    selector: (context, viewModel) => viewModel.waterProgress,
                                    builder: (context, progress, child) {
                                      return WaterCupProgress(
                                        progressPercentage: progress.progressPercentage,
                                        topLabel: '${progress.totalAmountInLiters.toInt()}L',
                                        middleLabel: 'of ${progress.goalInLiters.toInt()}L',
                                        bottomLabel: '${(progress.progressPercentage * 100).toInt()}%',
                                        color: Colors.blue,
                                        size: ringSize,
                                      );
                                    },
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        const Gap(AppSpacing.md),
                        // Macro details
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
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
                                    goalLabel: '${progress.carbsGoal.toInt()}g',
                                    description: 'Carbs',
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
                                    goalLabel: '${progress.proteinGoal.toInt()}g',
                                    description: 'Protein',
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
                                    goalLabel: '${progress.fatGoal.toInt()}g',
                                    description: 'Fat',
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
                      ],
                    ),
                  ),
                  Consumer<HomeViewModel>(
                    builder: (context, viewModel, child) {
                      if (viewModel.foodRecords.isNotEmpty || viewModel.waterRecords.isNotEmpty) {
                        return PinnedHeaderSliver(
                          child: Container(
                            color: theme.scaffoldBackgroundColor,
                            padding: const EdgeInsets.all(AppSpacing.md),
                            child: SegmentedButton<HomeFilterType>(
                              segments: const [
                                ButtonSegment(value: HomeFilterType.all, label: Text('All')),
                                ButtonSegment(value: HomeFilterType.food, label: Text('Food')),
                                ButtonSegment(value: HomeFilterType.water, label: Text('Water')),
                              ],
                              selected: {viewModel.selectedSegment},
                              onSelectionChanged: (value) {
                                viewModel.setSelectedSegment(value.first);
                              },
                            ),
                          ),
                        );
                      }
                      return const SliverToBoxAdapter(child: SizedBox.shrink());
                    },
                  ),
                  Consumer<HomeViewModel>(
                    builder: (context, viewModel, child) {
                      if (viewModel.isLoading) {
                        return const SliverFillRemaining(hasScrollBody: false, child: Center(child: CircularProgressIndicator()));
                      }

                      if (viewModel.noRecords) {
                        return const SliverFillRemaining(hasScrollBody: false, child: EmptyEntriesContent());
                      }

                      return EntriesListContent(
                        entries: viewModel.entries,
                        onDismiss: _viewModel.setEntryToDelete,
                        onTap: (entry) async {
                          if (context.mounted) {
                            final _ = await context.pushNamed(
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
                            _viewModel.refresh();
                          }
                        },
                      );
                    },
                  ),
                  const SliverToBoxAdapter(child: Gap(SizingConstants.homeBottomPadding)),
                ],
              ),
            ),
            Selector<HomeViewModel, bool>(
              selector: (context, viewModel) => viewModel.showDeleteEntryDialog,
              builder: (context, showDeleteEntryDialog, child) {
                if (showDeleteEntryDialog) {
                  _showDeleteEntryDialog();
                }
                return const SizedBox.shrink();
              },
            ),
            Selector<HomeViewModel, bool>(
              selector: (context, viewModel) => viewModel.showUndoDeleteEntry,
              builder: (context, showUndoDeleteEntry, child) {
                if (showUndoDeleteEntry) {
                  _showUndoDeleteEntrySnackBar();
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          tooltip: 'Add Entry',
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

  void _showDeleteEntryDialog() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return DeleteEntryDialog(
            onDelete: () {
              context.pop();
              _viewModel.deleteEntry();
            },
            onCancel: () {
              context.pop();
              _viewModel.resetEntryToDelete();
            },
          );
        },
      );
    });
  }

  void _showUndoDeleteEntrySnackBar() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: _viewModel.undoDeleteEntryDuration,
          content: const Text("Entry deleted"),
          action: SnackBarAction(label: "Undo", onPressed: _viewModel.undoDeleteEntry),
        ),
      );
    });
  }
}
