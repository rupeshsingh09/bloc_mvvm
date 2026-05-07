import 'package:bloc_clean/config/routes/routes_name.dart';
import 'package:bloc_clean/utils/enums.dart';
import 'package:bloc_clean/utils/flush_bar_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/login_bloc.dart';

class LoginButton extends StatelessWidget {
  final GlobalKey<FormState> formKey; // type added

  const LoginButton({Key? key, required this.formKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginStates>(
      listenWhen: (current, previous) =>
          current.postApiStatus != previous.postApiStatus,
      listener: (context, state) {
        if (state.postApiStatus == PostApiStatus.error) {
          FlushBarHelper.flushBarErrorMessage(
            state.message.toString(),
            context,
          );
        }
        if (state.postApiStatus == PostApiStatus.success) {
          Navigator.pushNamed(context, RoutesName.homeScreen);
        }
      },
      child: BlocBuilder<LoginBloc, LoginStates>(
        buildWhen: (current, previous) => false,
        builder: (context, state) {
          return ElevatedButton(
            onPressed: () {
              // condition: if form is valid
              if (formKey.currentState!.validate()) {
                context.read<LoginBloc>().add(LoginApi());
              }
            },
            child: state.postApiStatus == PostApiStatus.loading
                ? CircularProgressIndicator()
                : const Text('Login'),
          );
        },
      ),
    );
  }
}
