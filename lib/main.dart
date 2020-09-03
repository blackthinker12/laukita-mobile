import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:Laukita/ui/pages/pages.dart';
import 'package:Laukita/bloc/blocs.dart';
import 'package:Laukita/shared/shared.dart';

void main() => runApp(MyApp());

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
      ],
      child: MaterialApp(
        title: 'Laukita',
        theme: appTheme(),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        routes: {
          '/onboarding': (_) => OnBoardingPage(),
          '/main': (_) => MainPage(),
          '/product_detail': (_) => ProductDetailPage(),
          '/scan': (_) => ScannerPage(),
          '/order_payment': (_) => OrderPaymentPage(),
          '/distribution_portal': (_) => DistributionPortalPage(),
          '/registration': (_) => RegistrationPage(isLoginWithSocialMedia: false),
          '/email_verification': (_) => EmailVerificationPage(),
          '/upgrade_account': (_) => UpgradeAccountPage(),
          '/shipment_form': (_) => ShipmentFormPage(),
          '/login': (_) => LoginPage(),
          '/shopping_cart': (_) => ShoppingCartPage(),
          '/transactions_page': (_) => TransactionsPage()
        },
      ),
    );
  }
}