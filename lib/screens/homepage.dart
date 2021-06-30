import 'package:alhadaf/Service/firestore_data.dart';
import 'package:alhadaf/secondscreens/datealhadaf.dart';
import 'package:alhadaf/secondscreens/heroAlhadaf.dart';
import 'package:alhadaf/secondscreens/testalhadaf.dart';
import 'package:alhadaf/secondscreens/trainerAlhadaf.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../secondscreens/training.dart';
import '../secondscreens/gift.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://firebasestorage.googleapis.com/v0/b/alhadaf-a3fa2.appspot.com/o/background.jpeg?alt=media&token=018e76e8-e52d-4870-b76b-20587ec780c5'),
                fit: BoxFit.cover),
          ),
          child: ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: [
              Stack(
                overflow: Overflow.visible,
                alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: size.height*0.02),
                      height: size.height*0.22,
                      width: double.infinity,
                      decoration: BoxDecoration(
                      ),
                      child: Image.network("https://firebasestorage.googleapis.com/v0/b/alhadaf-a3fa2.appspot.com/o/headertwo.jpg?alt=media&token=3bfe4758-1c7e-4916-a0a0-9f85b48a746f",
                      fit: BoxFit.cover,),
                    ),
                    Positioned(
                      top: size.height*0.171,
                      child: Container(
                        width: size.width*0.86,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[400].withOpacity(0.6),
                                offset: Offset(1,0),
                                blurRadius: 0,
                                spreadRadius: 3
                            ),
                            BoxShadow(
                              color: Colors.grey[400].withOpacity(0.6),
                              offset: Offset(0,1),
                              blurRadius: 0,
                              spreadRadius: 1
                            )
                          ]

                        ),
                        child: TextField(
                     decoration: InputDecoration(
                       contentPadding: EdgeInsets.only(bottom:1,top: 6),
                       border: InputBorder.none,
                      prefixIcon: Icon(Icons.search,color: Colors.green,size:25 ,)
                     ),
                        ),
                      ),
                    ),
                    // Positioned(
                    //   top: 4,
                    //   child: IconButton(onPressed: (){
                    //     Database.fetchData();
                    //
                    //   }, icon: Icon(Icons.add,color: Colors.white,)),
                    // )
                  ]
              ),
              SizedBox(
                height: 35,
              ),
              GridView.count(
                  crossAxisCount: 3,
                  // childAspectRatio: (itemWidth / itemHeight),
                  controller: new ScrollController(keepScrollOffset: false),
                  shrinkWrap: true,
                  children: [
                    //test screen
                    Container(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => TestAlhadaf()));
                        },
                        child: Card(
                          color: Colors.white.withOpacity(.6),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            children: [
                              Image(
                                image: NetworkImage(
                                    'https://firebasestorage.googleapis.com/v0/b/alhadaf-a3fa2.appspot.com/o/1.png?alt=media&token=33c932df-ac58-4574-9fe6-aafb7ddb2215'),
                                fit: BoxFit.cover,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    //date screen
                    Container(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => DateAlhadaf()));
                        },
                        child: Card(
                          color: Colors.white.withOpacity(.6),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            children: [
                              Image(
                                image: NetworkImage(
                                    'https://firebasestorage.googleapis.com/v0/b/alhadaf-a3fa2.appspot.com/o/2.png?alt=media&token=04254807-6382-40dc-9ab3-635e7d427b31'),
                                fit: BoxFit.cover,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    //hero screen
                    Container(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => HeroAlhadaf()));
                        },
                        child: Card(
                          color: Colors.white.withOpacity(.6),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            children: [
                              Image(
                                image: NetworkImage(
                                    'https://firebasestorage.googleapis.com/v0/b/alhadaf-a3fa2.appspot.com/o/3.png?alt=media&token=d45b7bbf-e335-4dd0-91a6-9778db9bcb38'),
                                fit: BoxFit.cover,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => Gift()));
                        },
                        child: Card(
                          color: Colors.white.withOpacity(.6),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            children: [
                              Image(
                                image: NetworkImage(
                                    'https://firebasestorage.googleapis.com/v0/b/alhadaf-a3fa2.appspot.com/o/6.png?alt=media&token=976f5cb5-b385-47dd-a30d-2565dca65195'),
                                fit: BoxFit.cover,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    //training
                    Container(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => Training()));
                        },
                        child: Card(
                          color: Colors.white.withOpacity(.6),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            children: [
                              Image(
                                image: NetworkImage(
                                    'https://firebasestorage.googleapis.com/v0/b/alhadaf-a3fa2.appspot.com/o/4.png?alt=media&token=34d38622-0440-407d-97f6-f1579209fc43'),
                                fit: BoxFit.cover,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    //trainer
                    Container(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => TrainingAlhadaf()));
                        },
                        child: Card(
                          color: Colors.white.withOpacity(.6),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            children: [
                              Image(
                                image: NetworkImage(
                                    'https://firebasestorage.googleapis.com/v0/b/alhadaf-a3fa2.appspot.com/o/5-2.png?alt=media&token=3b74c77a-dd60-4b22-9a8a-69fa4d95d1ce'),
                                fit: BoxFit.cover,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]),
              SizedBox(
                height: 10,
              ),
              Image(
                image: NetworkImage(
                    'https://firebasestorage.googleapis.com/v0/b/alhadaf-a3fa2.appspot.com/o/7.png?alt=media&token=bbc8f221-5885-46d1-8406-107a5720844a'),
              ),
              SizedBox(height: 10,),
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
