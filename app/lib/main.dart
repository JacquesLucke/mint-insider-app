import 'package:flutter/material.dart';

void main() {
  runApp(const MintInsiderPassApp());
}

class MintInsiderPassApp extends StatelessWidget {
  const MintInsiderPassApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.green,
            title: const Text("MINT Insider Pass")),
        body: Container(
          child: GridView.count(
            crossAxisCount: 2,
            children: [PassItem(), PassItem(), PassItem()],
          ),
        ),
      ),
    );
  }
}

class PassItem extends StatelessWidget {
  const PassItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text("1");
  }
}
