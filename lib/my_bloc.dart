import 'dart:async';

class MyBloc {
  StreamController streamController = StreamController<int>();

  StreamSink get streamSink => streamController.sink;
  Stream get stream => streamController.stream;

}