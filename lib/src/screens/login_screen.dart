import 'package:flutter/material.dart';
import '../blocs/bloc.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          emailField(),
          passwordField(),
          const SizedBox(height: 25.0,),
          submitButton(),
        ],
      ),
    );
  }

  Widget emailField() {
    return StreamBuilder<String>(
      stream: bloc.email,
      builder: (context, AsyncSnapshot<String> snapshot) {
        return TextField(
          onChanged: (value){
            bloc.changeEmail(value);
          },
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'you@example.com',
            labelText: 'EMail Address',
            errorText: '${snapshot.error}',
          ),
        );
      }
    );
  }

  Widget passwordField() {
    return StreamBuilder<Object>(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changePassword,
          decoration: InputDecoration(
            hintText: 'Password',
            labelText: 'Password',
            errorText: '${snapshot.error}',
          ),
        );
      }
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      onPressed: () {},
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
          Colors.blue,
        ),
      ),
      child: const Text(
        'Login',
      ),
    );
  }
}
