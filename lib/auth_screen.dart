import 'dart:math';

import 'package:animated_login_and_registration/constants.dart';
import 'package:animated_login_and_registration/widgets/login_form.dart';
import 'package:animated_login_and_registration/widgets/sign_up_form.dart';
import 'package:animated_login_and_registration/widgets/social_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with SingleTickerProviderStateMixin {
  bool _isShowSignUp = false;

  late AnimationController _animationController;
  late Animation<double> _animationTextRotate;

  void setUpAnimation() {
    _animationController =
        AnimationController(vsync: this, duration: AppConstants.defaultDuration);
    _animationTextRotate = Tween<double>(begin: 0, end: 90).animate(_animationController);
  }

  void updateView() {
    setState(() {
      _isShowSignUp = !_isShowSignUp;
    });
    _isShowSignUp ? _animationController.forward() : _animationController.reverse();
  }

  @override
  void initState() {
    setUpAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: AnimatedBuilder(
          animation: _animationController,
          builder: (context, _) {
            return Stack(
              children: [
                //* Login
                AnimatedPositioned(
                  duration: AppConstants.defaultDuration,
                  width: _size.width * 0.88,
                  height: _size.height,
                  left: _isShowSignUp ? -_size.width * 0.76 : 0,
                  child: Container(
                    color: AppConstants.login_bg,
                    child: const LoginForm(),
                  ),
                ),

                //* Sign Up
                AnimatedPositioned(
                  duration: AppConstants.defaultDuration,
                  height: _size.height,
                  width: _size.width * 0.88,
                  left: _isShowSignUp ? _size.width * 0.12 : _size.width * 0.88,
                  child: Container(
                    color: AppConstants.signup_bg,
                    child: const SignUpForm(),
                  ),
                ),

                //* Logo
                AnimatedPositioned(
                  duration: AppConstants.defaultDuration,
                  top: _size.height * 0.1,
                  left: 0,
                  right: _isShowSignUp ? -_size.width * 0.06 : _size.width * 0.06,
                  child: AnimatedSwitcher(
                    duration: AppConstants.defaultDuration,
                    child: CircleAvatar(
                      backgroundColor: Colors.white60,
                      radius: 25,
                      child: _isShowSignUp
                          ? SvgPicture.asset(
                              "assets/animation_logo.svg",
                              color: AppConstants.signup_bg,
                            )
                          : SvgPicture.asset(
                              "assets/animation_logo.svg",
                              color: AppConstants.login_bg,
                            ),
                    ),
                  ),
                ),

                //* Social Buttons
                AnimatedPositioned(
                  duration: AppConstants.defaultDuration,
                  width: _size.width,
                  bottom: _size.height * 0.1,
                  right: _isShowSignUp ? -_size.width * 0.06 : _size.width * 0.06,
                  child: const SocialButtons(),
                ),

                //* Login Text
                AnimatedPositioned(
                  duration: AppConstants.defaultDuration,
                  bottom: _isShowSignUp ? _size.height / 2 - 80 : _size.height * 0.3,
                  left: _isShowSignUp ? 0 : _size.width * 0.44 - 80,
                  child: AnimatedDefaultTextStyle(
                    duration: AppConstants.defaultDuration,
                    style: TextStyle(
                      fontSize: _isShowSignUp ? 20 : 32,
                      fontWeight: FontWeight.bold,
                      color: _isShowSignUp ? Colors.white : Colors.white70,
                    ),
                    child: Transform.rotate(
                      angle: -_animationTextRotate.value * pi / 180,
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        onTap: () {
                          if (_isShowSignUp) {
                            updateView();
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: AppConstants.defaultPadding * 0.75),
                          width: 160,
                          child: Text(
                            "Log In".toUpperCase(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                //* Sign Up Text
                AnimatedPositioned(
                  duration: AppConstants.defaultDuration,
                  bottom: !_isShowSignUp ? _size.height / 2 - 80 : _size.height * 0.3,
                  right: _isShowSignUp ? _size.width * 0.44 - 80 : 0,
                  child: AnimatedDefaultTextStyle(
                    duration: AppConstants.defaultDuration,
                    style: TextStyle(
                      fontSize: !_isShowSignUp ? 20 : 32,
                      fontWeight: FontWeight.bold,
                      color: _isShowSignUp ? Colors.white : Colors.white70,
                    ),
                    child: Transform.rotate(
                      angle: (90 - _animationTextRotate.value) * pi / 180,
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () {
                          if (!_isShowSignUp) {
                            updateView();
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: AppConstants.defaultPadding * 0.75),
                          width: 160,
                          child: Text(
                            "Sign Up".toUpperCase(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
