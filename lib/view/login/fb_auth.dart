import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:khatri_alter/data/model/fb_auth_model.dart';

Future<Resource?> signInWithFacebook() async {
  var auth;
  try {
    final LoginResult result = await FacebookAuth.instance.login();
    switch (result.status) {
      case LoginStatus.success:
        final AuthCredential facebookCredential =
            FacebookAuthProvider.credential(result.accessToken!.token);
        final userCredential =
            await auth.signInWithCredential(facebookCredential);
        return Resource(status: Status.Success);
      case LoginStatus.cancelled:
        return Resource(status: Status.Cancelled);
      case LoginStatus.failed:
        return Resource(status: Status.Error);
      default:
        return null;
    }
  } on FirebaseAuthException catch (e) {
    rethrow;
  }
}
