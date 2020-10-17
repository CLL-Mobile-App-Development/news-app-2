import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import '../providers/scroll_position_provider.dart';
import '../providers/scroll_attributes_provider.dart';

class ScrollDirectionIndicator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScrollDirectionIndicatorState();
}

class _ScrollDirectionIndicatorState extends State<ScrollDirectionIndicator> {
  @override
  Widget build(BuildContext context) {
    final currScrollAttributes = context.select(
        (ScrollAttributesProvider scrollPosProvider) =>
            scrollPosProvider.fetchScrollPosAttributes);

    return CircleAvatar(
      backgroundColor: currScrollAttributes['accentColor'],
      child: Icon(
        currScrollAttributes['scrollDirectionIcon'],
        size: currScrollAttributes['scrollDirIconSize'],
        color: currScrollAttributes['primaryColor'],
      ),
      radius: 25,
    );
  }
}
