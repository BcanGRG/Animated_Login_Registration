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

class _AuthScreenState extends State<AuthScreen> {
  bool _isShowSignUp = false;
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          //* Login
          AnimatedPositioned(
            duration: AppConstants.defaultDuration,
            width: _size.width * 0.88,
            height: _size.height,
            left: _isShowSignUp ? -_size.width * 0.76 : 0,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isShowSignUp = !_isShowSignUp;
                });
              },
              child: Container(
                color: AppConstants.login_bg,
                child: LoginForm(),
              ),
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
              child: SignUpForm(),
            ),
          ),

          //* Logo
          AnimatedPositioned(
            duration: AppConstants.defaultDuration,
            top: _size.height * 0.1,
            left: 0,
            right: _isShowSignUp ? -_size.width * 0.06 : _size.width * 0.06,
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

          //* Social Buttons
          AnimatedPositioned(
            duration: AppConstants.defaultDuration,
            width: _size.width,
            bottom: _size.height * 0.1,
            right: _isShowSignUp ? -_size.width * 0.06 : _size.width * 0.06,
            child: SocialButtons(),
          )
        ],
      ),
    );
  }
}
