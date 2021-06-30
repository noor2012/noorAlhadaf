import 'package:alhadaf/sendScreens/talentshowperson.dart';
import 'package:alhadaf/sendScreens/talentShowTeam.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HeroAlhadaf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://firebasestorage.googleapis.com/v0/b/alhadaf-a3fa2.appspot.com/o/background.jpeg?alt=media&token=018e76e8-e52d-4870-b76b-20587ec780c5'),
                fit: BoxFit.fill),
          ),
          child: ListView(
              children: [
               Stack(
                 children: [
                   Container(
                  height: 160,
                  width: double.infinity,
                  child: Image(
                      image: NetworkImage(
                          'https://firebasestorage.googleapis.com/v0/b/alhadaf-a3fa2.appspot.com/o/headertwo.jpg?alt=media&token=3bfe4758-1c7e-4916-a0a0-9f85b48a746f'),
                      width: double.infinity,
                      fit: BoxFit.cover),
                ),
                Positioned(
                  child: IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios,color: Colors.white,),),
                )
              ]
          ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'استمتع الأن بفرص التسويق الرياضي المحلي \n والدولي من خلال خدماتنا لتسويق اللاعبين',
                  style:
                  TextStyle(fontFamily: 'Cairo',fontSize: 15, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    height: 210,
                    width: double.infinity,
                    child: GridView.count(crossAxisCount: 2, children: [
                      Container(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_)=> TalentShowTeam()));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            elevation: 15,
                            child: Column(
                              children: [
                                Image(
                                  image: NetworkImage(
                                      'https://firebasestorage.googleapis.com/v0/b/alhadaf-a3fa2.appspot.com/o/hero%2F12.png?alt=media&token=27066cf1-970b-447b-8b70-15bb244ad007'),
                                  fit: BoxFit.cover,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_)=> TalentShowPerson()));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              children: [
                                Image(
                                  image: NetworkImage(
                                      'https://firebasestorage.googleapis.com/v0/b/alhadaf-a3fa2.appspot.com/o/hero%2F13.png?alt=media&token=3a0997c8-0b64-46f8-b772-ed913b39cb1f'),
                                  fit: BoxFit.cover,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance.collection("ads").snapshots(),
                      builder: (_,snapshot){
                        if(snapshot.hasData){
                          return Center(
                            child: Image(
                              image: NetworkImage(snapshot.data.docs[0]['ad']),
                            ),
                          );
                        }else{
                          return Center(child: CircularProgressIndicator(),);
                        }
                      },
                    )
                ),
                SizedBox(height: 20,),

              ],
            ),
        ),
      ),
    );
  }
}
