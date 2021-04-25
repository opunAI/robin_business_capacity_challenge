import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:opun_challenge/screens/email_signin_screen.dart';
import 'package:opun_challenge/screens/home_screen.dart';
import 'package:opun_challenge/screens/settings_screen.dart';
import 'package:opun_challenge/screens/welcome_screen.dart';
import 'package:opun_challenge/services/auth.dart';
import 'package:opun_challenge/services/database.dart';
import 'package:provider/provider.dart';


class LandingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);

    return StreamBuilder<User>(
      stream: auth.authStateChanges(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.active) {
          final User user = snapshot.data;
          if(user == null) {
            return EmailSignInScreen();
          }
          return Provider<Database>(
            create: (_) => FirestoreDatabase(uid: user.uid),
              child: MyHomePage()
          );
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );

  }
}