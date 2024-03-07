import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // get collection of donations
  final CollectionReference donations =
      FirebaseFirestore.instance.collection('donations');

  // add a donation
  Future<void> addDonation({
    required String foodName,
    required String foodQuantity,
    required String foodExpiry,
    required String address,
    required String contact,
  }) {
    return donations.add({
      'foodName': foodName,
      'foodQuantity': foodQuantity,
      'foodExpiry': foodExpiry,
      'address': address,
      'contact': contact,
      'timestamp': Timestamp.now(),
    });
  }

  // read all the donations
  Stream<QuerySnapshot> getDonationsStream() {
    final donationsStream =
        donations.orderBy('timestamp', descending: true).snapshots();

    return donationsStream;
  }

  // update a donation given an id
  // You can implement this if needed

  // delete a donation given an id
  Future<void> deleteDonation(String donationId) {
    return donations.doc(donationId).delete();
  }
  // You can implement this if needed


   // get collection of donations
  final CollectionReference carts =
      FirebaseFirestore.instance.collection('cart_items');

  // add a donation
  Future<void> addtoCart({
    required String foodName,
    required String foodQuantity,
    required String foodExpiry,
    required String address,
    required String contact,
  }) {
    return carts.add({
      'foodName': foodName,
      'foodQuantity': foodQuantity,
      'foodExpiry': foodExpiry,
      'address': address,
      'contact': contact,
      'timestamp': Timestamp.now(),
    });
  }
}
