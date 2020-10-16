import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:onesignal_flutter/onesignal_flutter.dart';

import 'package:Laukita/ui/pages/pages.dart';
import 'package:Laukita/bloc/blocs.dart';
import 'package:Laukita/shared/shared.dart';
import 'package:Laukita/repositories/repositories.dart';
import 'models/models.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var appDocumentDirectory = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(TokenModelAdapter());
  Hive.registerAdapter(ResultTokenModelAdapter());
  Hive.registerAdapter(DataProductModelAdapter());
  Hive.registerAdapter(CartModelAdapter());
  Hive.registerAdapter(InstallationInformationModelAdapter());
  await Hive.openBox("token");
  await Hive.openBox("installation");
  await Hive.openBox("cart");
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _requireConsent = true;

  @override
  void initState() {
    super.initState();
    initPlatformState();
    Future.delayed(const Duration(seconds: 20), () {
      _handleSendNotification();
    });
  }

  Future<void> initPlatformState() async {
    if (!mounted) return;
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

    OneSignal.shared.setRequiresUserPrivacyConsent(_requireConsent);

    var settings = {
      OSiOSSettings.autoPrompt: false,
      OSiOSSettings.promptBeforeOpeningPushUrl: true
    };

    OneSignal.shared.setNotificationReceivedHandler((OSNotification notification) {
      //print("Received notification: \n${notification.jsonRepresentation().replaceAll("\\n", "\n")}");
    });

    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      //print("Opened notification: \n${result.notification.jsonRepresentation().replaceAll("\\n", "\n")}");
    });

    OneSignal.shared
        .setSubscriptionObserver((OSSubscriptionStateChanges changes) {
      print("SUBSCRIPTION STATE CHANGED: ${changes.jsonRepresentation()}");
    });

    OneSignal.shared.setPermissionObserver((OSPermissionStateChanges changes) {
      print("PERMISSION STATE CHANGED: ${changes.jsonRepresentation()}");
    });

    await OneSignal.shared.init(onesignalKey, iOSSettings: settings);

    OneSignal.shared
        .setInFocusDisplayType(OSNotificationDisplayType.notification);

    await OneSignal.shared.requiresUserPrivacyConsent();

    var myCustomUniqueUserId = "user-account-1";

    OneSignal.shared.setExternalUserId(myCustomUniqueUserId);
  }

  void _handleSendNotification() async {
    var status = await OneSignal.shared.getPermissionSubscriptionState();

    var playerId = status.subscriptionStatus.userId;

    var imgUrlString =
        "http://cdn1-www.dogtime.com/assets/uploads/gallery/30-impossibly-cute-puppies/impossibly-cute-puppy-2.jpg";

    var notification = OSCreateNotification(
        playerIds: [playerId],
        content: "this is a test from OneSignal's Flutter SDK",
        heading: "Test Notification",
        iosAttachments: {"id1": imgUrlString},
        bigPicture: imgUrlString,
        buttons: [
          OSActionButton(text: "test1", id: "id1"),
          OSActionButton(text: "test2", id: "id2")
        ]);

    await OneSignal.shared.postNotification(notification);
  }

  @override
  Widget build(BuildContext context) {
    
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PageBloc()),
        BlocProvider(create: (_) => TokenBloc(TokenRepository())),
        BlocProvider(create: (_) => ProductBloc(ProductRepository())),
      ],
      child: MaterialApp(
        title: 'Laukita',
        theme: appTheme(),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        routes: {
          OnBoardingPage.routeName: (context) => OnBoardingPage(),
          MainPage.routeName: (context) => MainPage(),
          ProductDetailPage.routeName: (context) => ProductDetailPage(),
          ShoppingCartPage.routeName: (context) => ShoppingCartPage(),
          '/scan': (_) => ScannerPage(),
          '/order_payment': (_) => OrderPaymentPage(),
          '/distribution_portal': (_) => DistributionPortalPage(),
          '/registration': (_) => RegistrationPage(isLoginWithSocialMedia: false),
          '/email_verification': (_) => EmailVerificationPage(),
          '/upgrade_account': (_) => UpgradeAccountPage(),
          '/shipment_form': (_) => ShipmentFormPage(),
          '/login': (_) => LoginPage(),
          '/transactions_page': (_) => TransactionsPage()
        },
      ),
    );
  }
}