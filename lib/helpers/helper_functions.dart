import 'package:flutter/material.dart';
import 'package:flutter_interactions/models/example_res.dart';

class HelperFunctions {
  ///Accepts sting values and returns Color
  static Color returnColorFromString(String colorCode) {
    var hexColor = colorCode.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    } else {
      return const Color(0xffffff);
    }
  }

  static List<Color> colorFromBreakPoints(List<BreakPoint> breakPointList) {
    List<Color> hexColorArray = [];
    breakPointList.forEach((element) {
      Color hexColor = HelperFunctions.returnColorFromString(element.color);
      hexColorArray.add(hexColor);
    });
    print("HexColorArray $hexColorArray");
    return hexColorArray;
  }

  static List<double> stopListFromBreakPoint(List<BreakPoint> breakPointList) {
    List<double> stopListArray = [];
    breakPointList.forEach((element) {
      stopListArray.add(element.point);
    });
    print("stopListArray $stopListArray");
    return stopListArray;
  }

  static List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

  /// Convert "rgba(255, 255, 255, 1)" strings into Color
  static Color returnColorFromRGBO(String colorString) {
    String colors = colorString.replaceAll(RegExp(r'[^0-9,]'), '');
    List<String> grboStringList = colors.split(',');
    List<int> grboIntList = grboStringList.map(int.parse).toList();
    return Color.fromRGBO(grboIntList[0], grboIntList[1], grboIntList[2], grboIntList[3].toDouble());
  }
}
