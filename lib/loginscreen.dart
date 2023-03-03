import 'package:animation_task/animated_list.dart';
import 'package:animation_task/registerscreen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPassword = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: GestureDetector(
      child: SingleChildScrollView(
          child: Form(
        key: formKey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 100),
                alignment: Alignment.centerRight,
                color: Colors.white,
                child: ClipPath(
                  clipper: MyClipper(),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    color: Colors.purple,
                    child: Center(
                        child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: size.width / 8,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ),
              SizedBox(
                height: size.height / 10,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Your E-mail Adress";
                    } else if (emailController.text.contains("@") == false) {
                      return "enter a valid Email";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      hintText: "test@gmail.com",
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.purple,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      )),
                      labelText: "Email"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextFormField(
                  controller: passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Your Password";
                    } else if (value.length < 5 && value.contains("@")) {
                      return "password must be at least 5 character";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: isPassword,
                  decoration: InputDecoration(
                      hintText: "******",
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isPassword = !isPassword;
                            });
                          },
                          icon: isPassword
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility)),
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Colors.purple,
                      ),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      )),
                      labelText: "Password"),
                ),
              ),
              SizedBox(height: size.height * 0.05),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        debugPrint(emailController.text);
                        debugPrint(passwordController.text);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) =>
                                const AnimatedListScreen())));
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: ((context) =>
                        //             const AnimatedListScreen())));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width / 3,
                          vertical: size.height / 50),
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: const Text(
                      "Login",
                    )),
              ),
              SizedBox(height: size.height * 0.02),
              Center(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const RegisterScreen())));
                  },
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width / 3.3,
                        vertical: size.height / 50),
                    side: const BorderSide(width: 1, color: Colors.purple),
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: const Text(
                    "Register",
                    style: TextStyle(color: Colors.purple),
                  ),
                ),
              )
            ]),
      )),
    ));
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 4, size.height - 50, size.width / 2, size.height - 20);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height, size.width, size.height - 30);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
