import 'package:animation_task/share/compo.dart';
import 'package:flutter/material.dart';

import 'animated_list.dart';
import 'loginscreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isPassword = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
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
              child: Stack(children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  color: Colors.purple,
                  child: Center(
                      child: Text(
                    'Register',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: size.width / 8,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  )),
                ),
                Positioned(
                    top: size.height / 30,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                      ),
                      color: Colors.white,
                    ))
              ]),
            ),
          ),
          SizedBox(
            height: size.height / 20,
          ),
          MyTextFormField(
              validator: (value) {
                if (value!.isEmpty) return "Please Enter Your Name";
                return null;
              },
              controller: nameController,
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                Radius.circular(20),
              )),
              labelText: "Name",
              prefixIcon: Icons.person,
              color: Colors.purple,
              keyboardType: TextInputType.name),
          MyTextFormField(
              validator: (value) {
                if (value!.isEmpty) return "Please Enter Your E-mail Adress";
                return null;
              },
              controller: emailController,
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                Radius.circular(20),
              )),
              labelText: "Email",
              prefixIcon: Icons.email,
              color: Colors.purple,
              keyboardType: TextInputType.emailAddress),
          MyTextFormField(
              validator: (value) {
                if (value!.isEmpty) return "Please Enter Your Phone Number";
                return null;
              },
              controller: phoneController,
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                Radius.circular(20),
              )),
              labelText: "Phone",
              prefixIcon: Icons.phone,
              color: Colors.purple,
              keyboardType: TextInputType.phone),
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) return "Please Enter Your Password";
                return null;
              },
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: isPassword,
              decoration: InputDecoration(
                  hintText: "******",
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Colors.purple,
                  ),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPassword = !isPassword;
                        });
                      },
                      icon: isPassword
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility)),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  )),
                  labelText: "Password"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) return "Please Enter Your Password";
                return null;
              },
              controller: confirmPasswordController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: isPassword,
              decoration: InputDecoration(
                  hintText: "******",
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Colors.purple,
                  ),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPassword = !isPassword;
                        });
                      },
                      icon: isPassword
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility)),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  )),
                  labelText: "Confirm Password"),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const AnimatedListScreen())));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width / 3.8, vertical: size.height / 50),
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text(
                  "Register",
                )),
          ),
          SizedBox(height: size.height * 0.02),
          Center(
            child: OutlinedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const LoginScreen())),
                    (rout) => false);
              },
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width / 3.3, vertical: size.height / 50),
                side: const BorderSide(width: 1, color: Colors.purple),
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: const Text(
                "Login",
                style: TextStyle(color: Colors.purple),
              ),
            ),
          ),
        ])));
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
