import 'package:flutter/material.dart';

import 'package:notesapp/views/login_view.dart';
import 'package:notesapp/views/register_view.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
        routes: {
          //the value of every key inside the routes needs to be a function
          '/login/': (context) => const LoginView(),
          '/register/': (context) => const RegisterView(),
        }),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            //final user = FirebaseAuth.instance.currentUser;
            // If the value on the lefhandside exists take it otherwiseR return false
            // if (user?.emailVerified ?? false) {
            //  return const Text('Done');
            //} else {
            //  return const VerifyEmailView();
            // }
            return const LoginView();
          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}
