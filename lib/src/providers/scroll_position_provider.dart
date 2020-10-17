
import 'package:flutter/foundation.dart';

class ScrollPositionProvider with ChangeNotifier{

    double scrollPosition = 0.0;

    set storeScrollPosition(double inputScrollPosition){
      scrollPosition = inputScrollPosition;
      notifyListeners();
    }

    double get fetchScrollPosition{
      return scrollPosition;
    }

}