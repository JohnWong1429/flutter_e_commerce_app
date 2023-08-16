import 'package:flutter/material.dart';
import 'package:my_e_commerce_app/services/api_call.dart';
import 'package:my_e_commerce_app/widgets/input_field.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const routeName = 'login_page';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _username;
  late TextEditingController _password;
  bool _hasError = false;
  bool _isloading = false;

  @override
  void initState() {
    super.initState();
    _username = TextEditingController(text: 'kminchelle');
    _password = TextEditingController(text: '0lelplR');
  }

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: const Text(
          'Login Page',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FlutterLogo(
                size: 120,
              ),
              const SizedBox(
                height: 20,
              ),
              InputField(
                labelText: 'Enter your username',
                controller: _username,
                hasError: _hasError,
                onChange: (_) {
                  if (_hasError) {
                    setState(() {
                      _hasError = false;
                    });
                  }
                },
                isEnable: !_isloading,
              ),
              const SizedBox(
                height: 20,
              ),
              InputField(
                labelText: 'Enter your password',
                controller: _password,
                hidePassword: true,
                hasError: _hasError,
                onChange: (_) {
                  if (_hasError) {
                    setState(() {
                      _hasError = false;
                    });
                  }
                },
                errorText: 'Incorrect username or password',
                isEnable: !_isloading,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      _isloading ? Colors.grey : Colors.blueAccent,
                    ),
                    foregroundColor: MaterialStateProperty.all(
                      Colors.white,
                    ),
                    overlayColor: MaterialStateProperty.all(
                      Colors.grey,
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                    ),
                  ),
                  onPressed: _isloading
                      ? null
                      : () async {
                          setState(() {
                            _hasError = false;
                            _isloading = true;
                          });
                          FocusScope.of(context).unfocus();
                          final result = await CallApi.fetchUsers(
                              _username.text, _password.text);
                          if (context.mounted) {
                            setState(() {
                              _isloading = false;
                            });
                            if (result != null) {
                              Navigator.of(context)
                                  .pushNamed(HomePage.routeName);
                            } else {
                              setState(() {
                                _hasError = true;
                              });
                            }
                          }
                        },
                  child: _isloading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                            strokeWidth: 2.5,
                          ),
                        )
                      : const Text(
                          'Log In',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      _isloading
                          ? null
                          : setState(() {
                              _username.text = 'kminchelle';
                              _password.text = '0lelplR';
                              _hasError = false;
                            });
                      FocusScope.of(context).unfocus();
                    },
                    splashColor: const Color.fromARGB(255, 232, 237, 241),
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'Forgot Account ?',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
