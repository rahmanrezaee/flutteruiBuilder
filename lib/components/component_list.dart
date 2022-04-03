import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as m;
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_ui_builder/providers/code_gen_provider.dart';
import 'package:flutter_ui_builder/utils/responsive.dart';
import 'package:provider/provider.dart';

class ComponentList extends StatefulWidget {
  const ComponentList({Key? key}) : super(key: key);

  @override
  State<ComponentList> createState() => _ComponentListState();
}

class _ComponentListState extends State<ComponentList>
    with SingleTickerProviderStateMixin {
  late m.TabController controllerTab;

  @override
  void initState() {
    controllerTab = m.TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _codeGenProvider = context.watch<CodeGenProvider>();

    return m.Material(
      child: Container(
        width: 300,
        color: Colors.grey[20],
        height: getHeight(context),
        child: Column(
          children: [
            m.TabBar(
                controller: controllerTab,
                onTap: (s) {
                  setState(() {});
                },
                tabs: [
                  Padding(
                      padding: const EdgeInsets.only(top: 12, bottom: 12),
                      child: Text('Widget',
                          style:
                              FluentTheme.of(context).typography.bodyStrong)),
                  Padding(
                      padding: const EdgeInsets.only(top: 12, bottom: 12),
                      child: Text(
                        'Component',
                        style: FluentTheme.of(context).typography.bodyStrong,
                      )),
                ]),
            controllerTab.index == 0
                ? StaggeredGrid.count(
                    crossAxisCount: 2,
                    children: [
                      Draggable<String>(
                        data: "appBar",
                        feedback: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.all(5),
                          child: Column(
                            children: [
                              const Icon(FluentIcons.close_pane_mirrored,
                                  size: 40),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: Text('AppBar',
                                    style: FluentTheme.of(context)
                                        .typography
                                        .bodyStrong),
                              ),
                            ],
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.all(5),
                          child: Column(
                            children: [
                              const Icon(FluentIcons.close_pane_mirrored,
                                  size: 40),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: Text('AppBar',
                                    style: FluentTheme.of(context)
                                        .typography
                                        .bodyStrong),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Draggable<String>(
                        data: "text",
                        feedback: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.all(5),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/text.png",
                                width: 40,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: Text('Text',
                                    style: FluentTheme.of(context)
                                        .typography
                                        .bodyStrong),
                              ),
                            ],
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.all(5),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/text.png",
                                width: 40,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: Text('Text',
                                    style: FluentTheme.of(context)
                                        .typography
                                        .bodyStrong),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Draggable<String>(
                        data: "button",
                        feedback: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.all(5),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/button.png",
                                width: 40,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: Text('Button',
                                    style: FluentTheme.of(context)
                                        .typography
                                        .bodyStrong),
                              ),
                            ],
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.all(5),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/button.png",
                                width: 40,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: Text('Button',
                                    style: FluentTheme.of(context)
                                        .typography
                                        .bodyStrong),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Draggable<String>(
                        data: "column",
                        feedback: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.all(5),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/column.png",
                                width: 40,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: Text('Column',
                                    style: FluentTheme.of(context)
                                        .typography
                                        .bodyStrong),
                              ),
                            ],
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.all(5),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/column.png",
                                width: 40,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: Text('Column',
                                    style: FluentTheme.of(context)
                                        .typography
                                        .bodyStrong),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Draggable<String>(
                        data: "row",
                        feedback: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.all(5),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/row.png",
                                width: 40,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: Text('Row',
                                    style: FluentTheme.of(context)
                                        .typography
                                        .bodyStrong),
                              ),
                            ],
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.all(5),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/row.png",
                                width: 40,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: Text('Row',
                                    style: FluentTheme.of(context)
                                        .typography
                                        .bodyStrong),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Draggable<String>(
                        data: "container",
                        feedback: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.all(5),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/container.png",
                                width: 40,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: Text('Container',
                                    style: FluentTheme.of(context)
                                        .typography
                                        .bodyStrong),
                              ),
                            ],
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.all(5),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/container.png",
                                width: 40,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: Text('Container',
                                    style: FluentTheme.of(context)
                                        .typography
                                        .bodyStrong),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Draggable<String>(
                        data: "image",
                        feedback: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.all(5),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/image.png",
                                width: 40,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: Text('Image',
                                    style: FluentTheme.of(context)
                                        .typography
                                        .bodyStrong),
                              ),
                            ],
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.all(5),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/image.png",
                                width: 40,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: Text('Image',
                                    style: FluentTheme.of(context)
                                        .typography
                                        .bodyStrong),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Draggable<String>(
                        data: "card",
                        feedback: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.all(5),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/card.png",
                                width: 40,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: Text('Card',
                                    style: FluentTheme.of(context)
                                        .typography
                                        .bodyStrong),
                              ),
                            ],
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.all(5),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/card.png",
                                width: 40,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: Text('Card',
                                    style: FluentTheme.of(context)
                                        .typography
                                        .bodyStrong),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Draggable<String>(
                        data: "list",
                        feedback: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.all(5),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/column.png",
                                width: 40,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: Text('List',
                                    style: FluentTheme.of(context)
                                        .typography
                                        .bodyStrong),
                              ),
                            ],
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.all(5),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/column.png",
                                width: 40,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: Text('List',
                                    style: FluentTheme.of(context)
                                        .typography
                                        .bodyStrong),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Draggable<String>(
                        data: "expanded",
                        feedback: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.all(5),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/expand.png",
                                width: 40,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: Text('Expandable',
                                    style: FluentTheme.of(context)
                                        .typography
                                        .bodyStrong),
                              ),
                            ],
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.all(5),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/expand.png",
                                width: 40,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: Text('Expandable',
                                    style: FluentTheme.of(context)
                                        .typography
                                        .bodyStrong),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Draggable<String>(
                        data: "spacer",
                        feedback: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.all(5),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/expand.png",
                                width: 40,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: Text('Spacer',
                                    style: FluentTheme.of(context)
                                        .typography
                                        .bodyStrong),
                              ),
                            ],
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.all(5),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/expand.png",
                                width: 40,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: Text('Spacer',
                                    style: FluentTheme.of(context)
                                        .typography
                                        .bodyStrong),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : const Expanded(
                    child: Center(
                      child: Text("no Component"),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
