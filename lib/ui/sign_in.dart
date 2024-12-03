import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokakevent_management/ui/otp_screen.dart';
import 'package:pokakevent_management/repository/singIn_cubit.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned.fill(
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.6), BlendMode.darken),
              child: Image.asset(
                "assets/signin.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 180),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Email/Contact Number',
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 3),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      style: TextStyle(color: Colors.pink),
                    ),
                  ),
                  const SizedBox(height: 50),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 3),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      style: TextStyle(color: Colors.pink),
                    ),
                  ),
                  const SizedBox(height: 30),
                  BlocBuilder<SignInCubit, bool>(
                    builder: (context, isRememberMeChecked) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: isRememberMeChecked,
                                  onChanged: (value) {
                                    context.read<SignInCubit>().toggleRememberMe(value ?? false);
                                  },
                                  activeColor: Colors.green,
                                ),
                                const Text(
                                  'Remember Me.',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {},
                              child: const Text(
                                "Forget Password?.",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 50),
                  Padding(
                    padding: EdgeInsets.only(bottom: mediaHeight * 0.06),
                    

                    child: InkWell(
                      onTap: (){
                        Navigator.push
                (context,MaterialPageRoute(builder: (context)=>const OtpScreen()));
                      },
                      child: Container(
                        height: mediaHeight * 0.06,
                        width: mediaWidth * 0.8,
                        decoration: BoxDecoration(
                          color: const Color(0xFF00918C),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: mediaHeight * 0.025,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          
                        ),
                       
                      ),
                    ),
                  ),
                  const Text(
                    "-OR-",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildIconButton(Icons.apple),
                      const SizedBox(width: 20),
                      _buildIconButton(Icons.android),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(10), 
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30), 
      ),
      child: Icon(icon, color: const Color.fromARGB(255, 35, 35, 35), size: 30,),
    );
  }
}






