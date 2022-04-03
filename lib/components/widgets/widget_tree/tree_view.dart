import 'package:cross_scroll/cross_scroll.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_builder/utils/responsive.dart';

import './tree_node.dart';
import './tree_node_data.dart';

class TreeViewComponent extends StatefulWidget {
  final List<TreeNodeComponentDataModel> data;

  final bool lazy;
  final Widget icon;
  final double offsetLeft;
  final bool showFilter;
  final bool showActions;
  final bool showCheckBox;

  final Function(TreeNodeComponentDataModel node)? onTap;
  final void Function(TreeNodeComponentDataModel node)? onLoad;
  final void Function(TreeNodeComponentDataModel node)? onExpand;
  final void Function(TreeNodeComponentDataModel node)? onCollapse;
  final void Function(bool checked, TreeNodeComponentDataModel node)? onCheck;
  final void Function(
          TreeNodeComponentDataModel node, TreeNodeComponentDataModel parent)?
      onAppend;
  final void Function(
          TreeNodeComponentDataModel node, TreeNodeComponentDataModel parent)?
      onRemove;

  final TreeNodeComponentDataModel Function(TreeNodeComponentDataModel parent)?
      append;
  final Future<List<TreeNodeComponentDataModel>> Function(
      TreeNodeComponentDataModel parent)? load;

  const TreeViewComponent({
    Key? key,
    required this.data,
    this.onTap,
    this.onCheck,
    this.onLoad,
    this.onExpand,
    this.onCollapse,
    this.onAppend,
    this.onRemove,
    this.append,
    this.load,
    this.lazy = false,
    this.offsetLeft = 24.0,
    this.showFilter = false,
    this.showActions = false,
    this.showCheckBox = false,
    this.icon = const Icon(Icons.expand_more, size: 16.0),
  }) : super(key: key);

  @override
  State<TreeViewComponent> createState() => _TreeViewComponentState();
}

class _TreeViewComponentState extends State<TreeViewComponent> {
  late TreeNodeComponentDataModel _root;
  List<TreeNodeComponentDataModel> _renderList = [];

  List<TreeNodeComponentDataModel> _filter(
      String val, List<TreeNodeComponentDataModel> list) {
    List<TreeNodeComponentDataModel> temp = [];
    for (int i = 0; i < list.length; i++) {
      if (list[i].title.contains(val)) {
        temp.add(list[i]);
      }
      if (list[i].children.isNotEmpty) {
        list[i].children = _filter(val, list[i].children);
      }
    }
    return temp;
  }

  void _onChange(String val) {
    if (val.isNotEmpty) {
      _renderList = _filter(val, _renderList);
    } else {
      _renderList = widget.data;
    }
    setState(() {});
  }

  void append(TreeNodeComponentDataModel parent) {
    parent.children.add(widget.append!(parent));
    setState(() {});
  }

  void _remove(
      TreeNodeComponentDataModel node, List<TreeNodeComponentDataModel> list) {
    for (int i = 0; i < list.length; i++) {
      if (node == list[i]) {
        list.removeAt(i);
      } else {
        _remove(node, list[i].children);
      }
    }
  }

  void remove(TreeNodeComponentDataModel node) {
    _remove(node, _renderList);
    setState(() {});
  }

  Future<bool> load(TreeNodeComponentDataModel node) async {
    try {
      final data = await widget.load!(node);
      node.children = data;
      setState(() {});
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    _renderList = widget.data;
    _root = TreeNodeComponentDataModel(
      title: '',
      extra: null,
      checked: false,
      expaned: false,
      children: _renderList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CrossScroll(
        child: SizedBox(
      height: getHeight(context) - 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ...List.generate(
            _renderList.length,
            (int index) {
              return TreeNodeComponent(
                load: load,
                remove: remove,
                append: append,
                parent: _root,
                data: _renderList[index],
                icon: widget.icon,
                lazy: widget.lazy,
                offsetLeft: widget.offsetLeft,
                showCheckBox: widget.showCheckBox,
                showActions: widget.showActions,
                onTap: widget.onTap ?? (n) {},
                onLoad: widget.onLoad ?? (n) {},
                onCheck: widget.onCheck ?? (b, n) {},
                onExpand: widget.onExpand ?? (n) {},
                onRemove: widget.onRemove ?? (n, p) {},
                onAppend: widget.onAppend ?? (n, p) {},
                onCollapse: widget.onCollapse ?? (n) {},
              );
            },
          )
        ],
      ),
    ));
  }
}
