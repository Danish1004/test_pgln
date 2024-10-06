import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pingolearn_assignment/utils/ui_utils.dart';
import 'package:pingolearn_assignment/widgets/input_box.dart';
import '../../../common_export.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late final AuthenticationBloc authenticationBloc;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            'e-Shop',
            style: TextStyle(
                color: ColorConstants().blueTextColor,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
      body: BlocListener<AuthenticationBloc, AuthenticationState>(
        bloc: authenticationBloc,
        listener: (context, state) {
          if (state is AuthenticationFailure) {
            UiUtils.showSnackBar(context, content: state.message);
          }
          if (state is AppAuthenticated) {
            context.go('/home');
          }
        },
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _key,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomTextFormField(
                      controller: nameController,
                      labelText: 'Name',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Name is required';
                        }
                        return null;
                      },
                      onFieldChanged: (value) {
                        setState(() {
                          nameController.text = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16.0),
                    CustomTextFormField(
                      controller: emailController,
                      labelText: 'Email',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Email is required';
                        }
                        return null;
                      },
                      onFieldChanged: (value) {
                        setState(() {
                          emailController.text = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16.0),
                    CustomTextFormField(
                      controller: passwordController,
                      labelText: 'Password',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password is required';
                        }
                        return null;
                      },
                      onFieldChanged: (value) {
                        setState(() {
                          passwordController.text = value;
                        });
                      },
                    ),
                    SizedBox(height: 60.0.toResponsiveHeight),
                    ElevatedButton(
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          authenticationBloc.add(UserSignUp(
                            name: nameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                          ));
                        } else {}
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 62.0,
                        ),
                        backgroundColor: ColorConstants().blueTextColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Signup',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account? "),
                        TextButton(
                          onPressed: () {
                            context.go('/login');
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: ColorConstants().blueTextColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
