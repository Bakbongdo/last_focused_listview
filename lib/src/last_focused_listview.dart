part of '../last_focused_listview.dart';

class LastFocusedListView extends StatelessWidget {
  const LastFocusedListView({
    super.key,
    this.controller,
    required this.itemList,
    required this.itemHeight,
    required this.maxHeight,
    required this.itemBuilder,
    this.topPad = 0.0,
    this.btmPad = 0.0,
    this.topPadOnMaxHeight = 20.0,
    this.btmPadOnMaxHeight = 70.0,
    this.shaderStops,
    this.shaderColors,
    this.physics,
    this.shrinkWrap = false,
  });
  final ScrollController? controller;
  final List itemList;
  final double itemHeight;
  final double maxHeight;
  final Widget Function(dynamic item) itemBuilder;
  final double topPad;
  final double btmPad;
  final double topPadOnMaxHeight;
  final double btmPadOnMaxHeight;
  final List<double>? shaderStops;
  final List<Color>? shaderColors;
  final ScrollPhysics? physics;
  final bool shrinkWrap;

  @override
  Widget build(BuildContext context) {
    /// Get Reversed ItemList
    List reversed = itemList.reversed.toList();

    /// Get LastFocusedListView Height
    int itemCount = itemList.length;
    double listHeight = (itemHeight * itemCount) * 2;

    return Container(
      constraints: BoxConstraints(maxHeight: maxHeight),
      height: listHeight,
      child: ShaderBox(
        stops: shaderStops,
        colors: shaderColors,
        child: ListView.builder(
          physics: physics,
          shrinkWrap: shrinkWrap,
          controller: controller,
          reverse: true,
          padding: EdgeInsets.only(
            top: listHeight < maxHeight ? topPad : topPadOnMaxHeight,
            bottom: listHeight < maxHeight ? btmPad : btmPadOnMaxHeight,
          ),
          itemCount: itemCount,
          itemBuilder: (_, index) => itemBuilder(reversed[index]),
        ),
      ),
    );
  }
}
