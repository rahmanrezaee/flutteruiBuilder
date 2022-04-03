import 'package:flutter/material.dart';
import 'package:flutter_ui_builder/theme.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:device_preview/device_preview.dart';

import '../screens/design_screen.dart';

class DisplayBoard extends StatefulWidget {
  const DisplayBoard({Key? key}) : super(key: key);

  @override
  State<DisplayBoard> createState() => _DisplayBoardState();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: DesignPage(),
    );
  }
}

class _DisplayBoardState extends State<DisplayBoard> {
  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<AppTheme>();

    return Container(
      color: Colors.amber,
      margin:const EdgeInsets.only(right: 0, left: 300),
      child: DevicePreview(
        isToolbarVisible: !appTheme.showPropertySection,
        defaultDevice: Devices.ios.iPhoneSE,
        data: DevicePreviewData(
          deviceIdentifier: Devices.ios.iPad.toString(),
          isFrameVisible: false,
          locale: 'fr_FR',
        ),
        enabled: true,
        devices: [...Devices.ios.all, ...Devices.android.all],
        builder: (context) => MyApp(), // Wrap your app
      ),
    );
  }
}
