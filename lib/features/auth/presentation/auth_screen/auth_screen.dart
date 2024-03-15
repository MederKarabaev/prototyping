// ignore_for_file: deprecated_member_use

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prototyping/core/functions/cash_func.dart';
import 'package:prototyping/core/functions/push_router_func.dart';
import 'package:prototyping/routes/mobile_auto_router.gr.dart';
import 'package:prototyping/widgets/app_unfocuser.dart';
import 'package:prototyping/widgets/custom_button.dart';
import 'package:prototyping/widgets/spaces.dart';

@RoutePage()
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AppUnfocuser(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: SvgPicture.asset(
              'assets/images/back_pop.svg',
              color: Colors.black.withOpacity(.8),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: SafeArea(
          top: false,
          child: SingleChildScrollView(
            child: SizedBox(
              height: context.height - 50,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Log in',
                      style: TextStyle(fontSize: 36),
                    ),
                    const SizedBox(height: 22),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DecoratedBox(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 2, color: Colors.black)),
                          child: TextField(
                            controller: emailController,
                            decoration: const InputDecoration(
                                hintText: 'Email',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(17)),
                          ),
                        ),
                        const SizedBox(height: 16),
                        DecoratedBox(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 2, color: Colors.black)),
                          child: TextField(
                            controller: passwordController,
                            decoration: const InputDecoration(
                                hintText: 'Password',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(17)),
                          ),
                        ),
                        const SizedBox(height: 16),
                        CustomButton(
                          color: Colors.black,
                          radius: 6,
                          onPress: () {
                            CacheFunc.saveBooleanValue(true);
                            AppRouting.pushAndPopUntilFunction(
                                const HomeVeRoute());
                          },
                          text: 'LOG IN',
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
