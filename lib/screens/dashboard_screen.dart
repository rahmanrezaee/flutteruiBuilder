import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_ui_builder/components/component_list.dart';
import 'package:flutter_ui_builder/components/display_board.dart';
import 'package:flutter_ui_builder/components/property_list.dart';
import 'package:flutter_ui_builder/components/widget_tree.dart';
import 'package:flutter_ui_builder/theme.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<AppTheme>();
    return Container(
      child: Stack(
        fit: StackFit.expand,
        children: [
          DisplayBoard(),
          Positioned(left: 0, top: 0, child: ComponentList()),
          if (appTheme.showPropertySection)
            Positioned(right: 0, top: 0, child: WidgetTreeComponent())
        ],
      ),
    );
  }
}
