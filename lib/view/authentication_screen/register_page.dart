import 'package:flutter/material.dart';
import 'package:shop_task/view/main_screen/main_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0),
          child: Column(
            children: [
              const Spacer(),
              const Row(
                children: [
                  Text(
                    'Register',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 28,
                        fontWeight: FontWeight.normal),
                  ),
                  Spacer()
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.person_2_outlined,
                      color: Colors.black38,
                    ),
                    hintText: 'Name',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black38))),
              ),
              const SizedBox(
                height: 20,
              ),
              const TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: Colors.black38,
                    ),
                    hintText: 'Email Address',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black38))),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: Colors.black38,
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.visibility_outlined,
                          color: Colors.black38,
                        )),
                    hintText: 'Password',
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black38))),
              ),
              const SizedBox(
                height: 20,
              ),
              const TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Colors.black38,
                    ),
                    hintText: 'Phone',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black38))),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyHomePage())),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      fixedSize: const Size(double.maxFinite, 50),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)))),
                  child: const Text(
                    'REGISTER',
                    style: TextStyle(color: Colors.white),
                  )),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?'),
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('LOGIN'))
                ],
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
