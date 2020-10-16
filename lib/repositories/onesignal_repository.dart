part of 'repositories.dart';

abstract class OnesignalRepositories {
  Future<AddDeviceOnesignalModel> addDevice(String appId, {
    String deviceType,
    String languange,
    int timezone,
    String deviceModel,
    String deviceOS,
    String adId,
    Map tags,
    int createdAt,
    int notificationTypes,
    String externalUserId,
    String gameVersion,
    int testType
  });

  Future<void> sendNotification(
    Map contents,
    Map headings
  );

  //Future<void> initPlatformState();

  Future<void> postNotification1();
}

class OnesignalRepository implements OnesignalRepositories {
  @override
  Future<AddDeviceOnesignalModel> addDevice(String appId, {
    String deviceType,
    String languange,
    int timezone,
    String deviceModel,
    String deviceOS,
    String adId,
    Map tags,
    int createdAt,
    int notificationTypes,
    String externalUserId,
    String gameVersion,
    int testType
  }) async {
    String url = '$onesignalUrl/players';

    Map<String, String> requestHeaders = {
      "Authorization": "Basic Y2RlZDc4MjQtZGM3NS00NmViLTk4MWYtOTc2YWQ4YThkNjcz", 
      "Content-Type": "application/json"
    };
    
    var response = await http.post(url, body: jsonEncode({
      "app_id": appId,
      "identifier": getRandomString(91),
      "device_type": 1,
      "language": languange,
      "timezone": timezone,
      "device_model": deviceModel,
      "device_os": deviceOS,
      "ad_id": adId,
      "tags": tags,
      "created_at": getCurrentTimeStamp(),
      "notification_types": 1,
      "external_user_id": externalUserId,
      "test_type": 1,
      "game_version": gameVersion
    }),
      headers: requestHeaders
    );
    
    AddDeviceOnesignalModel result = AddDeviceOnesignalModel.addDeviceOnesignalModelFromJson(response.body);
    return result;
  }

  @override
  Future<void> sendNotification(
    Map contents,
    Map headings
  ) async {
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
    var settings = {
      OSiOSSettings.autoPrompt: false,
      OSiOSSettings.promptBeforeOpeningPushUrl: true
    };

    await OneSignal.shared.init(onesignalKey, iOSSettings: settings);

    var status = await OneSignal.shared.getPermissionSubscriptionState();

    if (!status.permissionStatus.hasPrompted) {
      await OneSignal.shared.promptUserForPushNotificationPermission();
      var playerId = status.subscriptionStatus.userId;
      var response = await OneSignal.shared.postNotificationWithJson({
        "include_player_ids" : [playerId],
        "contents": contents,
        "headings": headings
      });

      print(json.encode(response));
    }
    else {
      var playerId = status.subscriptionStatus.userId;
      var response = await OneSignal.shared.postNotificationWithJson({
        "include_player_ids" : [playerId],
        "contents": contents,
        "headings": headings
      });

      print(json.encode(response));
    }
  }

  // @override
  // Future<void> initPlatformState() async {
  //   OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
  //   var settings = {
  //     OSiOSSettings.autoPrompt: true,
  //     OSiOSSettings.promptBeforeOpeningPushUrl: true
  //   };

  //   await OneSignal.shared.init(onesignalKey, iOSSettings: settings);

  //   var myCustomUniqueUserId = "user-account-id-1";

  //   OneSignal.shared.setExternalUserId(myCustomUniqueUserId);
  // }

  @override
  Future<void> postNotification1() async {
    String url = '$onesignalUrl/notifications';

    Map<String, String> requestHeaders = {
      "Authorization": "Basic Y2RlZDc4MjQtZGM3NS00NmViLTk4MWYtOTc2YWQ4YThkNjcz", 
      "Content-Type": "application/json"
    };
    
    var response = await http.post(url, body: jsonEncode({
      "app_id": onesignalKey,
      "contents": {"en": "English Message", "id": "Pesan Bahasa Indonesia"},
      "headings": {"en": "English Title", "id": "Judul Bahasa Indonesia"},
      "include_player_ids": ["c022cf61-58bc-457b-bc5e-c47c5b0cf302"]
    }),
      headers: requestHeaders
    );
    
    print(response.body);
  }
}