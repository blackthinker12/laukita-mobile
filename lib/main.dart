import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:Laukita/ui/pages/pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'Laukita',
      theme: ThemeData(
        //primaryColor: Theme.of(context).primaryColor,
        primaryColor: Color(0xFFe8282e),
        primaryColorLight: Color(0xFFF05828),
        accentColor: Color(0xFFFE954E)
      ),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      routes: {
        '/product_detail': (_) => ProductDetailPage(),
        '/scan': (_) => ScannerPage(),
        '/order_payment': (_) => OrderPaymentPage(),
        '/referral': (_) => ReferralPage(),
        '/distribution_portal': (_) => DistributionPortalPage(),
        '/registration': (_) => RegistrationPage(isLoginWithSocialMedia: false),
        '/email_verification': (_) => EmailVerificationPage(),
        '/upgrade_account': (_) => UpgradeAccountPage(),
        '/table': (_) => TableExample(),
        '/shipment_form': (_) => ShipmentFormPage(),
        '/login': (_) => LoginPage()
      },
    );
  }
}