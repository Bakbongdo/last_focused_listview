part of '../last_focused_listview.dart';

///  This widget automatically transforms a regular ListView() widget
/// into a LastFocusedListView() widget based on the `convertCount` param.
class AutoConvertListView extends StatelessWidget {
  const AutoConvertListView({
    super.key,
    this.controller,
    required this.height,
    required this.convertCount,
    required this.itemList,
    required this.itemBuilder,
    this.topPad = 0.0,
    this.btmPad = 0.0,
    this.topPadOnConvert = 20.0,
    this.btmPadOnConvert = 70.0,
    this.shaderStops,
    this.shaderColors,
    this.physics,
    this.shrinkWrap = false,
  });
  final ScrollController? controller;
  final double height;
  final int convertCount;
  final List itemList;
  final Widget Function(dynamic item) itemBuilder;
  final double topPad;
  final double btmPad;
  final double topPadOnConvert;
  final double btmPadOnConvert;
  final List<double>? shaderStops;
  final List<Color>? shaderColors;
  final ScrollPhysics? physics;
  final bool shrinkWrap;

  @override
  Widget build(BuildContext context) {
    bool isConvert = convertCount <= itemList.length;
    List buildList = isConvert ? itemList.reversed.toList() : itemList;

    return Container(
      constraints: isConvert ? BoxConstraints(maxHeight: height) : null,
      height: isConvert ? null : height,
      child: ShaderBox(
        stops: shaderStops,
        colors: shaderColors,
        child: ListView.builder(
          physics: physics,
          shrinkWrap: shrinkWrap,
          controller: controller,
          reverse: isConvert ? true : false,
          padding: EdgeInsets.only(
            top: isConvert ? topPadOnConvert : topPad,
            bottom: isConvert ? btmPadOnConvert : btmPad,
          ),
          itemCount: itemList.length,
          itemBuilder: (_, index) => itemBuilder(buildList[index]),
        ),
      ),
    );
  }
}
