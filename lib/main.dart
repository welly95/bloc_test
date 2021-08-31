import 'package:bloc_test/blocs/users/user_bloc.dart';
import 'package:bloc_test/blocs/users/user_events.dart';
import 'package:bloc_test/blocs/users/user_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'models/user_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final UserBloc _newBloc = UserBloc(UserInitState());
  @override
  void initState() {
    _newBloc.add(GetUserList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildUsersList(),
    );
  }

  Widget _buildUsersList() {
    return Container(
      child: BlocProvider(
        create: (_) => _newBloc,
        child: BlocListener<UserBloc, UserStates>(
          listener: (context, state) {
            if (state is UserErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.msg!),
                ),
              );
            }
          },
          child: BlocBuilder<UserBloc, UserStates>(
            builder: (context, state) {
              if (state is UserInitState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is UserLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is UserSuccessState) {
                return _buildCard(context, state.userModel!);
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, UserModel model) {
    return ListView.builder(
      itemCount: model.users!.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(8.0),
          child: Card(
            child: Container(
              margin: EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    child: Image.network(
                      '${(model.users![index].avatar).toString()}',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text("Id: ${(model.users![index].id).toString()}", style: TextStyle(color: Colors.black)),
                  Text("Email: ${model.users![index].email}"),
                  Text("First Name: ${model.users![index].firstName}"),
                  Text("Last Name: ${model.users![index].lastName}"),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
