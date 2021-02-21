import 'dart:io';

import 'package:app/components/button.dart';
import 'package:app/components/header.dart';
import 'package:app/components/themed_text.dart';
import 'package:app/models/session.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
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
          Header(
            'Cook Application',
            showBack: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                ThemedText('License'),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Button('Click here to upload your license',
                      onPressed: () {
                    try {
                      print('Started Picture');
                      ImagePicker()
                          .getImage(source: ImageSource.camera)
                          .then((value) async {
                        print('Finished Picture');

                        MultipartRequest req = MultipartRequest(
                          'POST',
                          Uri.parse(
                            'https://cofu-305406.wl.r.appspot.com/application',
                          ),
                        );
                        print('here 1');
                        req.headers['Cookie'] =
                            'connect.sid=' + widget.session.session;
                        print('here 2');

                        req.files.add(
                          MultipartFile(
                            'file',
                            File(value.path).readAsBytes().asStream(),
                            File(value.path).lengthSync(),
                            filename: value.path.split("/").last,
                          ),
                        );
                        print('here 3');
                        var res = await req.send();

                        print('RESPONSE');
                        print(res.statusCode);
                        print(res.reasonPhrase);

                        await res.stream
                            .drain()
                            .then(
                                (value) => print("VALUEEE " + value.toString()))
                            .then(
                              (value) => Navigator.pop(context),
                            );
                      });
                    } catch (e) {
                      print(e);
                    }
                  }),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
