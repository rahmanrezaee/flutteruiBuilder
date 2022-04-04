import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_ui_builder/screens/widget_building_page.dart';

import '../core/source_code/syntax_highlighter.dart';
import '../core/source_code/widget_with_codeview.dart';

const String _markdownData = """
## Code blocks
Formatted Dart code looks really pretty too:
    ```
    void main() {
      runApp(MaterialApp(
        home: Scaffold(
          body: Markdown(data: markdownData),
        ),
      ));
    }
    ```
""";

class SourceCodePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SourceCodePageState();
}

class _SourceCodePageState extends State<SourceCodePage> {
  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();

    return Scaffold(
      body: WidgetWithCodeView(
        sourceFilePath: 'lib/screens/source_code.dart',
      
        showLabelText: true,
        syntaxHighlighterStyle:
            SyntaxHighlighterStyle.darkThemeStyle().copyWith(
          commentStyle: TextStyle(color: Colors.green[400]),
          keywordStyle: TextStyle(color: Color.fromARGB(255, 5, 128, 177)),
          classStyle: TextStyle(color: Color.fromARGB(255, 29, 25, 218)),
          baseStyle: TextStyle(color: Colors.black),
          constantStyle: TextStyle(color: Colors.black),
          punctuationStyle: TextStyle(color: Color.fromARGB(255, 194, 84, 11)),
          stringStyle: TextStyle(color: Colors.black),
          numberStyle: TextStyle(color: Color.fromARGB(255, 3, 219, 118)),
        ),
        child: Text(""),
      ),
    );
  }
}
