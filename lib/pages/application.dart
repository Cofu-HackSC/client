import 'dart:io';
import 'dart:ui';

import 'package:app/components/button.dart';
import 'package:app/components/header.dart';
import 'package:app/components/themed_text.dart';
import 'package:app/global/app_theme.dart';
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
                DocumentTile('Proof of Insurance', widget.session),
                DocumentTile('Cottage Food License', widget.session),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DocumentTile extends StatefulWidget {
  final Session session;
  final String name;
  DocumentTile(this.name, this.session);

  @override
  _DocumentTileState createState() => _DocumentTileState();
}

class _DocumentTileState extends State<DocumentTile> {
  bool hasImage, blurred;

  @override
  void initState() {
    hasImage = false;
    blurred = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            color: AppTheme.backgroundLighGray,
            child: Column(
              children: [
                TextButton(
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  onPressed: () {
                    if (hasImage)
                      setState(() => blurred = !blurred);
                    else {
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
                          res.stream.listen((value) => print(value));
                          res.stream.drain().then((value) {
                            print("ITS F**KING DONE");
                            print(value);
                          });
                        });
                      } catch (e) {
                        print('ERROROROROROORORORO');
                        print(e);
                      }
                    }
                  },
                  child: hasImage
                      ? blurred
                          ? ClipRect(
                              child: Container(
                                height: 180,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/example_img.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 10, sigmaY: 8),
                                  child: Container(
                                    color: Colors.black.withOpacity(0.1),
                                  ),
                                ),
                              ),
                            )
                          : Image.asset('assets/example_img.jpg',
                              height: 180,
                              width: double.infinity,
                              fit: BoxFit.cover)
                      : Container(
                          height: 180,
                          width: double.infinity,
                          color: AppTheme.logoGreen.withAlpha(100),
                          child: Center(
                            child: Icon(
                              Icons.add,
                              color: AppTheme.primaryText,
                            ),
                          ),
                        ),
                ),
                Row(
                  children: [ThemedText(widget.name)],
                ),
                SizedBox(height: 8)
              ],
            ),
          )),
    );
  }
}
