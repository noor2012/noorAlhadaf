import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class TalentShowTeam extends StatefulWidget {

  @override
  _TalentShowTeamState createState() => _TalentShowTeamState();
}

class _TalentShowTeamState extends State<TalentShowTeam> {
  String _name;

  String _position;

  String _country;

  String _location;

  String _numberId;

  String _number;

  String _email;

  String _date;

  final _key = GlobalKey<FormState>();

  TextStyle styleField = TextStyle(
      fontFamily: 'Cairo',
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.black87);

  final nameCtrl = TextEditingController();

  final countryCtrl = TextEditingController();

  final locationCtrl = TextEditingController();

  final numberCtrl = TextEditingController();



  bool isLoading = false;

  final picker = ImagePicker();

  VideoPlayerController _videoPlayerController;

  File file;

  _pickVideo() async {
    final video = await picker.getVideo(source: ImageSource.gallery);

    file = File(video.path);

    _videoPlayerController = VideoPlayerController.file(file)
      ..initialize().then((_) {
        setState(() {});
        _videoPlayerController.play();
      });
  }

  _pickVideoCamera() async {
    final video = await picker.getVideo(source: ImageSource.camera);

    file = File(video.path);

    _videoPlayerController = VideoPlayerController.file(file)
      ..initialize().then((_) {
        setState(() {});
        _videoPlayerController.play();
      });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          child: Form(
            key: _key,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'تقديم مقطع فيديو جماعي',
                      style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    autofocus: false,
                    controller: nameCtrl,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'اسماء الاعبين لا يمكن ان يكون فارغ';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _name = value;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: 'اسماء الاعبين'),
                    style: styleField,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    autofocus: false,
                    controller: countryCtrl,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'البلد لا يمكن ان يكون فارغ';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _country = value;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: 'البلد'),
                    style: styleField,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    autofocus: false,
                    controller: locationCtrl,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'العنوان لا يمكن ان يكون فارغ';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _location = value;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: 'العنوان'),
                    style: styleField,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    autofocus: false,
                    controller: numberCtrl,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'رقم الهاتف لا يمكن ان يكون فارغ';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _number = value;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: 'رقم الهاتف'),
                    style: styleField,
                  ),
                  SizedBox(height: 10),
                  isLoading
                      ? Container(
                    width: size.width * 0.2,
                    height: size.width * 0.2,
                    child: Center(child: CircularProgressIndicator()),
                  )
                      : Align(
                    alignment: Alignment.center,
                    child: Text(
                      '${file == null ? "" : file.toString()}',
                      style: TextStyle(
                          fontSize: 10, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'ارسال فيديو من ',
                      style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                        color: Colors.green[800],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(
                          'معرض',
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        onPressed: _pickVideo,
                      ),

                      /// Material button is same as Raised button
                      MaterialButton(
                        color: Colors.green[800],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(
                          'كاميرا',
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        onPressed: _pickVideoCamera,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MaterialButton(
                      color: Colors.green[800],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(
                        'ارسال الطلب',
                        style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      onPressed: () {
                        if (!_key.currentState.validate()) {
                          return;
                        }
                        _key.currentState.save();
                        task();
                      }),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future task() async {
    /// always use camel case in dart for variable
    final name = nameCtrl.text;
    final number = numberCtrl.text;
    final country = countryCtrl.text;
    final location = locationCtrl.text;
    setState(() {
      isLoading = true;
    });
    return await FirebaseStorage.instance
        .ref()
        .child('videos/${Uri.file(file.path).pathSegments.last}')
        .putFile(file)
        .then((value) {
      value.ref.getDownloadURL().then((value) async {
        final videoLink = '$value';
        print("Video link => $value");
        return await FirebaseFirestore.instance.collection('professional team').add({
          'video': videoLink,
          'name': name,
          'number': number,
          'country': country,
          'location': location,
        }).whenComplete(() {
          nameCtrl.clear();
          numberCtrl.clear();
          countryCtrl.clear();
          locationCtrl.clear();
          setState(() {
            file = null;
            isLoading = false;
          });
        }).catchError((e) {
          print("error => " + e.toString());
        });
      });
    });
  }
}