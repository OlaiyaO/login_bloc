import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          emailField(bloc),
          passwordField(bloc),
          const SizedBox(
            height: 25.0,
          ),
          submitButton(bloc),
        ],
      ),
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder<String>(
        stream: bloc.email,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return TextField(
            onChanged: (value) {
              bloc.changeEmail(value);
            },
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'you@example.com',
              labelText: 'EMail Address',
              errorText: snapshot.hasError ? '${snapshot.error}' : '',
            ),
          );
        });
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder<Object>(
        stream: bloc.password,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.changePassword,
            decoration: InputDecoration(
              hintText: 'Password',
              labelText: 'Password',
              errorText: snapshot.hasError ? '${snapshot.error}' : '',
            ),
          );
        });
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.submitValid,
        builder: (context, snapshot) {
          return ElevatedButton(
            onPressed: snapshot.hasData ? bloc.submit : null,
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                Colors.blue,
              ),
            ),
            child: const Text(
              'Login',
            ),
          );
        });
  }
}
