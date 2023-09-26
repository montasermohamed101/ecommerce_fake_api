import 'package:ecommerce/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  bool isVisibility = false;
  bool isCheck = false;
  var displayUserName = ''.obs;
  var displayUserPhoto = ''.obs;
  var displayUserEmail = ''.obs;
  FirebaseAuth auth = FirebaseAuth.instance;
  final googleSignin = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;

  var isSignedIn = false;
  final GetStorage authStorage = GetStorage();

  User? get userProfile => auth.currentUser;

  @override
  void onInit() {
    super.onInit();
    if (userProfile != null) {
      displayUserName.value = userProfile!.displayName ?? "";
      displayUserPhoto.value = userProfile!.photoURL ?? "";
      displayUserEmail.value = userProfile!.email ?? "";
    } else {
      displayUserName.value = "";
      displayUserPhoto.value = "";
      displayUserEmail.value = "";
    }
  }



  void visibility() {
    isVisibility = !isVisibility;
    update();
  }

  void checkBox() {
    isCheck = !isCheck;
    update();
  }

  void signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ).then((value) {
        displayUserName.value = name;
        auth.currentUser!.updateDisplayName(name);
      });
      update();
      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      }else{
        message = e.message.toString();
      }

      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.indigo,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.indigo,
        colorText: Colors.white,
      );
    }
  }

  void logIn({
    required String email,
    required String password,
}) async{
    try {
      await auth.signInWithEmailAndPassword(
          email: email,
          password: password,
      ).then((value) => displayUserName.value = auth.currentUser!.displayName!);
      isSignedIn = true;
      authStorage.write('auth', isSignedIn);
      update();
      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';
      if (error.code == 'user-not-found') {
        message = 'No user found for that $email.';
      } else if (error.code == 'wrong-password') {
        message = 'Invalid Password...';
      }else{
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.indigo,
        colorText: Colors.white,
      );
    }catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.indigo,
        colorText: Colors.white,
      );
    }
  }

  // Future googleLogIn() async{
  //  try{
  //    final GoogleSignInAccount? googleUser = await googleSignin.signIn();
  //    displayUserName.value = googleUser!.displayName!;
  //    displayUserPhoto = googleUser.photoUrl!;
  //    isSignedIn = true;
  //    authStorage.write('auth', isSignedIn);
  //    update();
  //    Get.offNamed(Routes.mainScreen);
  //  }catch(error){
  //    Get.snackbar(
  //      'Error!',
  //      error.toString(),
  //      snackPosition: SnackPosition.BOTTOM,
  //      backgroundColor: Colors.indigo,
  //      colorText: Colors.white,
  //    );
  //  }
  // }
  Future googleLogIn() async {
    final googleUser = await googleSignin.signIn();
    displayUserName.value = googleUser!.displayName!;
    displayUserPhoto.value = googleUser.photoUrl!;
    displayUserEmail.value = googleUser.email;

    GoogleSignInAuthentication googleSignInAuthentication =
    await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken
    );
    await auth.signInWithCredential(credential);
    isSignedIn = true;
    authStorage.write('auth', isSignedIn);
    update();
        Get.offNamed(Routes.mainScreen);
    // if (googleUser == null) return;
    // _user = googleUser;
    // final googleAuth = await googleUser.authentication;

    // final credential = GoogleAuthProvider.credential(
    //   accessToken: googleAuth.accessToken,
    //   idToken: googleAuth.idToken,
    // );
    //storage.write('uid', _user!.id);
    await FirebaseAuth.instance.signInWithCredential(credential);
    update();
  }
  // Future googleLogIn() async {
  //   final googleUser = await googleSignin.signIn();
  //   if (googleUser == null) return;
  //   _user = googleUser;
  //   final googleAuth = await googleUser.authentication;
  //
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth.accessToken,
  //     idToken: googleAuth.idToken,
  //   );
  //   //storage.write('uid', _user!.id);
  //   await FirebaseAuth.instance.signInWithCredential(credential);
  //   update();
  // }



  void resetPassword(String email) async{
    try {
      await auth.sendPasswordResetEmail(email: email);
      update();
      Get.back();
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';
      if (error.code == 'user-not-found') {
        message = 'No user found for that.$email';
      }else{
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.indigo,
        colorText: Colors.white,
      );
    }catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.indigo,
        colorText: Colors.white,
      );
    }
  }

  void signOut()async {
    try{
     await auth.signOut();
     await googleSignin.signOut();
     displayUserName.value = '';
     displayUserPhoto.value = '';
     displayUserEmail.value = '';
     isSignedIn = false;
     authStorage.remove('auth');
     update();
     Get.offNamed(Routes.welcomeScreen);

    }catch(error){
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.indigo,
        colorText: Colors.white,
      );

    }
  }
}
