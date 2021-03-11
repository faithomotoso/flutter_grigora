import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grigora/business_logic/view_models/AppDrawerState.dart';
import 'package:flutter_grigora/business_logic/view_models/AppViewModel.dart';
import 'package:flutter_grigora/utils/app_font_styles.dart';
import 'package:flutter_grigora/utils/colors.dart';
import 'package:flutter_grigora/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class AppDrawer extends StatefulWidget {
  Function(int selectedIndex) onDrawerItemSelected;

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  List<DrawerTile> tiles;

  @override
  Widget build(BuildContext context) {
    tiles = [
      DrawerTile(
        tileName: "Home",
        tileIcon: CupertinoIcons.home,
        selectedTileName: context.watch<AppDrawerState>().selectedTileName,
        onTileSelected: (tileName) {
          setState(() {
            context.read<AppDrawerState>().setTileName = tileName;
          });
        },
      ),
      DrawerTile(
        tileName: "About Grigora",
        tileIcon: Icons.info_outline,
        selectedTileName: context.watch<AppDrawerState>().selectedTileName,
        onTileSelected: (tileName) {
          setState(() {
            context.read<AppDrawerState>().setTileName = tileName;
          });
        },
      ),
      DrawerTile(
        tileName: "Help & Support",
        tileIcon: Icons.help_outline,
        selectedTileName: context.watch<AppDrawerState>().selectedTileName,
        onTileSelected: (tileName) {
          setState(() {
            context.read<AppDrawerState>().setTileName = tileName;
          });
        },
      ),
      DrawerTile(
        tileName: "Partner with us",
        tileIcon: Icons.business_center_outlined,
        selectedTileName: context.watch<AppDrawerState>().selectedTileName,
        onTileSelected: (tileName) {
          setState(() {
            context.read<AppDrawerState>().setTileName = tileName;
          });
        },
      ),
    ];

    return Drawer(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(alignment: Alignment.centerRight, child: CloseButton()),
              SizedBox(
                height: 20,
              ),
              DrawerTile(
                tileName: "Sign In / Sign Up",
                tileIcon: Icons.person_outline_outlined,
                iconColor: AppColors.yellow,
              ),
              Padding(
                padding: bodyPadding.copyWith(top: 0, bottom: 0),
                child: Divider(
                  color: Colors.grey,
                  height: 30,
                ),
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => SizedBox(
                  height: 10,
                ),
                itemCount: tiles.length,
                itemBuilder: (context, index) => tiles.elementAt(index),
              ),
              Padding(
                padding: bodyPadding.copyWith(top: 0, bottom: 0),
                child: Divider(
                  color: Colors.grey,
                  height: 30,
                ),
              ),
              DrawerTile(
                tileName: context.read<AppViewModel>().companyPhoneNumber,
                tileIcon: CupertinoIcons.phone,
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                onTileSelected: (_) async {
                  String url =
                      "tel:${context.read<AppViewModel>().companyPhoneNumber}";
                  if (await canLaunch(url)) launch(url);
                },
              ),
              SizedBox(
                height: 10,
              ),
              DrawerTile(
                tileName: context.read<AppViewModel>().companyEmail,
                tileIcon: Icons.mail_outline_rounded,
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                onTileSelected: (_) async {
                  String mailUrl =
                      "mailto:${context.read<AppViewModel>().companyEmail}";
                  if (await canLaunch(mailUrl)) launch(mailUrl);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerTile extends StatefulWidget {
  String selectedTileName;
  final String tileName;
  final IconData tileIcon;
  final Function(String tile) onTileSelected;
  final Color iconColor;
  final TextStyle textStyle;

  DrawerTile(
      {@required this.tileName,
      @required this.tileIcon,
      this.selectedTileName,
      this.onTileSelected,
      this.iconColor,
      this.textStyle});

  @override
  _DrawerTileState createState() => _DrawerTileState();
}

class _DrawerTileState extends State<DrawerTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        widget.onTileSelected?.call(widget.tileName);
      },
      leading: Icon(
        widget.tileIcon,
        color: widget.iconColor ??
            (widget.selectedTileName == widget.tileName
                ? AppColors.red
                : Colors.black),
      ),
      dense: true,
      title: Text(
        widget.tileName,
        style: widget.textStyle ?? AppFontStyles.headline6Bold(context),
      ),
    );
  }
}
