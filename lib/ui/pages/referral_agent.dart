part of 'pages.dart';

class ReferralAgent extends StatefulWidget {

  @override
  _ReferralAgentState createState() => _ReferralAgentState();
}

class _ReferralAgentState extends State<ReferralAgent> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: Container(
        color: Colors.green,
      ) 
    );
  }
}