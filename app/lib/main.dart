import 'package:flutter/material.dart';

void main() {
  runApp(const MintInsiderPassApp());
}

class PassItemInfo {
  String imagePath;
  String title;

  PassItemInfo({required this.imagePath, required this.title});
}

var passItems = [
  PassItemInfo(
      imagePath: "https://hackmd.io/_uploads/ryCnnbZia.png",
      title: "Mess Master"),
  PassItemInfo(
      imagePath: "https://hackmd.io/_uploads/Sy2anWZoT.png",
      title: "Försterdreieck"),
  PassItemInfo(
      imagePath: "https://hackmd.io/_uploads/SklA3Wbj6.png",
      title: "Tricks und Knobeleien"),
  PassItemInfo(
      imagePath: "https://hackmd.io/_uploads/HJcAnZZop.png",
      title: "Mathe-Magie"),
  PassItemInfo(
      imagePath: "https://hackmd.io/_uploads/BkxJ6WZja.png",
      title: "Spielerisches Programmieren"),
  PassItemInfo(
      imagePath: "https://hackmd.io/_uploads/SyVJ6ZZsT.png",
      title: "Calliope Mini"),
];

class MintInsiderPassApp extends StatelessWidget {
  const MintInsiderPassApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.green,
            title: const Text("MINT Insider Pass")),
        body: GridView.builder(
          itemBuilder: (context, index) {
            if (index >= passItems.length) {
              return null;
            }
            return PassItem(info: passItems[index]);
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
        ),
      ),
    );
  }
}

class PassItem extends StatelessWidget {
  final PassItemInfo info;

  const PassItem({
    super.key,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Hero(
        tag: info.imagePath,
        child: Image.network(info.imagePath),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => PassItemRoute(
                      info: info,
                    ))));
      },
    );
  }
}

class PassItemRoute extends StatelessWidget {
  final PassItemInfo info;

  const PassItemRoute({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Element"),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Hero(
            tag: info.imagePath,
            child: Image.network(info.imagePath),
          ),
          Center(child: Text(info.title)),
        ],
      ),
    );
  }
}
