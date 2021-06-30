import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class TrainerClub extends StatefulWidget {

  @override
  _TrainerClubState createState() => _TrainerClubState();
}

class _TrainerClubState extends State<TrainerClub> {

  String _name;

  String _country;

  String _location;

  String _numberId;

  String _number;

  String _email;


  final _key = GlobalKey<FormState>();

  TextStyle styleField = TextStyle(
      fontFamily: 'Cairo',
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.black87);

  final nameCtrl = TextEditingController();

  final countryCtrl = TextEditingController();

  final locationCtrl = TextEditingController();

  final numberIdCtrl = TextEditingController();

  final numberCtrl = TextEditingController();

  final emailCtrl = TextEditingController();


  bool isLoading = false;

  File file;

  _pickFile()async{
    final result = await FilePicker.getFile(fileExtension: '$file');

    file = File(result.path);

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
                      'تقديم مدرب جديد',
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
                        return 'الاسم بالكامل لا يمكن ان يكون فارغ';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _name = value;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: 'الاسم بالكامل'),
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
                    controller: numberIdCtrl,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'الرقم القومي لا يمكن ان يكون فارغ';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _numberId = value;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: 'الرقم القومي'),
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
                  TextFormField(
                    autofocus: false,
                    controller: emailCtrl,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'البريد الالكتروتي لا يمكن ان يكون فارغ';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _email = value;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: 'البريد الالكتروني'),
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
                      'ارسال سيرة ذاتية ',
                      style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  MaterialButton(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                      color: Colors.green[800],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(
                        'اختيار سيرة ذاتية من المعرض',
                        style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      onPressed: _pickFile),
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
    final email = emailCtrl.text;
    final numberId = numberIdCtrl.text;
    final country = countryCtrl.text;
    final location = locationCtrl.text;
    setState(() {
      isLoading = true;
    });
    return await FirebaseStorage.instance
        .ref()
        .child('files/${Uri.file(file.path).pathSegments.last}')
        .putFile(file)
        .then((value) {
      value.ref.getDownloadURL().then((value) async {
        final videoLink = '$value';
        print("Video link => $value");
        return await FirebaseFirestore.instance.collection('New Trainer').add({
          'file': videoLink,
          'name': name,
          'number': number,
          'numberId': numberId,
          'email': email,
          'country': country,
          'location': location,
        }).whenComplete(() {
          nameCtrl.clear();
          numberCtrl.clear();
          emailCtrl.clear();
          numberIdCtrl.clear();
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