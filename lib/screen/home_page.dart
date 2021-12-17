import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_interactions/bloc/home_page_bloc.dart';
import 'package:flutter_interactions/models/example_res.dart';
import 'package:lottie/lottie.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final HomeBloc _bloc = HomeBloc();

  // Fetch content from the json file

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
                return Container(
                  height: snapshot.data![0].attrs.size.height.toDouble(),
                  width: 800,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: <Color>[Color(0xffFA8BFF), Color(0xff2BD2FF), Color(0xff2BFF88)],
                          stops: [0, 0.5, 0.9])),
                  child: Stack(
                    children: <Widget>[
                      Lottie.network(
                          'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json'),
                      const Positioned(
                          left: 161,
                          top: 160,
                          child: Text(
                            'Headline text',
                            style: TextStyle(color: Color(0xffffffff), fontWeight: FontWeight.bold, fontSize: 76),
                          ))
                    ],
                  ),
                );
              }
              return Container(
                child: const Center(
                  child: Text('Center'),
                ),
              );
            }),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
