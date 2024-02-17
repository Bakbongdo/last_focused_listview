# last_focused_listview
</br>

 This Flutter package, `last_focused_listview`, provides a way to render a ListView widget efficiently starting with the last item in the data list. If you want to use lazy-loading and starting with the last item, without scroll jump or animate, This package will help you.
 
 **If you use scroll jump or animate to move to the last item, your itemBuilder method will be called for every items in the data list.

</br></br>

![example](https://github.com/Bakbongdo/last_focused_listview/assets/152972818/74598c82-fb71-480d-b188-0cd65f51048a)

</br>

## Usage
  You can use `LastFocusedListView()` and `AutoConvertListView()` in this package. If your itemTile's height is variable, `AutoConvertListView()` will be good choice. 

  - `AutoConvertListView()` automatically transforms a regular ListView widget into
  a `LastFocusedListView()` widget based on the `convertCount` parameter.

</br>

A simple usage example of `LastFocusedListView()` :
```dart
import 'package:last_focused_listview/last_focused_listview.dart';

LastFocusedListView(
  itemList: List.generate(100, (index) => index), // your data list
  itemHeight: 35.0, // height of your single itemTile
  maxHeight: maxHeight, // max height of this widget
  itemBuilder: (item) => Tile(item: item), // your itemTile build logic
),

/// other params
LastFocusedListView(
  ...
  controller: null,
  physics: null,
  shrinkWrap: false,  

  /// ListView Padding
  topPad: 0.0,
  btmPad: 0.0,
  topPadOnMaxHeight: 20.0,
  btmPadOnMaxHeight: 70.0,

  /// Shader Effect
  shaderStops: [0.0, 0.02, 0.98, 1.0],
  shaderColors: [
    Colors.transparent,
    Colors.white,
    Colors.white,
    Colors.transparent,
  ],
)

```
</br>

A simple usage example of `AutoConvertListView()` :
```dart
import 'package:last_focused_listview/last_focused_listview.dart';

AutoConvertListView(
  height: 600.0, // height of this widget
  convertCount: 10,
  itemList: itemList,
  itemBuilder: (item) => itemTileBuilder(item),  
)

/// other params
AutoConvertListView(  
  ...
  controller: null,
  physics: null,
  shrinkWrap: false,  

  /// ListView Padding
  topPad: 0.0,
  btmPad: 0.0,
  topPadOnConvert 20.0,
  btmPadOnConvert: 70.0,

  /// Shader Effect
  shaderStops: [0.0, 0.02, 0.98, 1.0],
  shaderColors: [
    Colors.transparent,
    Colors.white,
    Colors.white,
    Colors.transparent,
  ],
),

```

</br></br>

