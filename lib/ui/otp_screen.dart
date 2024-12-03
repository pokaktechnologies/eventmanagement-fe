import 'package:flutter/material.dart';
import 'package:pokakevent_management/controllers/otpcontroller.dart';
import 'package:pokakevent_management/ui/profile.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final List<TextEditingController> _controllers =
      List.generate(5, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(5, (_) => FocusNode());
  final OtpBloc _otpBloc = OtpBloc();

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    _otpBloc.dispose();
    super.dispose();
  }

  void _onChanged(String value, int index) {
    _otpBloc.updateOtp(index, value);

    if (value.length == 1 && index < _controllers.length - 1) {
      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenHeight = constraints.maxHeight;
          double screenWidth = constraints.maxWidth;

          return Stack(
            children: [
              Positioned.fill(
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.6),
                    BlendMode.darken,
                  ),
                  child: Image.asset(
                    "assets/otpscreen.jpeg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned.fill(
                child: Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.20),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Verify OTP',
                          style: TextStyle(
                            fontSize: screenHeight * 0.04,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          "Please enter the code we send to your number",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(height: screenHeight * 0.03),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(4, (index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: SizedBox(
                                width: screenWidth * 0.15,
                                child: TextFormField(
                                  controller: _controllers[index],
                                  focusNode: _focusNodes[index],
                                  maxLength: 1,
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(
                                    fontSize: screenHeight * 0.03,
                                    color: const Color.fromARGB(255, 69, 9, 29),
                                    fontWeight: FontWeight.bold,
                                  ),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white.withOpacity(0.9),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    counterText: "",
                                  ),
                                  onChanged: (value) =>
                                      _onChanged(value, index),
                                ),
                              ),
                            );
                          }),
                        ),
                        SizedBox(height: screenHeight * 0.05),
                        Padding(
                    padding: EdgeInsets.only(bottom: screenHeight * 0.06),
                    child: InkWell(
                      onTap: (){
                        Navigator.push
                (context,MaterialPageRoute(builder: (context)=>const Profile()));
                      },
                      
                      child: Container(
                        
                        height: screenHeight * 0.06,
                        width: screenWidth * 0.8,
                        decoration: BoxDecoration(
                          color: const Color(0xFF00918C),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Confirm",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenHeight * 0.025,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                        SizedBox(height: screenHeight * 0.03),
                        const Text(
                          "Don't receive the code?",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: screenHeight * 0.03),
                        TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor:
                                WidgetStateProperty.resolveWith<Color>(
                                    (states) {
                              if (states.contains(WidgetState.pressed)) {
                                return Colors.white;
                              }
                              return Colors.transparent;
                            }),
                          ),
                          child: Text(
                            "Resend OTP",
                            style:
                                TextStyle(color: Colors.white.withOpacity(0.9)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
