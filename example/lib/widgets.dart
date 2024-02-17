import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
      width: double.maxFinite,
      height: 200.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            spreadRadius: 2.0,
            blurRadius: 2.0,
            color: Colors.black.withOpacity(.1),
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: const Center(
        child: Text('Some Fixed Widget'),
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 15.0),
        child: Text(
          'LastFocusedListView()',
          style: TextStyle(fontSize: 21.0),
        ),
      ),
    );
  }
}

class Tile extends StatefulWidget {
  const Tile({
    super.key,
    required this.item,
  });
  final dynamic item;

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  void initState() {
    super.initState();
    print(widget.item);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            spreadRadius: 2.0,
            blurRadius: 2.0,
            color: Colors.black.withOpacity(.1),
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: const FlutterLogo(size: 18.0),
        title: Text('sample no.${widget.item.toString()}'),
      ),
    );
  }
}
