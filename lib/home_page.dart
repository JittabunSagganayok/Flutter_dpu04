import 'package:flutter/material.dart';
import 'package:flutter_plugin/contacts_page.dart';
import 'package:flutter_plugin/images_page.dart';
import 'package:flutter_plugin/link_page.dart';
import 'package:flutter_plugin/location_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  static const titles = <Widget>[
    Text('Link'),
    Text('Contact'),
    Text('Image'),
    Text('Location'),
  ];

  static const bodies = <Widget>[
    LinkPage(),
    ContactPage(),
    ImagePage(),
    LocationPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            const DrawerHeader(
              child: Text('Flutter Plugins'),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: titles.length,
                  itemBuilder: (context, index) {
                    final title = titles.elementAt(index);
                    return ListTile(
                      title: title,
                      onTap: () {
                        Navigator.of(context).pop();
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: titles.elementAt(_currentIndex),
      ),
      body: bodies.elementAt(_currentIndex),
    );
  }
}
