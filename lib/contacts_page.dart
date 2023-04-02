import 'package:flutter/material.dart';
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final FlutterContactPicker _contactPicker = FlutterContactPicker();
  Contact? _contact;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_new
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          MaterialButton(
            color: Colors.blue,
            child: Text("CLICK ME"),
            onPressed: () async {
              final contact = await _contactPicker.selectContact();
              setState(() {
                _contact = contact;
              });
            },
          ),
          Text(
            _contact == null ? 'No contact selected.' : _contact.toString(),
          ),
        ],
      ),
    );
  }
}
