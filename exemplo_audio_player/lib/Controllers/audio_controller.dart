import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exemplo_audio_player/Models/audio_model.dart';

class AudioController {
  List<AudioModel> _list = [];
  List<AudioModel> get list => _list;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  get results => null;

  //fetchfromFireStore
  Future<void> fetchFromFireStore() async { 
    QuerySnapshot querySnapshot = await _firestore.collection('audios').get();
    querySnapshot.docs.forEach((doc) {
      _list = results.map((doc)=>AudioModel.fromMap(doc.data())).toList();
    });
  }
}