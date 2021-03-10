import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ApplicationBar extends AppBar {

  ApplicationBar() : super(
    leading: Padding(
      padding: const EdgeInsets.all(4.0),
      child: SvgPicture.asset("assets/images/grigora_logo.svg"),
    ),
    title: Text("Grigora"),
    centerTitle: true,
    backgroundColor: Colors.white
  );
}
