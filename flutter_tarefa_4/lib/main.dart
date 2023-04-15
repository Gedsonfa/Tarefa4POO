import 'package:flutter/material.dart';

void main() {
  MyApp app = MyApp();
  runApp(app);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: NewAppBar(),
        body: DataBodyWidget(objects: [
          "La Fin Du Monde - Bock - 65 ibu",
          "Sapporo Premiume - Sour Ale - 54 ibu",
          "Duvel - Pilsner - 82 ibu"
        ]),
        bottomNavigationBar: NewNavBar(
          icons: [
            Icons.coffee_outlined,
            Icons.local_drink_outlined,
            Icons.flag_outlined,
          ],
        ),
      ),
    );
  }
}

class NewAppBar extends StatelessWidget implements PreferredSizeWidget {
  NewAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Dicas"),
      actions: [
        PopupMenuButton(
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                child: Text("Red"),
                value: Colors.red,
              ),
              PopupMenuItem(
                child: Text("Green"),
                value: Colors.green,
              ),
              PopupMenuItem(
                child: Text("Blue"),
                value: Colors.blue,
              ),
            ];
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class NewNavBar extends StatelessWidget {
  final List<IconData> icons;

  const NewNavBar({required this.icons});

  void botaoFoiTocado(int index) {
    print("Tocaram no botão $index");
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: botaoFoiTocado,
      items: icons
          .map((icon) => BottomNavigationBarItem(
                icon: Icon(icon),
                label: '',
              ))
          .toList(),
    );
  }
}

class DataBodyWidget extends StatelessWidget {
  final List<String> objects;

  const DataBodyWidget({required this.objects});

  Expanded processarUmElemento(String obj) {
    return Expanded(
      child: Center(
        child: Text(obj),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: objects
          .map((obj) => processarUmElemento(obj))
          .toList(),
    );
  }
}
