import 'package:flutter/material.dart';
 
class ScrollAttributesProvider with ChangeNotifier {
  // String scrollPosInfoStr = '';
 
  Map<String, dynamic> scrollAttributes = {};
 
  set storeScrollPosAttributes(double scrollPos) {
    if (scrollPos.abs() <= 10) {
      scrollAttributes = {
        'primaryColor': Colors.blue,
        'accentColor': Colors.blueAccent[100],
        'mySpeed': 'Right...This is interesting 🙂',
        'mySpeedIcon': Icons.directions_bike,
      };
    } else if (scrollPos.abs() <= 20) {
      scrollAttributes = {
        'primaryColor': Colors.amber,
        'accentColor': Colors.amberAccent,
        'mySpeed': 'Hmm...Picking pace..😤',
        'mySpeedIcon': Icons.airport_shuttle,
      };
    } else {
      scrollAttributes = {
        'primaryColor': Colors.red,
        'accentColor': Colors.redAccent,
        'mySpeed': 'Red hot and ready to take off 😡',
        'mySpeedIcon': Icons.flight_takeoff,
      };
    }
 
    scrollAttributes = {
      ...scrollAttributes,
      'scrollDirectionIcon':
          (scrollPos >= 0) ? Icons.arrow_upward : Icons.arrow_downward,
      'scrollDirIconSize': 40.0,
      'tileBarTextSize': 16.0,
      'tileBarIconSize': 22.0,
    };
 
    // scrollPosInfoStr = 'I am at ${scrollPos.toStringAsFixed(2)}';
    notifyListeners();
  }
 
  Map<String, dynamic> get fetchScrollPosAttributes {
    return scrollAttributes;
  }
}
 
 

