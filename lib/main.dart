import 'package:bloc_test/blocs/characters/character_cubit.dart';
import 'package:bloc_test/repository/characters/characters_repository.dart';
import 'package:bloc_test/repository/web_services/char_web_services.dart';
import 'package:bloc_test/screens/characters/characters_screen.dart';
import 'package:bloc_test/screens/covid/covid_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => CovidScreen()));
                    },
                    child: Text('Covid Screen')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (BuildContext context) =>
                              CharacterCubit(CharactersRepository(CharactersWebServices())),
                          child: CharactersScreen(),
                        ),
                      ));
                    },
                    child: Text('Characters Screen')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
