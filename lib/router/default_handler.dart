

import 'package:default_proyect/ui/views/default_view.dart';
import 'package:fluro/fluro.dart';

class DefaultHandler {

  static Handler defaultHome = new Handler(
    handlerFunc: ((context, parameters) => DefaultView())
  );

}