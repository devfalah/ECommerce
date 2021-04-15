import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping/model/order_model.dart';
import 'package:shopping/model/user_model.dart';

class FireStoreUser {
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('Users');
  final CollectionReference orders =
      FirebaseFirestore.instance.collection('Orders');

  Future<void> addUserToFirestor(UserModel userModel) async {
    return await collectionReference
        .doc(userModel.userId)
        .set(userModel.toJson());
  }

  Future<void> addOrderToFirestor(OrderModel orderModel) async {
    return await orders.doc(orderModel.userId).set(orderModel.toMap());
  }

  Future<DocumentSnapshot> getUserfromFirestor(String userId) async {
    return await collectionReference.doc(userId).get();
  }
}
