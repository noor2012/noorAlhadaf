import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Trainning extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top:8.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("تدريبات رياضية").snapshots(),
          builder: (_,snapshot){
            if(!snapshot.hasData){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView(
              children: snapshot.data.docs.map((document){
                var url = document['url'];
                var text = document['text'];
                YoutubePlayerController controller = YoutubePlayerController(
                  initialVideoId: YoutubePlayer.convertUrlToId(url),
                  flags: YoutubePlayerFlags(
                    autoPlay: false,
                    mute:  true
                  ),
                );
                return Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: MediaQuery.of(context).size.height / 4,
                      child: YoutubePlayer(
                        controller: controller,
                        liveUIColor: Colors.amber,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(text,style: TextStyle(fontSize: 12,color: Colors.green[800]),
                    ),
                  ],
                );
              } ).toList(),
            );
          },
        ),
      ),
    );
  }
}
