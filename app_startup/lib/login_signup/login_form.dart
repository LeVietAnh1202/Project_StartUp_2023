import 'package:flutter/material.dart';
import 'package:fisebase_auth';

enum CurrentScreen { Login, SignUp }

class Login extends StatefulWidget {
  const Login({Key? key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late String _email, _password;
  final auth = FisebaseA

  CurrentScreen currentScreen = CurrentScreen.Login;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool showPassword = false;
  bool showConfirmPassword = false;

  bool showSignUpFields = false;
  bool rememberMe = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void clearTextFields() {
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 443;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: Alignment.topCenter,
            child: Image.asset(
              'assets/images/wave.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'assets/images/logo.png',
                width: 200,
                height: 200,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 200.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            currentScreen = CurrentScreen.Login;
                            clearTextFields();
                            showSignUpFields = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: currentScreen == CurrentScreen.Login
                                ? Color(0xFF1A7D5A)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: currentScreen == CurrentScreen.Login
                                ? [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(0, 2),
                                    ),
                                  ]
                                : [],
                          ),
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            '  Login  ',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: currentScreen == CurrentScreen.Login
                                  ? Colors.white
                                  : Color(0xFF1A7D5A),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16.0),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            currentScreen = CurrentScreen.SignUp;
                            clearTextFields();
                            showSignUpFields = true;
                          });
                        },
                        
                        child: Container(
                          decoration: BoxDecoration(
                            color: currentScreen == CurrentScreen.SignUp
                                ? Color(0xFF1A7D5A)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: currentScreen == CurrentScreen.SignUp
                                ? [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(0, 2),
                                    ),
                                  ]
                                : [],
                          ),
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: currentScreen == CurrentScreen.SignUp
                                  ? Colors.white
                                  : Color(0xFF1A7D5A),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),









                  
                  SizedBox(height: 30.0),
                  if (currentScreen == CurrentScreen.Login ||
                      currentScreen == CurrentScreen.SignUp)
                    Column(
                      children: [
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(
                              fontSize: 20.0,
                              color: Color(0xFF1A7D5A),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF1A7D5A),
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF1A7D5A),
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        TextField(
                          controller: passwordController,
                          obscureText: !showPassword,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              fontSize: 20.0,
                              color: Color(0xFF1A7D5A),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF1A7D5A),
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF1A7D5A),
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  showPassword = !showPassword;
                                });
                              },
                              icon: Icon(
                                showPassword ? Icons.visibility : Icons.visibility_off,
                                color: Color(0xFF1A7D5A),
                              ),
                            ),
                          ),
                        ),

                        if (currentScreen == CurrentScreen.Login)
                          SizedBox(height: 25.0),
                        
                        if (currentScreen == CurrentScreen.Login)
                          Row(
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: rememberMe,
                                    onChanged: (value) {
                                      setState(() {
                                        rememberMe = value ?? false;
                                      });
                                    },
                                    activeColor: Color(0xFF1A7D5A),
                                  ),
                                  Text(
                                    'Remember me',
                                    style: TextStyle(
                                      fontSize: 17.0,
                                      color: Color(0xFF1A7D5A),
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(), // Spacer để căn lề "Forgot password" sang phải
                              
                              
                              
                              Text(
                                'Forgot password',
                                style: TextStyle(
                                  fontSize: 17.0,
                                  color: Color(0xFF1A7D5A),
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),


                        if (currentScreen == CurrentScreen.Login)
                          SizedBox(height: 25.0),
                        if (currentScreen == CurrentScreen.Login)
                          Container(
                            width: double.infinity, // Make the button span the full width
                            padding: EdgeInsets.symmetric(horizontal: 0.0), // Add horizontal padding
                            child: ElevatedButton(
                              onPressed: () {
                                
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFF1A7D5A),
                                padding: EdgeInsets.symmetric(vertical: 16.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                              ),             
                              child: Text(
                                'LOGIN',
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),


                        if (currentScreen == CurrentScreen.Login)
                          SizedBox(height: 26.0),
                        if (currentScreen == CurrentScreen.Login)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account? ",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Color(0xFF1A7D5A),
                                ),
                              ),

                              InkWell(
                                onTap: () {
                                  setState(() {
                                    currentScreen = CurrentScreen.SignUp;
                                  });
                                },
                                child: Text(
                                  "Sign up here",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Color(0xFF1A7D5A),
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          if (currentScreen == CurrentScreen.Login)
                          SizedBox(height: 16.0),
                    
                    
                        if (currentScreen == CurrentScreen.Login)
                          Container(
                            height: 1, // Độ cao của đường thẳng
                            color: Color(0xFF1A7D5A), // Màu của đường thẳng
                            margin: EdgeInsets.only(top: 5), // Khoảng cách từ đường thẳng đến ô nhập liệu
                          ),


                        if (currentScreen == CurrentScreen.Login)
                          SizedBox(height: 16.0),
                        if (currentScreen == CurrentScreen.Login)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/facebook.png', // Thay đổi đường dẫn đến biểu tượng Facebook
                                height: 50,
                                width: 50,
                              ),
                              SizedBox(width: 30), // Khoảng cách giữa các biểu tượng
                              Image.asset(
                                'assets/images/google.png', // Thay đổi đường dẫn đến biểu tượng Google
                                height: 50,
                                width: 50,
                              ),
                            ],
                          ),
                    
                    
                    
                          if (currentScreen == CurrentScreen.Login)
                          SizedBox(height: 16.0),
                          if (currentScreen == CurrentScreen.Login)
                          Text(
                            'or use your email account',
                            style: TextStyle(
                              fontSize: 17,
                              color: Color(0xFF1A7D5A),
                            ),
                          ),





















                        if (currentScreen == CurrentScreen.SignUp)
                          SizedBox(height: 16.0),
                          
                        if (currentScreen == CurrentScreen.SignUp)
                          TextField(
                            controller: confirmPasswordController,
                            obscureText: !showConfirmPassword,
                            decoration: InputDecoration(
                              labelText: 'Confirm Password',
                              labelStyle: TextStyle(
                                fontSize: 20.0,
                                color: Color(0xFF1A7D5A),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF1A7D5A),
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF1A7D5A),
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    showConfirmPassword = !showConfirmPassword;
                                  });
                                },
                                icon: Icon(
                                  showConfirmPassword ? Icons.visibility : Icons.visibility_off,
                                  color: Color(0xFF1A7D5A),
                                ),
                              ),
                            ),
                          ),

                        if (currentScreen == CurrentScreen.SignUp)
                          SizedBox(height: 16.0),
                        if (currentScreen == CurrentScreen.SignUp)
                          Container(
                            width: double.infinity, // Make the button span the full width
                            padding: EdgeInsets.symmetric(horizontal: 0.0), // Add horizontal padding
                            child: ElevatedButton(
                              onPressed: () {
                                // Handle login logic here
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFF1A7D5A),
                                padding: EdgeInsets.symmetric(vertical: 16.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                              ),
                              child: Text(
                                'SIGN UP',
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),

                        if (currentScreen == CurrentScreen.SignUp)
                          SizedBox(height: 26.0),


                        if (currentScreen == CurrentScreen.SignUp)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Have already an account? ",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Color(0xFF1A7D5A),
                                ),
                              ),

                              InkWell(
                                onTap: () {
                                  setState(() {
                                    currentScreen = CurrentScreen.Login;
                                  });
                                },

                                child: Text(
                                  "Login here",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Color(0xFF1A7D5A),
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                    
                    
                        if (currentScreen == CurrentScreen.SignUp)
                          SizedBox(height: 16.0),
                        if (currentScreen == CurrentScreen.SignUp)
                          
                          Container(
                            height: 1, // Độ cao của đường thẳng
                            color: Color(0xFF1A7D5A), // Màu của đường thẳng
                            margin: EdgeInsets.only(top: 5), // Khoảng cách từ đường thẳng đến ô nhập liệu
                          ),


                         if (currentScreen == CurrentScreen.SignUp)
                          SizedBox(height: 16.0),
                        if (currentScreen == CurrentScreen.SignUp)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/facebook.png', // Thay đổi đường dẫn đến biểu tượng Facebook
                                height: 50,
                                width: 50,
                              ),
                              SizedBox(width: 30), // Khoảng cách giữa các biểu tượng
                              Image.asset(
                                'assets/images/google.png', // Thay đổi đường dẫn đến biểu tượng Google
                                height: 50,
                                width: 50,
                              ),
                            ],
                          ),
                    
                    
                    
                          if (currentScreen == CurrentScreen.SignUp)
                          SizedBox(height: 16.0),
                          if (currentScreen == CurrentScreen.SignUp)
                          Text(
                            'or use your email account',
                            style: TextStyle(
                              fontSize: 17,
                              color: Color(0xFF1A7D5A),
                            ),
                          ),





                      
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
}
