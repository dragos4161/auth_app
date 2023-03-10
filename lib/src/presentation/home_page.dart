import 'package:auth_app/src/actions/index.dart';
import 'package:auth_app/src/models/index.dart';
import 'package:auth_app/src/presentation/containers/user_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return UserContainer(
      builder: (BuildContext context, AppUser? user) {
        return Scaffold(
          appBar: AppBar(
            title: Text(user!.displayName),
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/profile');
                },
                icon: const Icon(Icons.account_circle_outlined),
              ),
              IconButton(
                onPressed: () {
                  StoreProvider.of<AppState>(context).dispatch(const Logout());
                },
                icon: const Icon(Icons.power_settings_new_outlined),
              ),
            ],
          ),
          body: SizedBox(
            height: MediaQuery.of(context).size.width,
            width: MediaQuery.of(context).size.width,
            child: user.imageUrl == null
                ? const SizedBox.shrink()
                : Image.network(
                    user.imageUrl!,
                    fit: BoxFit.cover,
                  ),
          ),
        );
      },
    );
  }
}
