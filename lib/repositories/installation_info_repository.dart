part of 'repositories.dart';

abstract class InstallationInfoRepositories {
  int count();
  void save(InstallationInformationModel value);
}

class InstallationInfoRepository implements InstallationInfoRepositories {
  var isInstalledBox = Hive.box("installation");

  @override
  int count() {
    print("isInstalledBox.length");
    print(isInstalledBox.length);
    print(isInstalledBox);
    
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