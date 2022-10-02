import 'package:bloc_network_users/bloc/user_bloc.dart';
import 'package:bloc_network_users/services/user_repository.dart';
import 'package:bloc_network_users/widgets/action_buttons.dart';
import 'package:bloc_network_users/widgets/user_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => UserRepository(),
      child: BlocProvider(
        create: (context) =>
            UserBloc(userRepository: context.read<UserRepository>())
              ..add(const UserEventLoad()),
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Users"),
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                ActionButtons(),
                UserList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
