import 'dart:async';

import 'package:movies_flutter/utils/progress_bloc.dart';

class SimpleBloc<T> {
  final progress = ProgressBloc();

  // Fecha a stream para limpar a memória
  void dispose() {
    //super.dispose();
    progress.close();
  }
  
}