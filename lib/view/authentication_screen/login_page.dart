import 'package:flutter/material.dart';
import 'package:shop_task/view/authentication_screen/register_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0),
          child: Column(
            children: [
              const Spacer(flex: 2,),
              const Row(
                 children: [
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('LOGIN', style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 28,
                          fontWeight: FontWeight.normal
                      ),),
                      SizedBox(height: 10,),
                      Text('Log in now to browse our hot offers!', style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        color: Colors.black38
                      ),)
                    ],
                               ),
                   Spacer()
                 ],
               ),
              const SizedBox(height: 20,),
              const TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined, color: Colors.black38,),
                  hintText: 'Email Address',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black38
                    )
                  )
                ),
              ),
              const SizedBox(height: 20,),
              TextField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock_outline, color: Colors.black38,),
                    suffixIcon: IconButton(onPressed: (){}, icon: const Icon(Icons.visibility_outlined, color: Colors.black38,)),
                    hintText: 'Password',
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black38
                        )
                    )
                ),
              ),
              const SizedBox(height: 20,),
              ElevatedButton(onPressed: (){},
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                 fixedSize: const Size(double.maxFinite, 50),
                 shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5)))
              ), child: const Text('LOGIN',style: TextStyle(
                      color: Colors.white
                  ),)),
              const SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account?'),
                  TextButton(onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> const RegisterPage())), child: const Text('REGISTER'))
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
