import 'package:bloc_clean/main.dart';
import 'package:bloc_clean/repository/auth/login_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/login_bloc.dart';
import 'widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc _loginBloc;
  // focusnode  create krenge
  final emailFocusnode = FocusNode();
  final passwordFocusNode = FocusNode();
  // formkey create krenge
  final _formkey = GlobalKey<FormState>();

  @override
  void initState(){
    super.initState();
    // concept of getIt
    _loginBloc = LoginBloc(loginRepository: getIt());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
     body: BlocProvider(
       create: (_) => _loginBloc,
         child: Padding(
     padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Email
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              focusNode: emailFocusnode,
              decoration: const InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter mail';
                }
                return null;
              },
            ),

            const SizedBox(height: 20),

            // Password (from widget)
            InputPasswordWidget(passwordFocusNode: passwordFocusNode),

            const SizedBox(height: 20),

            // Single Login Button
            LoginButton(formKey: _formkey),
          ],
        )

      ),
    ),
     )
    );
  }
}
