import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

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

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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