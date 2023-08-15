import 'package:flutter/material.dart';
import 'package:my_e_commerce_app/content_page.dart';
import 'package:my_e_commerce_app/services/api_call.dart';
import 'package:my_e_commerce_app/widgets/input_field.dart';

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
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.blueAccent,
                    ),
                    foregroundColor: MaterialStateProperty.all(
                      Colors.white,
                    ),
                    overlayColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 90, 169, 238),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    FocusScope.of(context).unfocus();
                    final result = await CallApi.fetchUsers(
                        _username.text, _password.text);
                    if (context.mounted && result != null) {
                      Navigator.of(context).pushNamed(ContentPage.routeName);
                    } else {
                      setState(() {
                        _hasError = true;
                      });
                    }
                  },
                  child: const Text(
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
                      setState(() {
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
