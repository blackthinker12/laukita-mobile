part of 'repositories.dart';

abstract class InstallationInfoRepositories {
  int count();
  void save(InstallationInformationModel value);
}

class InstallationInfoRepository implements InstallationInfoRepositories {
  Box isInstalledBox = Hive.box("installation");

  @override
  int count() {
    int count = isInstalledBox.length;
    return count;
  }
  
  @override
  void save(InstallationInformationModel value) {
    try {
      isInstalledBox.add(value);
    } catch (_) {}
  }
}