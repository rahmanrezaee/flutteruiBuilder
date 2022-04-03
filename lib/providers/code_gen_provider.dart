import 'package:flutter/cupertino.dart';
import 'package:flutter_ui_builder/constants/widget_json.dart';
import 'package:uuid/uuid.dart';

class CodeGenProvider with ChangeNotifier {
  Map sourceCode = scaffoldAppBarJson;

  Uuid _uuid = Uuid();
  Map? selectedWidget;

  CodeGenProvider() {
    sourceCode["id"] = _uuid.v1();
    selectedWidget = sourceCode;
  }

  void setAppbar() {
    sourceCode['appBar'] = appBarJson;
    sourceCode['appBar']["id"] = _uuid.v1();
    notifyListeners();
  }

  void removeAppBar() {
    sourceCode['appBar'] = null;
    notifyListeners();
  }

  void setBody(childJson) {
    childJson["id"] = _uuid.v1();
    sourceCode['body'] = childJson;
    notifyListeners();
  }

  void setChild(String data) {
    print(selectedWidget.toString() + "new widget" + data.toString());

    if (selectedWidget!['type'] == "Scaffold") {
      selectedWidget!['body'] = getJsonWidget(data);
    }
    notifyListeners();
  }

  Map getJsonWidget(String data) {
    switch (data) {
      case "text":
        Map newChildJson = textJson;
        newChildJson["id"] = _uuid.v1();
        return textJson;
      case "button":
        Map newChildJson = elevatedButtonJson;
        newChildJson["id"] = _uuid.v1();
        return elevatedButtonJson;
      case "image":
        Map newChildJson = assetImageJson;
        newChildJson["id"] = _uuid.v1();
        return assetImageJson;
      case "column":
        Map newChildJson = columnJson;
        newChildJson["id"] = _uuid.v1();
        return columnJson;
      case "row":
        Map newChildJson = rowJson;
        newChildJson["id"] = _uuid.v1();
        return rowJson;
      case "container":
        Map newChildJson = containerJson;
        newChildJson["id"] = _uuid.v1();
        return containerJson;
      case "list":
        Map newChildJson = listviewJson;
        newChildJson["id"] = _uuid.v1();
        return listviewJson;
      default:
        return {};
    }
  }

  void setSelected(String? itemId, String? type) {
    // scaffold
    print("body true ${type}");
    if (type == "Scaffold") {
      selectedWidget = sourceCode;
    } else if (selectedWidget!.containsKey("body")) {
      if (selectedWidget!['body']["id"] == itemId) {
        print("body iditem true");
        selectedWidget = selectedWidget!['body'];
        selectedWidget!["isActive"] = true;
        print("body item $selectedWidget");
      }
    } else if (type == "Column" || type == "Row") {
      selectedWidget!['children'].forEach((ele) {
        if (selectedWidget!["id"] == itemId) {
          selectedWidget = ele;
          selectedWidget!["isActive"] = true;
        }
      });
    } else if (type == "Text" || type == "Row") {
      selectedWidget!['children'].forEach((ele) {
        if (selectedWidget!["id"] == itemId) {
          selectedWidget = ele;
          selectedWidget!["isActive"] = true;
        }
      });
    }
    // other widget
    else {}
    notifyListeners();
  }

  Future<Map> getTreeJson() async {
    Map tree = {
      "id": sourceCode["id"],
      "text": sourceCode['type'],
      "children": [...getChildernt(sourceCode["body"])],
    };
    print("child tree $tree");
    return tree;
  }

  List getChildernt(Map child) {
    if (child == null || child["type"] == null) {
      return [];
    } else if (child["type"] == "Column" || child["type"] == "Row") {
      print("childs Row or column $child");
      return [
        {
          "id": child["id"],
          "text": child["type"],
          "children": [
            ...List.generate(child["children"].length, (index) {
              print("object ${child["children"][index]}");
              return {
                "id": child["children"][index]["id"],
                "text": child["children"][index]["type"],
                "children": [...findChildInColumn(child["children"][index])],
              };
            })
          ],
        }
      ];
    } else {
      return [
        {
          "id": child["id"],
          "text": child["type"],
          "children": [
            if (child.containsKey("child")) ...getChildernt(child["child"])
          ],
        }
      ];
    }
  }

  List findChildInColumn(Map widgetsJson) {
    if (widgetsJson.containsKey("child")) {
      return getChildernt(widgetsJson['child']);
    } else if (widgetsJson.containsKey("children")) {
      return getChildernt(widgetsJson['children']);
    } else {
      return [];
    }
  }
}
