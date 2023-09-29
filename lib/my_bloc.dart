import 'dart:async';

class MyBloc {
  final StreamController _stateStreamController = StreamController<int>();

  StreamSink get _stateStreamSink => _stateStreamController.sink;
  Stream get stateStream => _stateStreamController.stream;


  final StreamController _eventStreamController = StreamController<int>();

  StreamSink get eventStreamSink => _eventStreamController.sink;
  Stream get _eventStream => _eventStreamController.stream;

  MyBloc(){
    _eventStream.listen((event) {
      print(event);
      event++;
      _stateStreamSink.add(event);
    });
  }

}