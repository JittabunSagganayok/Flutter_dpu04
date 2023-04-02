import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkPage extends StatelessWidget {
  const LinkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Linkify(
        text: 'Google : https://flutter.dev',
        onOpen: (link) async {
          final Uri _url = Uri.parse('https://flutter.dev');

          if (!await launchUrl(_url)) {
            throw Exception('Could not launch $_url');
          } else {
            await launchUrl(_url);
          }
        },

        // showDialog(
        //     context: context,
        //     builder: (context) {
        //       return AlertDialog(
        //         title: Text(link.text),
        //         content: Text(link.url),
        //         actions: [
        //           TextButton(
        //               onPressed: () {
        //                 Navigator.of(context).pop();
        //               },
        //               child: Text("OK"))
        //         ],
        //       );
        //     });
      ),
    );
  }
}
