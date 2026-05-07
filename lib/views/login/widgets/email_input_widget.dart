import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/login_bloc.dart';
import '../../../utils/validations.dart';

class EmailInputWidget extends StatelessWidget {
  final FocusNode emailFocusNode; // fixed name

  const EmailInputWidget({Key? key, required this.emailFocusNode})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginStates>(
      buildWhen: (current, previous) => current.email != previous.email,
      builder: (context, state) {
        return TextFormField(
          keyboardType: TextInputType.emailAddress,
          focusNode: emailFocusNode, // fixed name
          decoration: const InputDecoration(
            hintText: 'Email',
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            context.read<LoginBloc>().add(EmailChanged(email: value));
          },
          validator: (value) {
            if (value!.isEmpty) {
              return 'Enter mail';
            }
            if(!Validations.emailValidator(value)){
              return 'Email is not correct';
            }
            return null;
          },
          onFieldSubmitted: (value) {},
        );
      },
    );
  }
}
