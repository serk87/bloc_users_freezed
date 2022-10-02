import 'dart:developer';

import 'package:bloc_network_users/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        log(state.toString());
        if (state is UserStateLoaded) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Users is Loaded')));
        }
      },
      builder: (context, state) {
        return Expanded(
            child: state.when(empty: () {
          return const Text(
            'No data received. Please button "Load"',
            style: TextStyle(fontSize: 20),
          );
        }, loading: () {
          return const Center(child: CircularProgressIndicator());
        }, loaded: (userLoaded) {
          // ignore: no_leading_underscores_for_local_identifiers
          final _userLoaded = userLoaded;
          return ListView.builder(
            itemCount: _userLoaded.length,
            itemBuilder: (context, index) => Container(
              color: index % 2 == 0 ? Colors.white : Colors.blue[50],
              child: ListTile(
                leading: Text(
                  'ID: ${_userLoaded[index].id}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                title: Column(
                  children: [
                    Text(
                      _userLoaded[index].name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Column(
                      children: [
                        Text(
                          'Email: ${_userLoaded[index].email}',
                          style: const TextStyle(fontStyle: FontStyle.italic),
                        ),
                        Text(
                          'Phone: ${_userLoaded[index].phone}',
                          style: const TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }, error: () {
          return const Center(
            child: Text(
              'Error fetching users',
              style: TextStyle(fontSize: 20.0),
            ),
          );
        }));
      },
    );
  }
}
