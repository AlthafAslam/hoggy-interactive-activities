import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_interactions/models/example_res.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends Object {
  final _jsonDataStream = BehaviorSubject<List<Example>>();

  ///methord to fetch data from the json file.
  Future<void> readDataFromJsonFile() async {
    List<Example> example = exampleFromJson(await rootBundle.loadString('assets/data_json.json'));
    _jsonDataStream.sink.add(example);
  }
  Stream<List<Example>> get getStreamDataFromJson => _jsonDataStream.stream;

  List<Example> get getDataFromJson => _jsonDataStream.value;

}
