import 'package:acility_management_application/core/errors/error_handling.dart';

import 'package:acility_management_application/features/login/data/models/loginModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../configeration/app_configeration.dart';
import '../../../../../core/firebseManager/firbaseManager.dart';
import '../../../../signUp/data/models/ownerModel.dart';
import 'loginRDS.dart';

class LoginRDSImpl implements LoginRDS {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<Result> login(LoginModel model) async {
    try {
      final userCredential = await auth.signInWithEmailAndPassword(
        email: model.email,
        password: model.password,
      );
      if (userCredential.user!.emailVerified) {
        bool isValidUser = await isValid(userCredential.user!.uid);
        if (isValidUser == true) {
          return Result.success(userCredential);
        } else {
          return Result.failure(
            "Your account it's not valid , please contact with admin your compound",
          );
        }
      } else {
        return Result.failure("PLease go to email message and verify account");
      }
    } on FirebaseAuthException catch (e) {
      print("error firebase ${e.toString()}");

      return Result.failure(
        "Login failed. email or password not correct , Please try again.",
      );
    } catch (e) {
      print("error ${e.toString()}");
      return Result.failure("email or password not correct");
    }
  }

  @override
  Future<bool> isValid(String userId) async {
    final collectionName = AppConfiguration.ownersCollectionName;

    final ownersCollection = FirebaseManager.getCollection<OwnerModel>(
      collectionName: collectionName,
      fromJson: (json) => OwnerModel.fromJson(json),
      toJson: (model) => model.toJson(),
    );

    final docSnapshot = await ownersCollection.doc(userId).get();

    if (docSnapshot.exists) {
      final owner = docSnapshot.data();
      if (owner?.isValid == false) {
        return false;
      } else {
        return true;
      }
    }

    return false;
  }

  @override
  Future<Result> sendPasswordResetEmail(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      return Result.success("Password reset email sent.");
    } catch (e) {
      return Result.failure("Failed to send password reset email.");
    }
  }

  @override
  Future<Result> sendVerificationEmail() async {
    try {
      final user = auth.currentUser;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
        return Result.success("Verification email sent.");
      } else {
        return Result.failure("User not found or already verified.");
      }
    } catch (e) {
      return Result.failure("Failed to send verification email.${e.toString()}");
    }
  }

}
