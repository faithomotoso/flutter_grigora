import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_grigora/business_logic/view_models/AppViewModel.dart';
import 'package:flutter_grigora/utils/colors.dart';
import 'package:provider/provider.dart';

import 'ui/pages/homepage.dart';

void main(){
WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppViewModel(),
      child: MaterialApp(
        title: 'Grigora',
        theme: ThemeData(
          primarySwatch: AppColors.primarySwatch,
          fontFamily: "Raleway",
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
      ),
    );
  }
}
