import 'package:tea_challenge/app/storage/app_local_secure_storage.dart';

abstract class EntriesSeedLocalDataSource {
  Future<bool> isInitialized();
  Future<void> markInitialized();
  Future<void> reset();
}

class EntriesSeedLocalDataSourceImpl implements EntriesSeedLocalDataSource {
  EntriesSeedLocalDataSourceImpl({required this.localStorage});

  final AppLocalStorage localStorage;

  @override
  Future<bool> isInitialized() async {
    final value = await localStorage.read(LocalStorageKey.seedDataInitialized);
    return bool.tryParse(value ?? 'false') ?? false;
  }

  @override
  Future<void> markInitialized() async {
    await localStorage.write(LocalStorageKey.seedDataInitialized, 'true');
  }

  @override
  Future<void> reset() async {
    await localStorage.delete(LocalStorageKey.seedDataInitialized);
  }
}
