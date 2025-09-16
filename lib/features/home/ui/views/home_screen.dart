import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tea_challenge/app/dependencies/locator.dart';
import 'package:tea_challenge/app/theming/app_spacing.dart';
import 'package:tea_challenge/features/entries/entries.dart';
import 'package:tea_challenge/features/home/ui/view_models/home_view_model.dart';

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
        appBar: AppBar(
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
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Selector<HomeViewModel, String>(
                    selector: (context, viewModel) => viewModel.userData.name,
                    builder: (context, name, child) => Text('Hello, $name!', style: theme.textTheme.titleLarge),
                  ),
                  Text('How are you doing today?', style: theme.textTheme.bodyMedium),
                  Row(
                    spacing: AppSpacing.xs,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Consumer<HomeViewModel>(
                        builder: (context, viewModel, child) {
                          return Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                height: 120,
                                width: 120,
                                child: CircularProgressIndicator(
                                  strokeWidth: 10,
                                  strokeCap: StrokeCap.round,
                                  backgroundColor: theme.colorScheme.surfaceContainer,
                                  value: viewModel.foodProgress.calories + 1000 / viewModel.userData.caloriesGoal,
                                ),
                              ),
                              Column(
                                children: [
                                  Text('${viewModel.foodProgress.calories + 1000} of', style: theme.textTheme.bodyMedium),
                                  Text('${viewModel.userData.caloriesGoal} kcal', style: theme.textTheme.bodyMedium),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                      Column(
                        children: [
                          Consumer<HomeViewModel>(
                            builder: (context, viewModel, child) {
                              return Stack(
                                alignment: Alignment.center,
                                children: [
                                  SizedBox(
                                    height: 60,
                                    width: 60,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 5,
                                      strokeCap: StrokeCap.round,
                                      backgroundColor: theme.colorScheme.surfaceContainer,
                                      color: Colors.green,
                                      value: viewModel.foodProgress.protein + 10 / viewModel.userData.proteinGoal,
                                    ),
                                  ),
                                  Column(children: [Text('${viewModel.foodProgress.protein + 10}g', style: theme.textTheme.bodyMedium)]),
                                ],
                              );
                            },
                          ),
                          Text('Protein', style: theme.textTheme.bodyMedium),
                        ],
                      ),
                      Column(
                        children: [
                          Consumer<HomeViewModel>(
                            builder: (context, viewModel, child) {
                              return Stack(
                                alignment: Alignment.center,
                                children: [
                                  SizedBox(
                                    height: 60,
                                    width: 60,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 5,
                                      strokeCap: StrokeCap.round,
                                      backgroundColor: theme.colorScheme.surfaceContainer,
                                      color: Colors.amber,
                                      value: viewModel.foodProgress.carbs + 10 / viewModel.userData.carbsGoal,
                                    ),
                                  ),
                                  Column(children: [Text('${viewModel.foodProgress.carbs + 10}g', style: theme.textTheme.bodyMedium)]),
                                ],
                              );
                            },
                          ),
                          Text('Carbs', style: theme.textTheme.bodyMedium),
                        ],
                      ),
                      Column(
                        children: [
                          Consumer<HomeViewModel>(
                            builder: (context, viewModel, child) {
                              return Stack(
                                alignment: Alignment.center,
                                children: [
                                  SizedBox(
                                    height: 60,
                                    width: 60,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 5,
                                      strokeCap: StrokeCap.round,
                                      backgroundColor: theme.colorScheme.surfaceContainer,
                                      color: Colors.red,
                                      value: viewModel.foodProgress.fat + 10 / viewModel.userData.fatGoal,
                                    ),
                                  ),
                                  Column(children: [Text('${viewModel.foodProgress.fat + 10}g', style: theme.textTheme.bodyMedium)]),
                                ],
                              );
                            },
                          ),
                          Text('Fat', style: theme.textTheme.bodyMedium),
                        ],
                      ),
                      Column(
                        children: [
                          Consumer<HomeViewModel>(
                            builder: (context, viewModel, child) {
                              return Stack(
                                alignment: Alignment.center,
                                children: [
                                  SizedBox(
                                    height: 60,
                                    width: 60,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 5,
                                      strokeCap: StrokeCap.round,
                                      backgroundColor: theme.colorScheme.surfaceContainer,
                                      color: Colors.blue,
                                      value: viewModel.foodProgress.fat + 1 / viewModel.userData.waterGoal,
                                    ),
                                  ),
                                  Column(children: [Text('${viewModel.foodProgress.fat + 1}g', style: theme.textTheme.bodyMedium)]),
                                ],
                              );
                            },
                          ),
                          Text('Water', style: theme.textTheme.bodyMedium),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Consumer<HomeViewModel>(
                builder: (context, viewModel, child) {
                  if (viewModel.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  // if (viewModel.noRecords) {
                  //   return const Center(child: Text('No food records found'));
                  // }

                  return ListView.builder(
                    padding: const EdgeInsets.only(top: AppSpacing.sm, left: AppSpacing.sm, right: AppSpacing.sm, bottom: 120),
                    itemCount: 10,
                    itemBuilder: (context, index) => ListTile(title: Text('Item $index'), subtitle: Text('Subitem $index')),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            if (context.mounted) {
              final _ = await context.pushNamed(CreateRetryScreen.routeName);
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
