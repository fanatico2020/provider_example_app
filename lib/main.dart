import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/provider/provider_page.dart';
import 'package:provider_example/provider/user_model.dart';

import 'change_notifier/change_notifier_page.dart';
import 'change_notifier/provider_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) {
            return UserModel(
                name: 'Italo Ramon',
                imgAvatar:
                    'https://w7.pngwing.com/pngs/340/946/png-transparent-avatar-user-computer-icons-software-developer-avatar-child-face-heroes-thumbnail.png',
                birthDate: '22/03/1993');
          },
        ),
        ChangeNotifierProvider(
          create: (_) => ProviderController(),
        ),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routes: {
            '/provider': (_) => ProviderPage(),
            '/change': (_) => ChangeNotifierPage(),
          },
          home: Builder(
            builder: (context) {
              return Scaffold(
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/provider');
                          },
                          child: Text('Provider')),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/change');
                          },
                          child: Text('Change notifier')),
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }
}
