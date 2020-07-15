import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:package_info/package_info.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:spacex_flights/service_locator.dart';
import 'package:spacex_flights/src/helpers/url_helper.dart';
import 'package:spacex_flights/src/ui/common/connected_widget.dart';
import 'package:theme_mode_handler/theme_mode_handler.dart';
import 'package:theme_mode_handler/theme_picker_dialog.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool lockInBackground = true;
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    PackageInfo packageInfo = null;
    getIt
        .isReady<PackageInfo>()
        .whenComplete(() => packageInfo = getIt.get<PackageInfo>());

    var themeMode = ThemeModeHandler.of(context).themeMode;

    final List<Widget> aboutBoxChildren = <Widget>[
      SizedBox(
        height: 20,
      ),
      GestureDetector(
        onTap: () {
          launchURL('https://github.com/bvdwalt/spacex_flights');
        },
        child: Text(
          'GitHub Repository',
          textAlign: TextAlign.left,
          style: TextStyle(color: Colors.blue),
        ),
      ),
      GestureDetector(
        onTap: () {
          launchURL('https://www.patreon.com/SpaceXFlights');
        },
        child: Text(
          'Patreon',
          textAlign: TextAlign.left,
          style: TextStyle(color: Colors.blue),
        ),
      )
    ];

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            buildSliverAppBar(),
          ];
        },
        body: SettingsList(
          sections: [
            SettingsSection(
              title: 'Appearance',
              tiles: [
                SettingsTile(
                  title: 'Theme',
                  leading: Icon(themeMode == ThemeMode.system
                      ? Icons.brightness_auto
                      : themeMode == ThemeMode.dark
                          ? Icons.brightness_low
                          : Icons.brightness_high),
                  onTap: () async {
                    await showThemePickerDialog(context: context);
                  },
                ),
              ],
            ),
            SettingsSection(
              title: 'Information',
              tiles: [
                SettingsTile(
                  title: 'Internet Connectivity',
                  leading: getConnectedWidget(),
                ),
                SettingsTile(
                    title:
                        'All dates & times are shown in the devices\' locale',
                    leading: Icon(Icons.access_time)),
                SettingsTile(
                    title: 'About',
                    leading: Icon(Icons.info),
                    onTap: () => showAboutDialog(
                          context: context,
                          applicationIcon: Icon(
                            Icons.apps,
                            size: 65,
                            color: Theme.of(context).accentColor,
                          ),
                          applicationName: packageInfo.appName,
                          applicationVersion: packageInfo.version +
                              '+' +
                              packageInfo.buildNumber,
                          applicationLegalese: '© 2020 Bennie van der Walt',
                          children: aboutBoxChildren,
                        )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  SliverAppBar buildSliverAppBar() {
    return SliverAppBar(
        expandedHeight: 50.0,
        floating: true,
        pinned: false,
        elevation: 0.0,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Text('Settings'),
        ));
  }
}
