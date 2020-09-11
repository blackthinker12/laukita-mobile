import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:Laukita/ui/pages/pages.dart';
import 'package:Laukita/bloc/blocs.dart';
import 'package:Laukita/shared/shared.dart';
import 'package:Laukita/repositories/repositories.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build();

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
        BlocProvider(create: (_) => TokenBloc(TokenRepository())..add(GetToken())),
        BlocProvider(create: (_) => ProductBloc(ProductRepository())),
        BlocProvider(create: (_) => CartBloc(CartRepository()))
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