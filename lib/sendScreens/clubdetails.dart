import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ClupOrders extends StatefulWidget {


  @override
  _ClupOrdersState createState() => _ClupOrdersState();
}

class _ClupOrdersState extends State<ClupOrders> {

  String _name;

  String _date;

  String _number;

  String _email;

  String _numberid;

  String _country;

  String _club;

  String _city;



  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  TextStyle stylefield = TextStyle(fontFamily: 'Cairo',fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black87);

  final name = TextEditingController();

  final date = TextEditingController();

  final numper = TextEditingController();

  final email = TextEditingController();

  final numberid = TextEditingController();

  final country = TextEditingController();

  final club = TextEditingController();

  final city = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'حجز اختبارات النادي',
                    style: TextStyle(fontFamily: 'Cairo',color: Colors.black54,fontSize: 23,fontWeight:FontWeight.bold ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                      controller: name,
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
                      style: stylefield
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: date,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'سنة الميلاد لا يمكن ان يكون فارغ';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _date = value;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: 'سنة الميلاد'),
                    style: stylefield,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: numper,
                    keyboardType: TextInputType.number,
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
                    style: stylefield,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'البريد الالكتروني لا يمكن ان يكون فارغ';
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
                    style: stylefield,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: numberid,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'الرقم القومي  لا يمكن ان يكون فارغ';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _numberid = value;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: 'الرقم القومي'),
                    style: stylefield,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: country,
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
                    style: stylefield,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: city,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'المحافظة لا يمكن ان يكون فارغ';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _city = value;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: 'المحافظة'),
                    style:stylefield ,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: club,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'النادي لا يمكن ان يكون فارغ';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _club = value;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: 'النادي'),
                    style: stylefield,
                  ),
                  SizedBox(height: 15),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      color: Colors.green,
                      height: 50,
                      width: 200,
                      child: RaisedButton(
                          color: Colors.green[800],
                          child: Text('ارسال الاستمارة ',style: TextStyle(fontFamily: 'Cairo',color: Colors.white,fontSize: 18)),
                          onPressed: () {
                            if (!_formkey.currentState.validate()) {
                              return;
                            }
                            _formkey.currentState.save();

                            task();

                            // Navigator.push(context, MaterialPageRoute(builder: (_) =>CheakScreen()));


                          }),
                    ),
                  ),
                  SizedBox(height: 15,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  task(){

    final name1=name.text;
    final data1 = date.text;
    final numperr=numper.text;
    final Email=email.text;
    final Numberid=numberid.text;
    final country1 = country.text;
    final City=city.text;
    final Club=club.text;

    FirebaseFirestore.instance.collection('clupOrder').add({
      'name' : name1,
      'date' : data1,
      'number' : numperr,
      'email' : Email,
      'number id' : Numberid,
      'country' : country1,
      'city' : City,
      'club' : Club,
    });

    name.clear();
    date.clear();
    numper.clear();
    email.clear();
    numberid.clear();
    country.clear();
    city.clear();
    club.clear();
  }
}
