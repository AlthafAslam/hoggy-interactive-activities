
import 'dart:convert';

List<Example> exampleFromJson(String str) => List<Example>.from(json.decode(str).map((x) => Example.fromJson(x)));

String exampleToJson(List<Example> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Example {
  Example({
    required this.attrs,
    required this.children,
  });

  Attrs attrs;
  List<Child> children;

  factory Example.fromJson(Map<String, dynamic> json) => Example(
    attrs: Attrs.fromJson(json["attrs"]),
    children: List<Child>.from(json["children"].map((x) => Child.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "attrs": attrs.toJson(),
    "children": List<dynamic>.from(children.map((x) => x.toJson())),
  };
}

class Attrs {
  Attrs({
    required this.size,
    required this.backgroundColor,
    required this.lottieBackground,
  });

  Size size;
  BackgroundColor backgroundColor;
  LottieBackground lottieBackground;

  factory Attrs.fromJson(Map<String, dynamic> json) => Attrs(
    size: Size.fromJson(json["size"]),
    backgroundColor: BackgroundColor.fromJson(json["backgroundColor"]),
    lottieBackground: LottieBackground.fromJson(json["lottieBackground"]),
  );

  Map<String, dynamic> toJson() => {
    "size": size.toJson(),
    "backgroundColor": backgroundColor.toJson(),
    "lottieBackground": lottieBackground.toJson(),
  };
}

class BackgroundColor {
  BackgroundColor({
    required this.type,
    required this.breakPoints,
  });

  String type;
  List<BreakPoint> breakPoints;

  factory BackgroundColor.fromJson(Map<String, dynamic> json) => BackgroundColor(
    type: json["type"],
    breakPoints: List<BreakPoint>.from(json["breakPoints"].map((x) => BreakPoint.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "breakPoints": List<dynamic>.from(breakPoints.map((x) => x.toJson())),
  };
}

class BreakPoint {
  BreakPoint({
    required this.point,
    required this.color,
  });

  double point;
  String color;

  factory BreakPoint.fromJson(Map<String, dynamic> json) => BreakPoint(
    point: json["point"].toDouble(),
    color: json["color"],
  );

  Map<String, dynamic> toJson() => {
    "point": point,
    "color": color,
  };
}

class LottieBackground {
  LottieBackground({
    required this.url,
    required this.asset,
  });

  String url;
  String asset;

  factory LottieBackground.fromJson(Map<String, dynamic> json) => LottieBackground(
    url: json["url"],
    asset: json["asset"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "asset": asset,
  };
}

class Size {
  Size({
    required this.width,
    required this.height,
  });

  int width;
  int height;

  factory Size.fromJson(Map<String, dynamic> json) => Size(
    width: json["width"],
    height: json["height"],
  );

  Map<String, dynamic> toJson() => {
    "width": width,
    "height": height,
  };
}

class Child {
  Child({
    this.type,
    this.text,
    this.x,
    this.y,
    this.color,
    this.fontSize,
    this.bold,
    this.italic,
    this.src,
    this.height,
    this.width,
  });

  Type? type;
  String? text;
  int? x;
  int? y;
  String? color;
  int? fontSize;
  bool? bold;
  bool? italic;
  String? src;
  int? height;
  int? width;

  factory Child.fromJson(Map<String, dynamic> json) => Child(
    type: typeValues.map[json["type"]]!,
    text: json["text"] == null ? null : json["text"],
    x: json["x"],
    y: json["y"],
    color: json["color"] == null ? null : json["color"],
    fontSize: json["fontSize"] == null ? null : json["fontSize"],
    bold: json["bold"] == null ? null : json["bold"],
    italic: json["italic"] == null ? null : json["italic"],
    src: json["src"] == null ? null : json["src"],
    height: json["height"] == null ? null : json["height"],
    width: json["width"] == null ? null : json["width"],
  );

  Map<String, dynamic> toJson() => {
    "type": typeValues.reverse![type],
    "text": text,
    "x": x,
    "y": y,
    "color": color,
    "fontSize": fontSize,
    "bold": bold,
    "italic": italic,
    "src": src,
    "height": height,
    "width": width,
  };
}

enum Type { TEXT, IMAGE }

final typeValues = EnumValues({
  "image": Type.IMAGE,
  "text": Type.TEXT
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}