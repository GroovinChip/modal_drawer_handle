import 'package:flutter/material.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';
import 'package:rounded_modal/rounded_modal.dart';
import 'package:modal_drawer_handle/modal_drawer_handle.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ModalDrawerHandle demo',
      theme: ThemeData(
        primaryColor: Colors.indigo,
        accentColor: Colors.indigo,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color randomHandleColor = Colors.indigo;

  Color randomColor() {
    final rColor = (List<Color>()
          ..addAll(Colors.primaries)
          ..shuffle())
        .first;
    return rColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Theme.of(context).canvasColor,
        title: Text(
          "ModalDrawerHandle Demo",
          style: TextStyle(
            color: Theme.of(context).brightness == Brightness.light
              ? Colors.black
              : Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text(
                "Change handle color (random)",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.indigoAccent,
              onPressed: () {
                setState(() {
                  randomHandleColor = randomColor();
                });
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.keyboard_arrow_up),
        label: Text("Show drawer"),
        backgroundColor: randomHandleColor,
        onPressed: () {
          showRoundedModalBottomSheet(
            context: context,
            builder: (builder) {
              return Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ModalDrawerHandle(
                        handleColor: randomHandleColor,
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.info_outline),
                      title: Text("Package developed by GroovinChip"),
                      subtitle: Text("Version 1.0.0"),
                    ),
                    Material(
                      child: ListTile(
                        leading: Icon(GroovinMaterialIcons.github_circle),
                        title: Text("View source code"),
                        onTap: () {
                          launch("https://github.com/GroovinChip/modal_drawer_handle");
                        },
                      ),
                    ),
                    Material(
                      child: ListTile(
                        leading: Icon(GroovinMaterialIcons.twitter),
                        title: Text("Tweet @GroovinChipDev"),
                        onTap: () {
                          launch("https://twitter.com/GroovinChipDev/");
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
