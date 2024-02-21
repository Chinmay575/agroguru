// ignore_for_file: unused_field

import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  double? _deviceHeight, _deviceWidth;
  bool _hidePassword = true;

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  String? _userName, _email, _password;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            // color: Colors.red,
            padding: EdgeInsets.symmetric(vertical: _deviceHeight! * 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _showWelcomeText(),
                _getAccountInfo(),
                _signupButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _showWelcomeText() {
    return Container(
      alignment: Alignment.center,
      // color: Colors.green,
      child: const Column(
        children: [
          Text(
            "Welcome!",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          Text(
            "Please enter your account here",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  Widget _getAccountInfo() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: _deviceHeight! * 0.01,
        horizontal: _deviceWidth! * 0.05,
      ),
      child: Form(
        key: _globalKey,
        child: Column(
          children: [
            // _profileImageWidget(),
            _getUserNameTextField(),
            _getEmailTextField(),
            _getPasswordTextField(),
            // _passwordValidator(),
          ],
        ),
      ),
    );
  }

  // Future getgall() async {
  //   // ignore: deprecated_member_use
  //   try {
  //     var img = await _imagePicker.pickImage(source: ImageSource.gallery);
  //     setState(() {
  //       _image = File(img!.path);
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // Widget _profileImageWidget() {
  //   var _imageProvider = (_image != null)
  //       ? FileImage(_image!)
  //       : const NetworkImage(
  //           "https://i.pravatar.cc/150?img=57",
  //         );
  //   return GestureDetector(
  //     onTap: getgall,
  //     child: Container(
  //       height: _deviceHeight! * 0.30,
  //       width: _deviceWidth! * 0.30,
  //       // padding: EdgeInsets.symmetric(vertical: _deviceHeight! * 0.01),
  //       decoration: BoxDecoration(
  //         shape: BoxShape.circle,
  //         image: DecorationImage(
  //           image: _imageProvider as ImageProvider,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _getEmailTextField() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: _deviceHeight! * 0.01),
      child: TextFormField(
        onSaved: (_value) {
          setState(() {
            _email = _value;
          });
        },
        validator: (_value) {
          bool _result = _value!.contains(
            RegExp(
                r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"),
          );
          return _result ? null : "Please enter a valid email";
        },
        decoration: const InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
            borderSide: BorderSide(
              width: 2,
              color: Colors.green,
            ),
          ),
          contentPadding: EdgeInsets.all(20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          hintText: "  Email",
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
          prefixIcon: Padding(
            padding: EdgeInsetsDirectional.only(start: 20),
            child: Icon(
              Icons.email_outlined,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget _getUserNameTextField() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: _deviceHeight! * 0.01),
      child: TextFormField(
        onSaved: (_value) {
          setState(() {
            _userName = _value;
          });
        },
        validator: (_value) {
          bool _result = _value!.isNotEmpty;
          return _result ? null : "Please enter a valid username";
        },
        decoration: const InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
            borderSide: BorderSide(
              width: 2,
              color: Colors.green,
            ),
          ),
          contentPadding: EdgeInsets.all(20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          hintText: "  Username",
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
          prefixIcon: Padding(
            padding: EdgeInsetsDirectional.only(start: 20),
            child: Icon(
              Icons.person_2_outlined,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  // int _countUpperCaseLetters(String text) {
  //   int count = 0;

  //   for (int i = 0; i < text.length; i++) {
  //     if (text[i].toUpperCase() == text[i]) {
  //       count++;
  //     }
  //   }

  //   return count;
  // }

  // int _countLowerCaseLetters(String text) {
  //   int count = 0;

  //   for (int i = 0; i < text.length; i++) {
  //     if (text[i].toLowerCase() == text[i]) {
  //       count++;
  //     }
  //   }

  //   return count;
  // }

  // int _countNumbers(String text) {
  //   int count = 0;

  //   for (int i = 0; i < text.length; i++) {
  //     if (text[i].contains(RegExp(r'[0-9]'))) {
  //       count++;
  //     }
  //   }

  //   return count;
  // }

  // int _countSpecialCharacters(String text) {
  //   int count = 0;

  //   for (int i = 0; i < text.length; i++) {
  //     if (text[i].contains(RegExp(r'[!@#$%^&*()\-+=,.<>/?]'))) {
  //       count++;
  //     }
  //   }

  //   return count;
  // }

  Widget _getPasswordTextField() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: _deviceHeight! * 0.01),
      child: TextFormField(
        onChanged: (_value) {
          setState(() {
            // _validLength = (_value.length > 8);
            // _validLowerCase = (_countLowerCaseLetters(_value) > 0);
            // _validUpperCase = (_countUpperCaseLetters(_value) > 0);
            // _validNumbers = (_countNumbers(_value) > 0);
            // _validSpecChars = (_countSpecialCharacters(_value) > 0);
          });
        },
        onSaved: (_value) {
          _password = _value;
        },
        // validator: (_value) {
        //   bool _isValid = false;
        //   if (_value!.isNotEmpty) {
        //     if (_value.length > 8 &&
        //         _countUpperCaseLetters(_value) > 0 &&
        //         _countLowerCaseLetters(_value) > 0 &&
        //         _countNumbers(_value) > 0 &&
        //         _countSpecialCharacters(_value) > 0) {
        //       _isValid = true;
        //     }
        //   }
        // return _isValid ? null : "Please enter a valid password";
        // },
        obscureText: _hidePassword,
        decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
            borderSide: BorderSide(
              width: 2,
              color: Colors.green,
            ),
          ),
          contentPadding: const EdgeInsets.all(20),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          hintText: "  Password",
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
          prefixIcon: const Padding(
            padding: EdgeInsetsDirectional.only(start: 20),
            child: Icon(
              Icons.lock_outlined,
              color: Colors.black,
            ),
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _hidePassword = !_hidePassword;
              });
            },
            icon: Icon(
              _hidePassword
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
            ),
          ),
        ),
      ),
    );
  }

  // Widget _passwordValidator() {
  //   return Container(
  //     padding: EdgeInsets.symmetric(vertical: _deviceHeight! * 0.01),
  //     child: Column(
  //       children: [
  //         const Text("Your Password must contain: "),
  //         _checks(_validLength ? _done() : _notDone(), "Atleast 8 characters"),
  //         _checks(_validUpperCase ? _done() : _notDone(),
  //             "Contains uppercase letters"),
  //         _checks(_validLowerCase ? _done() : _notDone(),
  //             "Contains lowercase letters"),
  //         _checks(_validNumbers ? _done() : _notDone(), "Contains numbers"),
  //         _checks(_validSpecChars ? _done() : _notDone(),
  //             "Contains special characters"),
  //       ],
  //     ),
  //   );
  // }

  // Icon _done() {
  //   return const Icon(
  //     Icons.check_circle_outline,
  //     color: Colors.green,
  //   );
  // }

  // Icon _notDone() {
  //   return const Icon(
  //     Icons.check_circle_outline,
  //     color: Colors.grey,
  //   );
  // }

  // Widget _checks(Icon _icon, String _checkString) {
  //   return Row(
  //     children: [
  //       const Text("   "),
  //       _icon,
  //       Text("   $_checkString"),
  //     ],
  //   );
  // }

  Widget _signupButton() {
    return Container(
      padding: EdgeInsets.only(
          bottom: _deviceHeight! * 0.22, top: _deviceHeight! * 0.02),
      child: MaterialButton(
        minWidth: _deviceWidth! * 0.90,
        height: _deviceHeight! * 0.06,
        color: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        onPressed: _signupUser,
        child: const Text(
          "Sign up",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void _signupUser() async {
    // if (_globalKey.currentState!.validate()) {
    //   _globalKey.currentState!.save();

    //   // bool _result = await _firebaseService!.registerUser(
    //   //     name: _userName!,
    //   //     email: _email!,
    //   //     password: _password!,
    //   //     image: _image!);

    //   if (_result) Navigator.pushNamed(context, 'login');
    // }
  }
}
