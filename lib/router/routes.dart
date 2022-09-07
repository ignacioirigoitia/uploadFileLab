

import 'package:default_proyect/router/default_handler.dart';
import 'package:fluro/fluro.dart';

class Flurorouter {

  static final FluroRouter router = new FluroRouter();

  static String rootRoute = '/';


  static void configureRoutes(){

    router.define(rootRoute, handler: DefaultHandler.defaultHome, transitionType: TransitionType.none);

  }

}