import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stock_dashboard/controllers/stocks_controller.dart';
import 'package:stock_dashboard/screens/stocks_screen.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final StockController stockController =Get.put(StockController());

// get current user
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }
  // sign in with google
  signInWithGoogle() async {
    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
      // if user cancel login
      if (gUser == null) return;
      final GoogleSignInAuthentication? gAuth = await gUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth?.accessToken,
        idToken: gAuth?.idToken,
      );
      // Sign in to Firebase with the credentials
      UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);

      // If the sign-in is successful, navigate to the Stock List Page
      if (userCredential.user != null) {
        String? photoUrl = gUser.photoUrl;
        String? displayName = gUser.displayName;
        String? email = gUser.email;
       
        stockController.updateUserInfo(photoUrl??'', displayName??'',email);
        Get.to(() => StockListPage());
      }
    } catch (e) {
      print(e);
    }
  }

  signOut() async {
    await GoogleSignIn().signOut();
    await _firebaseAuth.signOut();
  }
}
