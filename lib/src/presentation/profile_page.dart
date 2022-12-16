import 'package:auth_app/src/actions/index.dart';
import 'package:auth_app/src/models/index.dart';
import 'package:auth_app/src/presentation/containers/user_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _image = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _name.dispose();
    _image.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return UserContainer(
      builder: (BuildContext context, AppUser? user) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Profile page'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Center(
                    child: Text(
                      'Hello, ${user!.displayName}',
                      style: const TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: user.imageUrl == null
                        ? const SizedBox.shrink()
                        : Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.network(
                              user.imageUrl!,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _name,
                    decoration: const InputDecoration(
                      labelText: 'New name',
                    ),
                    validator: (String? value) {
                      if (value == null || value.length < 3) {
                        return 'Name must be least 3 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _image,
                    decoration: const InputDecoration(
                      labelText: 'New image',
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _password,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'New password',
                    ),
                    validator: (String? value) {
                      if (value == null || value.length < 5) {
                        return 'Passsword must be least 6 characters';
                      }
                      return null;
                    },
                  ),
                  const Spacer(),
                  Builder(
                    builder: (BuildContext context) {
                      return Row(
                        children: <Widget>[
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                final UpdateUsername usernameAction = UpdateUsername(name: _name.text);
                                StoreProvider.of<AppState>(context).dispatch(usernameAction);
                              },
                              child: const Text(
                                'Update Name',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                final UpdatePhoto photoAction = UpdatePhoto(url: _image.text);
                                StoreProvider.of<AppState>(context).dispatch(photoAction);
                              },
                              child: const Text(
                                'Update Photo',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                final UpdatePassword passwordAction = UpdatePassword(password: _password.text);
                                StoreProvider.of<AppState>(context).dispatch(passwordAction);
                              },
                              child: const Text(
                                'Update password',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
