import 'package:flutter/foundation.dart';

class CounterModel extends ChangeNotifier {
  int _counter = 0;

 int get getCounter => _counter;


 void incrementCounter() {
   _counter++;
   notifyListeners();
 }

 void decrementCounter() {
   _counter--;
   notifyListeners();
 }
}