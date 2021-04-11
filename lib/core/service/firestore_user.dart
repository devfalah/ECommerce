import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping/model/user_model.dart';

class FireStoreUser {
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('Users');

  Future<void> addUserToFirestor(UserModel userModel) async {
    return await collectionReference
        .doc(userModel.userId)
        .set(userModel.toJson());
  }

  Future<DocumentSnapshot> getUserfromFirestor(String userId) async {
    return await collectionReference.doc(userId).get();
  }
}
