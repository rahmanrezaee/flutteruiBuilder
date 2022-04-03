import 'package:flutter/material.dart';
import 'package:flutter_ui_builder/theme.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:device_preview/device_preview.dart';

import '../core/dynamic_widget/basic/dynamic_widget_json_exportor.dart';
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
  GlobalKey key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<AppTheme>();

    // return Scaffold(
    //   appBar: AppBar(
    //     // Here we take the value from the MyHomePage object that was created by
    //     // the App.build method, and use it to set our appbar title.
    //     title: Text("export example"),
    //   ),
    //   body: Builder(
    //     builder: (context) => Column(
    //       children: [
    //         RaisedButton(
    //           child: Text("Export"),
    //           onPressed: () {
    //             var exportor = key.currentWidget as DynamicWidgetJsonExportor;
    //             var exportJsonString = exportor.exportJsonString();

    //             print("export  Json $exportJsonString");
    //             Scaffold.of(context).showSnackBar(SnackBar(
    //                 content: Text("json string was exported to editor page.")));
    //           },
    //         ),
    //         Expanded(
    //           child: DynamicWidgetJsonExportor(
    //               key: key,
    //               child: Scaffold(
    //                 appBar: AppBar(
    //                   backgroundColor: Color(0xFF1A1F24),
    //                   automaticallyImplyLeading: false,
    //                   title: Text(
    //                     'Welcome',
    //                     style: TextStyle(
    //                       fontFamily: 'Outfit',
    //                       color: Colors.white,
    //                       fontSize: 32,
    //                       fontWeight: FontWeight.w500,
    //                     ),
    //                   ),
    //                   actions: [],
    //                   centerTitle: false,
    //                   elevation: 0,
    //                 ),
    //                 backgroundColor: Color(0xFF1A1F24),
    //                 body: Column(
    //                   mainAxisSize: MainAxisSize.max,
    //                   children: [
    //                     Expanded(
    //                       child: Container(
    //                         height: 500,
    //                         child: Padding(
    //                           padding: EdgeInsets.all(50),
    //                           child: Column(
    //                             mainAxisSize: MainAxisSize.max,
    //                             mainAxisAlignment: MainAxisAlignment.center,
    //                             children: [
    //                               Image.asset(
    //                                 'assets/images/login.png',
    //                                 width: 300,
    //                                 height: 300,
    //                                 fit: BoxFit.cover,
    //                               ),
    //                               Padding(
    //                                 padding: EdgeInsets.all(16),
    //                                 child: Row(
    //                                   mainAxisSize: MainAxisSize.max,
    //                                   children: [
    //                                     Text(
    //                                       'Header One',
    //                                       style: TextStyle(
    //                                         fontFamily: 'Outfit',
    //                                         color: Colors.white,
    //                                         fontSize: 24,
    //                                         fontWeight: FontWeight.w500,
    //                                       ),
    //                                     ),
    //                                   ],
    //                                 ),
    //                               ),
    //                               Padding(
    //                                 padding: EdgeInsets.all(16),
    //                                 child: Row(
    //                                   mainAxisSize: MainAxisSize.max,
    //                                   children: [
    //                                     Expanded(
    //                                       child: Text(
    //                                         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
    //                                         style: TextStyle(
    //                                           fontFamily: 'Outfit',
    //                                           color: Color(0xFF95A1AC),
    //                                           fontSize: 14,
    //                                           fontWeight: FontWeight.normal,
    //                                         ),
    //                                       ),
    //                                     ),
    //                                   ],
    //                                 ),
    //                               ),
    //                             ],
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                     Padding(
    //                       padding: EdgeInsets.all(10),
    //                       child: ElevatedButton(
    //                         onPressed: () {},
    //                         child: Text(
    //                           'Login',
    //                           style: TextStyle(
    //                             fontFamily: 'Outfit',
    //                             color: Colors.white,
    //                             fontSize: 16,
    //                             fontWeight: FontWeight.normal,
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                     Padding(
    //                       padding: EdgeInsets.all(10),
    //                       child: ElevatedButton(
    //                         onPressed: () {},
    //                         child: Text(
    //                           'Register',
    //                           style: TextStyle(
    //                             fontFamily: 'Outfit',
    //                             color: Colors.white,
    //                             fontSize: 16,
    //                             fontWeight: FontWeight.normal,
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               )),
    //         ),
    //       ],
    //     ),
    //   ),
    // );

    return Container(
      color: Colors.amber,
      margin: const EdgeInsets.only(right: 0, left: 300),
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
