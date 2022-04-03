import 'package:flutter/material.dart';
import 'package:flutter_ui_builder/components/widgets/widget_tree/tree_node_data.dart';
import 'package:flutter_ui_builder/providers/code_gen_provider.dart';

import 'package:provider/provider.dart';
import '../utils/responsive.dart';
import 'widgets/widget_tree/tree_view.dart';

class WidgetTreeComponent extends StatelessWidget {
  WidgetTreeComponent({Key? key}) : super(key: key);

  TreeNodeComponentDataModel mapServerDataToTreeData(Map data) {
    return TreeNodeComponentDataModel(
      extra: data,
      title: data['text'],
      expaned: true,
      checked: true,
      children:
          List.from(data['children'].map((x) => mapServerDataToTreeData(x))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CodeGenProvider>(builder: (context, aut, child) {
      return FutureBuilder(
          future: aut.getTreeJson(),
          builder: (context, snapshot) {
            return Material(
              child: Container(
                height: getHeight(context),
                width: 330,
                child: snapshot.connectionState == ConnectionState.waiting
                    ? CircularProgressIndicator()
                    : TreeViewComponent(
                        data: List.generate(
                          1,
                          (index) =>
                              mapServerDataToTreeData(snapshot.data as Map),
                        ),
                        showActions: true,
                        showCheckBox: false,
                        onTap: (node) {
                          aut.setSelected(node.extra['id'], node.title);

                          print("selected widget ${aut.selectedWidget}");
                        },
                        onRemove: (node, parent) {
                          print(node.extra);
                          print(parent.extra);
                        },
                      ),
              ),
            );
          });
    });
  }
}
