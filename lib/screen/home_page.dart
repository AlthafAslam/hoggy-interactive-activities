import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_interactions/bloc/home_page_bloc.dart';
import 'package:flutter_interactions/helpers/helper_functions.dart';
import 'package:flutter_interactions/models/example_res.dart';
import 'package:flutter_interactions/widgets/interaction_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final HomeBloc _bloc = HomeBloc();

  int childLength = 0;
  double opacityLevel = 1.0;

  @override
  void initState() {
    _bloc.readDataFromJsonFile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: StreamBuilder<List<Example>>(
            stream: _bloc.getStreamDataFromJson,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Stack(
                  children: [
                    // LottieBuilder.network(snapshot.data![childLength].attrs.lottieBackground.url),
                    InteractionWidget(
                      containerHeight: snapshot.data![childLength].attrs.size.height.toDouble(),
                      containerWidth: snapshot.data![childLength].attrs.size.width.toDouble(),
                      colorList: HelperFunctions.colorFromBreakPoints(
                          snapshot.data![childLength].attrs.backgroundColor.breakPoints),
                      stopList: HelperFunctions.stopListFromBreakPoint(
                          snapshot.data![childLength].attrs.backgroundColor.breakPoints),
                      lottieUrl: snapshot.data![childLength].attrs.lottieBackground.url,
                      childWidgets: snapshot.data![childLength].children,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (childLength < (snapshot.data!.length - 1)) {
                              setState(() {
                                childLength++;
                              });
                            } else if (childLength >= (snapshot.data!.length - 1)) {
                              setState(() {
                                childLength = 0;
                              });
                            }
                          },
                          child: const Icon(
                            Icons.arrow_right_alt_rounded,
                            size: 24.0,
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            shape: CircleBorder(),
                            textStyle: const TextStyle(
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.all(24),
                          ),
                        )
                      ],
                    ),
                  ],
                );
              }
              return Container(
                child: const Center(
                  child: Text('No data'),
                ),
              );
            }),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
