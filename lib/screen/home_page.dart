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

  List<double> stopPointList = [];
  int childLength = 0;

  @override
  void initState() {
    _bloc.readDataFromJsonFile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: StreamBuilder<List<Example>>(
                stream: _bloc.getStreamDataFromJson,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return InteractionWidget(
                      containerHeight: snapshot.data![childLength].attrs.size.height.toDouble(),
                      containerWidth: snapshot.data![childLength].attrs.size.width.toDouble(),
                      colorList: HelperFunctions.colorFromBreakPoints(
                          snapshot.data![childLength].attrs.backgroundColor.breakPoints),
                      stopList: HelperFunctions.stopListFromBreakPoint(
                          snapshot.data![childLength].attrs.backgroundColor.breakPoints),
                      lottieUrl: snapshot.data![childLength].attrs.lottieBackground.url,
                      childWidgets: snapshot.data![childLength].children,
                    );
                  }
                  return Container(
                    child: const Center(
                      child: Text('Center'),
                    ),
                  );
                }),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

