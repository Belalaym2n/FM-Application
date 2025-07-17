import 'package:acility_management_application/configeration/app_configeration.dart';
import 'package:acility_management_application/core/errors/error_handling.dart';
import 'package:acility_management_application/features/signUp/data/data_sources/signUpDS.dart';
import 'package:acility_management_application/features/signUp/data/models/ownerModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpDSImp implements SignUpDS {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<Result> createAcc(OwnerModel owner) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: owner.gmail,
        password: owner.password,
      );
      final user = credential.user;
      await  uploadOwnerOnFirebase(owner);

      print("success");
      if (user != null) {
        await user.sendEmailVerification();
      }
      return Result.success(credential.user?.email.toString());
    } on FirebaseAuthException catch (e) {
      // ✅ ترجمة الخطأ برسالة مفهومة
      String errorMessage;
      switch (e.code) {
        case 'email-already-in-use':
          errorMessage = 'This email is already registered.';
          break;
        case 'weak-password':
          errorMessage = 'Password must be at least 6 characters.';
          break;
        case 'invalid-email':
          errorMessage = 'Please enter a valid email address.';
          break;
        default:
          errorMessage = 'Something went wrong. Please try again.';
      }
      return Result.failure(errorMessage);
    } catch (e) {
      return Result.failure("Unexpected error: ${e.toString()}");
    }
  }

  @override
  Future<Result> uploadOwnerOnFirebase(OwnerModel owner) async {
    final collectionName = AppConfiguration.ownersCollectionName;
    // TODO: implement uploadOwnerOnFirebase
    try {
      _firestore.collection(collectionName).doc().set(owner.toJson());
      return Result.success("success");
    } catch (e) {
      print("error ${e.toString()}");
      return Result.failure(e.toString());
    }
  }
}
