import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_interactions/helpers/helper_functions.dart';
import 'package:flutter_interactions/models/example_res.dart';
import 'package:lottie/lottie.dart';

class InteractionWidget extends StatefulWidget {
  final double containerHeight;
  final double containerWidth;
  final List<Color> colorList;
  final List<double> stopList;
  final String lottieUrl;
  final List<Child> childWidgets;

  const InteractionWidget({
    Key? key,
    required this.containerHeight,
    required this.containerWidth,
    required this.colorList,
    required this.stopList,
    required this.lottieUrl,
    required this.childWidgets,
  }) : super(key: key);

  @override
  _InteractionWidgetState createState() => _InteractionWidgetState();
}

class _InteractionWidgetState extends State<InteractionWidget> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      // transitionBuilder: (Widget child, Animation<double> animation) {
      //   return ScaleTransition(scale: animation, child: child);
      // },
      duration: const Duration(milliseconds: 500),
      child: AspectRatio(
        aspectRatio: widget.containerWidth / widget.containerHeight,
        child: Container(
          decoration: BoxDecoration(gradient: LinearGradient(colors: widget.colorList, stops: widget.stopList)),
          child: Stack(
            fit: StackFit.expand,
            children: HelperFunctions.map<Widget>(widget.childWidgets, (index, Child data) {
              return data.type == Type.TEXT
                  ? Align(
                      alignment: FractionalOffset(data.x!.toDouble() / MediaQuery.of(context).size.width,
                          data.y!.toDouble() / MediaQuery.of(context).size.height),
                      child: Container(
                          child: Text(data.text!,
                              style: TextStyle(
                                fontSize: data.fontSize!.toDouble(),
                                fontWeight: data.bold == true ? FontWeight.bold : FontWeight.normal,
                                color: HelperFunctions.returnColorFromRGBO(data.color!),
                              ))),
                    )
                  : Align(
                      alignment: FractionalOffset(data.x!.toDouble() / MediaQuery.of(context).size.width,
                          data.y!.toDouble() / MediaQuery.of(context).size.height),
                      child: Container(
                        height: data.height!.toDouble(),
                        width: data.width!.toDouble(),
                        child: Image.network(data.src!),
                      ),
                    );
            }),
          ),
        ),
      ),
    );
  }
}
