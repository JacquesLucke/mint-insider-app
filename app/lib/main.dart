import 'package:flutter/material.dart';

void main() {
  runApp(const MintInsiderPassApp());
}

class PassItemInfo {
  String imagePath;
  String title;
  bool done;

  PassItemInfo(
      {required this.imagePath, required this.title, this.done = false});
}

var passItems = [
  PassItemInfo(
    imagePath: "https://hackmd.io/_uploads/ryCnnbZia.png",
    title: "Mess Master",
    done: true,
  ),
  PassItemInfo(
    imagePath: "https://hackmd.io/_uploads/Sy2anWZoT.png",
    title: "Försterdreieck",
  ),
  PassItemInfo(
    imagePath: "https://hackmd.io/_uploads/SklA3Wbj6.png",
    title: "Tricks und Knobeleien",
  ),
  PassItemInfo(
    imagePath: "https://hackmd.io/_uploads/HJcAnZZop.png",
    title: "Mathe-Magie",
    done: true,
  ),
  PassItemInfo(
    imagePath: "https://hackmd.io/_uploads/BkxJ6WZja.png",
    title: "Spielerisches Programmieren",
  ),
  PassItemInfo(
    imagePath: "https://hackmd.io/_uploads/SyVJ6ZZsT.png",
    title: "Calliope Mini",
  ),
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
              crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
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
      child: Stack(children: [
        Hero(
          tag: info.imagePath,
          child: AspectRatio(
            aspectRatio: 1.0,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      alignment: FractionalOffset.topCenter,
                      image: NetworkImage(info.imagePath))),
            ),
          ),
        ),
        FractionallySizedBox(
          widthFactor: 0.4,
          child: (info.done)
              ? Image.network("https://hackmd.io/_uploads/rJCK-YWsa.png")
              : const SizedBox.shrink(),
        ),
      ]),
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
        title: Text(info.title),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Hero(
            tag: info.imagePath,
            child: Image.network(info.imagePath),
          ),
          const Center(child: Text("Hier könnte noch mehr Text stehen")),
        ],
      ),
    );
  }
}
