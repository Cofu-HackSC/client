import 'package:app/components/button.dart';
import 'package:app/components/header.dart';
import 'package:app/components/themed_text.dart';
import 'package:app/models/session.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Application extends StatefulWidget {
  final Session session;

  const Application({@required this.session});

  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  bool hasUploaded;

  @override
  void initState() {
    super.initState();
    hasUploaded = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          Header('Cook Application'),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                ThemedText('License'),
                Button('Click here to upload your license', onPressed: () {
                  ImagePicker()
                      .getImage(source: ImageSource.camera)
                      .then((value) {});
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
