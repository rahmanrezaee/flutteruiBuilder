import 'package:flutter/material.dart';
import 'tree_node_data.dart';

class TreeNodeComponent extends StatefulWidget {
  final TreeNodeComponentDataModel data;
  final TreeNodeComponentDataModel parent;

  final bool lazy;
  final Widget icon;
  final bool showCheckBox;
  final bool showActions;
  final double offsetLeft;

  final Function(TreeNodeComponentDataModel node) onTap;
  final void Function(bool checked, TreeNodeComponentDataModel node) onCheck;

  final void Function(TreeNodeComponentDataModel node) onExpand;
  final void Function(TreeNodeComponentDataModel node) onCollapse;

  final Future Function(TreeNodeComponentDataModel node) load;
  final void Function(TreeNodeComponentDataModel node) onLoad;

  final void Function(TreeNodeComponentDataModel node) remove;
  final void Function(
          TreeNodeComponentDataModel node, TreeNodeComponentDataModel parent)
      onRemove;

  final void Function(TreeNodeComponentDataModel node) append;
  final void Function(
          TreeNodeComponentDataModel node, TreeNodeComponentDataModel parent)
      onAppend;

  const TreeNodeComponent({
    Key? key,
    required this.data,
    required this.parent,
    required this.offsetLeft,
    required this.showCheckBox,
    required this.showActions,
    required this.icon,
    required this.lazy,
    required this.load,
    required this.append,
    required this.remove,
    required this.onTap,
    required this.onCheck,
    required this.onLoad,
    required this.onExpand,
    required this.onAppend,
    required this.onRemove,
    required this.onCollapse,
  }) : super(key: key);

  @override
  _TreeNodeComponentState createState() => _TreeNodeComponentState();
}

class _TreeNodeComponentState extends State<TreeNodeComponent>
    with SingleTickerProviderStateMixin {
  bool _isExpaned = false;
  bool _isChecked = false;
  bool _showLoading = false;
  Color _bgColor = Colors.transparent;
  late AnimationController _rotationController;
  final Tween<double> _turnsTween = Tween<double>(begin: -0.25, end: 0.0);

  List<TreeNodeComponent> _geneTreeNodeComponents(List list) {
    return List.generate(list.length, (int index) {
      return TreeNodeComponent(
        data: list[index],
        parent: widget.data,
        remove: widget.remove,
        append: widget.append,
        icon: widget.icon,
        lazy: widget.lazy,
        load: widget.load,
        offsetLeft: widget.offsetLeft,
        showCheckBox: widget.showCheckBox,
        showActions: widget.showActions,
        onTap: widget.onTap,
        onCheck: widget.onCheck,
        onExpand: widget.onExpand,
        onLoad: widget.onLoad,
        onCollapse: widget.onCollapse,
        onRemove: widget.onRemove,
        onAppend: widget.onAppend,
      );
    });
  }

  @override
  initState() {
    super.initState();
    _isExpaned = widget.data.expaned;
    _isChecked = widget.data.checked;
    _rotationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          widget.onExpand(widget.data);
        } else if (status == AnimationStatus.reverse) {
          widget.onCollapse(widget.data);
        }
      });
    if (_isExpaned) {
      _rotationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        MouseRegion(
          onHover: (event) {},
          onEnter: (event) {
            _bgColor = Colors.grey[200]!;
            setState(() {});
          },
          onExit: (event) {
            _bgColor = Colors.transparent;
            setState(() {});
          },
          child: Container(
            color: Colors.white,
            margin: const EdgeInsets.only(bottom: 2.0),
            padding: const EdgeInsets.only(right: 12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                RotationTransition(
                  child: IconButton(
                    iconSize: 16,
                    icon: widget.icon,
                    onPressed: () {
                      if (widget.lazy && widget.data.children.isEmpty) {
                        setState(() {
                          _showLoading = true;
                        });
                        widget.load(widget.data).then((value) {
                          if (value) {
                            _isExpaned = true;
                            _rotationController.forward();
                            widget.onLoad(widget.data);
                          }
                          _showLoading = false;
                          setState(() {});
                        });
                      } else {
                        _isExpaned = !_isExpaned;
                        if (_isExpaned) {
                          _rotationController.forward();
                        } else {
                          _rotationController.reverse();
                        }
                        setState(() {});
                      }
                    },
                  ),
                  turns: _turnsTween.animate(_rotationController),
                ),
                InkWell(
                  onTap: () {
                    widget.onTap(widget.data);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: Text(
                      widget.data.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                if (widget.showActions)
                  TextButton(
                    onPressed: () {
                      // widget.remove(widget.data);
                      widget.onRemove(widget.data, widget.parent);
                    },
                    child: const Icon(
                      Icons.delete,
                      size: 14,
                      color: Colors.grey,
                    ),
                  ),
              ],
            ),
          ),
        ),
        SizeTransition(
          sizeFactor: _rotationController,
          child: Padding(
            padding: EdgeInsets.only(left: widget.offsetLeft),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: _geneTreeNodeComponents(widget.data.children)),
          ),
        )
      ],
    );
  }
}
