class TreeNodeComponentDataModel {
  String title;
  bool expaned;
  bool checked;
  dynamic extra;
  List<TreeNodeComponentDataModel> children;

  TreeNodeComponentDataModel({
    required this.title,
    required this.expaned,
    required this.checked,
    required this.children,
    this.extra,
  });
}
