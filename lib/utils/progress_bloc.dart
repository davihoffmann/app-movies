import 'package:rxdart/rxdart.dart';

class ProgressBloc {
  final controller = BehaviorSubject<bool>();
  Stream<bool> get stream => controller.stream;

  void setProgress(bool b) {
    controller.sink.add(b);
  }

  close() {
    controller.close();
  }

}