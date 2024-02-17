import 'package:flutter/material.dart' hide Title;
import 'package:last_focused_listview/last_focused_listview.dart';
import 'widgets.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Sample(),
  ));
}

class Sample extends StatefulWidget {
  const Sample({super.key});

  @override
  State<Sample> createState() => _SampleState();
}

class _SampleState extends State<Sample> {
  @override
  Widget build(BuildContext context) {
    final double dHeight = MediaQuery.of(context).size.height;
    final double maxHeight = dHeight - 300.0;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 251, 251, 251),
      floatingActionButton: FloatingActionButton(
        onPressed: () => refresh(context),
        child: const Icon(Icons.refresh_rounded),
      ),
      body: Column(
        children: [
          const SizedBox(height: 40.0),

          /// Some Fixed Widget
          const Dashboard(),
          const SizedBox(height: 20.0),

          /// ReversedListView()
          const Title(),
          LastFocusedListView(
            itemList: List.generate(100, (index) => index),
            itemHeight: 35.0,
            maxHeight: maxHeight,
            itemBuilder: (item) => Tile(item: item),
          ),
        ],
      ),
    );
  }
}

refresh(BuildContext context) => Navigator.of(context).push(
      PageRouteBuilder(
          pageBuilder: (context, animation, secAnimation) => const Sample(),
          transitionsBuilder: (context, animation, secAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          }),
    );
