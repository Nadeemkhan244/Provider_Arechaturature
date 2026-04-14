import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider.dart';

class LoginPage extends StatefulWidget {LoginPage({super.key});
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController(); // Fixed spelling

bool _isPasswordVisible = false;
@override
State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;

  TextEditingController? emailController;

  TextEditingController? passwordController;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Color(0xFF1e3799), // Deep Blue
              Color(0xFF4a69bd), // Lighter Blue
              Color(0xFF78e08f), // Soft Green
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text("Login", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text("Welcome Back", style: TextStyle(color: Colors.white, fontSize: 18)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 40),
                        // Email Field
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              const BoxShadow(
                                color: Color.fromRGBO(30, 55, 153, .3),
                                blurRadius: 20,
                                offset: Offset(0, 10),
                              )
                            ],
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey)),
                                ),
                                child:  TextField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    hintText: "Email or Phone number",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none,
                                    prefixIcon: Icon(Icons.email_outlined),
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                child: TextField(
                                  controller: passwordController,
                                  obscureText: !_isPasswordVisible,
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                    hintStyle: const TextStyle(color: Colors.grey),
                                    border: InputBorder.none,
                                    prefixIcon: const Icon(Icons.lock_outline),
                                    suffixIcon: IconButton(
                                      icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                                      onPressed: () {
                                        setState(() {
                                          _isPasswordVisible = !_isPasswordVisible;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 40),
                        const Text("Forgot Password?", style: TextStyle(color: Colors.grey)),
                        const SizedBox(height: 40),
                        // Login Button
                        InkWell(
                          // onTap: (){
                          //   authProvider.login(
                          //       emailController!.text.toString(),
                          //       passwordControler.text.toString());
                          // },
                          child: MaterialButton(
                            onPressed: () {},
                            height: 50,
                            minWidth: double.infinity,
                            color: const Color(0xFF1e3799),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child:   authProvider.loadign ? CircularProgressIndicator(): Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                          ),
                        ),
                        const SizedBox(height: 30),
                        InkWell(

                            child: const Text("if have don't any account ""Sign up", style: TextStyle(color: Colors.grey))),
                        const SizedBox(height: 30),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: MaterialButton(
                                onPressed: () {},
                                height: 50,
                                color: Colors.blue,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                child: const Text("Facebook", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                              ),
                            ),
                            const SizedBox(width: 30),
                            Expanded(
                              child: MaterialButton(
                                onPressed: () {},
                                height: 50,
                                color: Colors.black,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                child: const Text("Github", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

mixin passwordControler {
  var text;
}