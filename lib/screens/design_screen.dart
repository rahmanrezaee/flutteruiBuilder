import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_ui_builder/constants/widget_json.dart';
import 'package:flutter_ui_builder/providers/code_gen_provider.dart';
import 'package:flutter_ui_builder/screens/widget_building_page.dart';
import 'package:provider/provider.dart';

import '../core/dynamic_widget.dart';
import '../core/dynamic_widget/basic/dynamic_widget_json_exportor.dart';

// ignore: must_be_immutable
class DesignPage extends StatelessWidget {
  late DynamicWidgetJsonExportor? _exportor;

  @override
  Widget build(BuildContext context) {
    return Consumer<CodeGenProvider>(builder: (context, _codeGenProvider, __) {
      return FutureBuilder<Widget?>(
        future: _buildWidget(context, _codeGenProvider),
        builder: (BuildContext context, AsyncSnapshot<Widget?> snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }
          return DragTarget<String>(onWillAccept: (data) {
            print("data $data");
            return true;
          }, onAccept: (data) {
            if (data == "appBar") {
              _codeGenProvider.setAppbar();
            } else {
              _codeGenProvider.setChild(data);
            }
          }, builder: (BuildContext context, List<String?> candidateData,
              List rejectedData) {
            return snapshot.hasData
                ? CustomePage(
                    child: snapshot.data!,
                  )
                : Text("Loading...");
          });
        },
      );
    });
  }

  Future<Widget?> _buildWidget(
      BuildContext context, CodeGenProvider codeGen) async {
    return DynamicWidgetBuilder.build(
        jsonEncode(codeGen.sourceCode), context, DefaultClickListener(context));
  }
}

class DefaultClickListener implements ClickListener {
  CodeGenProvider? _codeGenProvider;
  DefaultClickListener(BuildContext context) {
    _codeGenProvider = Provider.of<CodeGenProvider>(context, listen: false);
  }

  @override
  void onClicked(String? event, {String? itemId, String? type}) {
    print("selected${event == "selected"}");
    // if (event == "selected") {
    //   _codeGenProvider!.setSelected(itemId, type);
    // }
  }
}
