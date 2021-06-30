import 'package:alhadaf/model/PlayerModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

List<PlayerModel> searchList = [];


class Database{
  static CollectionReference _reference = FirebaseFirestore.instance.collection("personTalent");
  static String code;
  static String country;
  static String dob;
  static int rat;
  static String video;
  static String position;


  static Future fetchData()async{
    QuerySnapshot querySnapshot =
        await _reference.get();
    /// this loop is used to add phoneNumbers to _fireDocs list
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      var a = querySnapshot.docs[i].data();
      // print("${a["code"]} ${a["country"]} ${a["DOB"]} ${a["position"]} ${a["rat"]} ${a["video"]}");
      _reference.doc(querySnapshot.docs[i].id).get().then((value){
        print(value.get("code"));
        code = value.get("code");
        country = value.get("country");
        dob = value.get("DOB");
        rat = value.get("rat");
        video = value.get("video");
        position = value.get("position");
      }).whenComplete((){
        searchList.add(new PlayerModel(
            code: code,
            country: country,
            dateOfBirth: dob,
            position:position,
            rat:rat,
            videoUrl: video
        ));
      });

    }
    return searchList;
  }

}