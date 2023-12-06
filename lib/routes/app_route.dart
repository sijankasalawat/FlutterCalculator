import 'package:calculator/view/calculator_view.dart';

class AppRoute{
   AppRoute._();
  static const String calculatorRoute = "/";


  static getApplicationRoute() {
    return {
     calculatorRoute: (context) => const Calculator(),

    };
  }
}