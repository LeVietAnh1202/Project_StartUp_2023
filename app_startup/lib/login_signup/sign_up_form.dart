import 'package:app_startup/constants/color_app.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/gestures.dart';
// import 'dart:ui';
// ignore: depend_on_referenced_packages
// import 'package:google_fonts/google_fonts.dart';
import 'package:app_startup/utils.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 443;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // signupformhof (207:32)
        width: double.infinity,
        height: 933*fem,
        decoration: BoxDecoration (
          color: greenLight,
        ),
        child: Stack(
          children: [
            Positioned(
              // pngtreesavingelectricityenergy (207:33)
              left: 118*fem,
              top: 0*fem,
              child: Align(
                child: SizedBox(
                  width: 207*fem,
                  height: 435*fem,
                  child: Image.asset(
                    'assets/login-signup/images/pngtreesavingelectricityenergysavingenvironmental1012528-1.png',
                  ),
                ),
              ),
            ),
            Positioned(
              // group22Uzm (207:34)
              left: 0*fem,
              top: 304*fem,
              child: Container(
                width: 443*fem,
                height: 677*fem,
                decoration: BoxDecoration (
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x3f000000),
                      offset: Offset(4*fem, 4*fem),
                      blurRadius: 2*fem,
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Positioned(
                      // group2583j (207:35)
                      left: 108.4147949219*fem,
                      top: 269*fem,
                      child: Opacity(
                        opacity: 0,
                        child: Container(
                          width: 235.68*fem,
                          height: 80.28*fem,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // autogroupweytQmw (R8Zt7sXjBwN4JCuBM9WEyT)
                                margin: EdgeInsets.fromLTRB(22.23*fem, 0*fem, 0*fem, 3.17*fem),
                                width: double.infinity,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Center(
                                      // remembermeAed (207:38)
                                      child: Container(
                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 44.45*fem, 0*fem),
                                        child: Text(
                                          'Remember Me',
                                          textAlign: TextAlign.center,
                                          style: SafeGoogleFont (
                                            'Lato',
                                            fontSize: 12*ffem,
                                            fontWeight: FontWeight.w400,
                                            height: 5*ffem/fem,
                                            color: Color(0xff0e55a7),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Center(
                                      // forgotpasswordcWd (207:39)
                                      child: Text(
                                        'Forgot Password ',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont (
                                          'Lato',
                                          fontSize: 12*ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 5*ffem/fem,
                                          decoration: TextDecoration.underline,
                                          color: Color(0xff0e55a7),
                                          decorationColor: Color(0xff0e55a7),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                // icontoggleoffj5T (207:36)
                                width: 27.85*fem,
                                height: 17.11*fem,
                                child: Image.asset(
                                  'assets/login-signup/images/icon-toggle-off.png',
                                  width: 27.85*fem,
                                  height: 17.11*fem,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // logincontainerEH7 (207:40)
                      left: 0*fem,
                      top: 0*fem,
                      child: Align(
                        child: SizedBox(
                          width: 443*fem,
                          height: 677*fem,
                          child: Container(
                            decoration: BoxDecoration (
                              borderRadius: BorderRadius.circular(40*fem),
                              color: Color(0xffffffff),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x3f000000),
                                  offset: Offset(0*fem, 4*fem),
                                  blurRadius: 2*fem,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // icons5oX (207:41)
                      left: 138*fem,
                      top: 479*fem,
                      child: Align(
                        child: SizedBox(
                          width: 167*fem,
                          height: 45*fem,
                          child: Image.asset(
                            'assets/login-signup/images/icons-17P.png',
                            width: 167*fem,
                            height: 45*fem,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // fieldcontainervariant3mwF (207:59)
                      left: 79*fem,
                      top: 87.8032779694*fem,
                      child: Container(
                        width: 285*fem,
                        height: 83.11*fem,
                        child: Stack(
                          children: [
                            Positioned(
                              // rectangle20gYR (I207:59;110:850)
                              left: 0*fem,
                              top: 29.0163946152*fem,
                              child: Align(
                                child: SizedBox(
                                  width: 285*fem,
                                  height: 49.18*fem,
                                  child: Container(
                                    decoration: BoxDecoration (
                                      borderRadius: BorderRadius.circular(9*fem),
                                      border: Border.all(color: greenDark),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // group249wo (I207:59;110:851)
                              left: 22.5200195312*fem,
                              top: 0*fem,
                              child: Container(
                                width: 46*fem,
                                height: 60*fem,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      // rectangle21qJq (I207:59;110:852)
                                      left: 0*fem,
                                      top: 18.1967220306*fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 46*fem,
                                          height: 21.64*fem,
                                          child: Container(
                                            decoration: BoxDecoration (
                                              color: Color(0xffffffff),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      // emailWfs (I207:59;110:853)
                                      left: 4.9999694824*fem,
                                      top: 0*fem,
                                      child: Center(
                                        child: Align(
                                          child: SizedBox(
                                            width: 36*fem,
                                            height: 60*fem,
                                            child: Text(
                                              'Email',
                                              textAlign: TextAlign.center,
                                              style: SafeGoogleFont (
                                                'Inter',
                                                fontSize: 14*ffem,
                                                fontWeight: FontWeight.w400,
                                                height: 4.2857142857*ffem/fem,
                                                color: greenDark,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              // johndoegmailcomxnm (I207:59;110:854)
                              left: 28.5*fem,
                              top: 23.1147546768*fem,
                              child: Center(
                                child: Align(
                                  child: SizedBox(
                                    width: 115*fem,
                                    height: 60*fem,
                                    child: Text(
                                      'johndoe@gmail.com',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont (
                                        'Inter',
                                        fontSize: 12*ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 5*ffem/fem,
                                        color: Color(0xaf1a7d5a),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      // fieldcontainervariant3ppy (207:60)
                      left: 79*fem,
                      top: 166.8032798767*fem,
                      child: Container(
                        width: 285*fem,
                        height: 87.54*fem,
                        child: Stack(
                          children: [
                            Positioned(
                              // rectangle20uLd (I207:60;110:856)
                              left: 0*fem,
                              top: 29.0163917542*fem,
                              child: Align(
                                child: SizedBox(
                                  width: 285*fem,
                                  height: 49.18*fem,
                                  child: Container(
                                    decoration: BoxDecoration (
                                      borderRadius: BorderRadius.circular(9*fem),
                                      border: Border.all(color: greenDark),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // group23C4q (I207:60;110:857)
                              left: 20*fem,
                              top: 0*fem,
                              child: Container(
                                width: 73*fem,
                                height: 60*fem,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      // rectangle21hGV (I207:60;110:858)
                                      left: 0*fem,
                                      top: 18.1967201233*fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 73*fem,
                                          height: 21.64*fem,
                                          child: Container(
                                            decoration: BoxDecoration (
                                              color: Color(0xffffffff),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      // passwordCyw (I207:60;110:859)
                                      left: 4*fem,
                                      top: 0*fem,
                                      child: Center(
                                        child: Align(
                                          child: SizedBox(
                                            width: 65*fem,
                                            height: 60*fem,
                                            child: Text(
                                              'Password',
                                              textAlign: TextAlign.center,
                                              style: SafeGoogleFont (
                                                'Inter',
                                                fontSize: 14*ffem,
                                                fontWeight: FontWeight.w400,
                                                height: 4.2857142857*ffem/fem,
                                                color: greenDark,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              // fcd (I207:60;110:860)
                              left: 24*fem,
                              top: 27.5409812927*fem,
                              child: Center(
                                child: Align(
                                  child: SizedBox(
                                    width: 74*fem,
                                    height: 60*fem,
                                    child: Text(
                                      '**********',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont (
                                        'Bebas Neue',
                                        fontSize: 14*ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 4.2857142857*ffem/fem,
                                        letterSpacing: 1.4*fem,
                                        color: Color(0xaf1a7d5a),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // eyeiconwKF (I207:60;110:861)
                              left: 246*fem,
                              top: 48.6885261536*fem,
                              child: Align(
                                child: SizedBox(
                                  width: 18.05*fem,
                                  height: 10.62*fem,
                                  child: Opacity(
                                    opacity: 0.75,
                                    child: Image.asset(
                                      'assets/login-signup/images/eye-icon-Ba1.png',
                                      width: 18.05*fem,
                                      height: 10.62*fem,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      // fieldcontainervariant3DXf (207:61)
                      left: 79*fem,
                      top: 245.803276062*fem,
                      child: Container(
                        width: 285*fem,
                        height: 87.54*fem,
                        child: Stack(
                          children: [
                            Positioned(
                              // rectangle207d3 (207:62)
                              left: 0*fem,
                              top: 29.0163955688*fem,
                              child: Align(
                                child: SizedBox(
                                  width: 285*fem,
                                  height: 49.18*fem,
                                  child: Container(
                                    decoration: BoxDecoration (
                                      borderRadius: BorderRadius.circular(9*fem),
                                      border: Border.all(color: greenDark),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // group23cJu (207:63)
                              left: 20*fem,
                              top: 0*fem,
                              child: Container(
                                width: 129*fem,
                                height: 60*fem,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      // rectangle21u37 (207:64)
                                      left: 0*fem,
                                      top: 18.196723938*fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 129*fem,
                                          height: 21.64*fem,
                                          child: Container(
                                            decoration: const BoxDecoration (
                                              color: Color(0xffffffff),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      // confirmpasswordPU5 (207:65)
                                      left: 4*fem,
                                      top: 0*fem,
                                      child: Center(
                                        child: Align(
                                          child: SizedBox(
                                            width: 121*fem,
                                            height: 60*fem,
                                            child: Text(
                                              'Confirm Password',
                                              textAlign: TextAlign.center,
                                              style: SafeGoogleFont (
                                                'Inter',
                                                fontSize: 14*ffem,
                                                fontWeight: FontWeight.w400,
                                                height: 4.2857142857*ffem/fem,
                                                color: greenDark,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              // r6m (207:66)
                              left: 24*fem,
                              top: 27.5409927368*fem,
                              child: Center(
                                child: Align(
                                  child: SizedBox(
                                    width: 74*fem,
                                    height: 60*fem,
                                    child: Text(
                                      '**********',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont (
                                        'Bebas Neue',
                                        fontSize: 14*ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 4.2857142857*ffem/fem,
                                        letterSpacing: 1.4*fem,
                                        color: const Color(0xaf1a7d5a),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // eyeicon8a5 (207:67)
                              left: 246*fem,
                              top: 48.6885299683*fem,
                              child: Align(
                                child: SizedBox(
                                  width: 18.05*fem,
                                  height: 10.62*fem,
                                  child: Opacity(
                                    opacity: 0.75,
                                    child: Image.asset(
                                      'assets/login-signup/images/eye-icon-4NV.png',
                                      width: 18.05*fem,
                                      height: 10.62*fem,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      // fieldcontainervariant4DrR (207:70)
                      left: 79*fem,
                      top: 340*fem,
                      child: SizedBox(
                        width: 285*fem,
                        height: 60*fem,
                        child: Stack(
                          children: [
                            Positioned(
                              // rectangle20k5f (I207:70;110:889)
                              left: 0*fem,
                              top: 5.8196716309*fem,
                              child: Align(
                                child: SizedBox(
                                  width: 285*fem,
                                  height: 49.18*fem,
                                  child: Container(
                                    decoration: BoxDecoration (
                                      borderRadius: BorderRadius.circular(9*fem),
                                      color: greenDark,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // loginreV (I207:70;110:890)
                              left: 109*fem,
                              top: 0*fem,
                              child: Center(
                                child: Align(
                                  child: SizedBox(
                                    width: 67*fem,
                                    height: 60*fem,
                                    child: Text(
                                      'LOGIN',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont (
                                        'Lato',
                                        fontSize: 20*ffem,
                                        fontWeight: FontWeight.w700,
                                        height: 3*ffem/fem,
                                        letterSpacing: 1*fem,
                                        color: const Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      // line1LpZ (207:71)
                      left: 55*fem,
                      top: 457*fem,
                      child: Align(
                        child: SizedBox(
                          width: 330*fem,
                          height: 1*fem,
                          child: Container(
                            decoration: const BoxDecoration (
                              color: greenDark,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // alreadyhaveanaccountloginherer (207:72)
                      left: 111.5*fem,
                      top: 391*fem,
                      child: Center(
                        child: Align(
                          child: SizedBox(
                            width: 213*fem,
                            height: 60*fem,
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: SafeGoogleFont (
                                  'Lato',
                                  fontSize: 14*ffem,
                                  fontWeight: FontWeight.w600,
                                  height: 4.2857142857*ffem/fem,
                                  letterSpacing: -0.28*fem,
                                  color: greenDark,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Already have a',
                                    style: SafeGoogleFont (
                                      'Lato',
                                      fontSize: 14*ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 4.2857142857*ffem/fem,
                                      letterSpacing: -0.28*fem,
                                      color: greenDark,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'n account? ',
                                    style: SafeGoogleFont (
                                      'Lato',
                                      fontSize: 14*ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.7857142857*ffem/fem,
                                      letterSpacing: -0.28*fem,
                                      color: greenDark,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Login here',
                                    style: SafeGoogleFont (
                                      'Lato',
                                      fontSize: 14*ffem,
                                      fontWeight: FontWeight.w700,
                                      height: 1.7857142857*ffem/fem,
                                      letterSpacing: -0.28*fem,
                                      decoration: TextDecoration.underline,
                                      color: greenDark,
                                      decorationColor: greenDark,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // oruseyouremailaccountJ4Z (207:73)
                      left: 159*fem,
                      top: 526*fem,
                      child: Center(
                        child: Align(
                          child: SizedBox(
                            width: 128*fem,
                            height: 60*fem,
                            child: Text(
                              'or use your email account',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont (
                                'Lato',
                                fontSize: 12*ffem,
                                fontWeight: FontWeight.w400,
                                height: 5*ffem/fem,
                                letterSpacing: -0.24*fem,
                                color: greenDark,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // loginxuo (207:74)
                      left: 118.5*fem,
                      top: 25*fem,
                      child: Center(
                        child: Align(
                          child: SizedBox(
                            width: 58*fem,
                            height: 60*fem,
                            child: Text(
                              'Login',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont (
                                'Lato',
                                fontSize: 24*ffem,
                                fontWeight: FontWeight.w500,
                                height: 2.5*ffem/fem,
                                color: greenDark,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // signupT5s (207:75)
                      left: 259*fem,
                      top: 25*fem,
                      child: Center(
                        child: Align(
                          child: SizedBox(
                            width: 76*fem,
                            height: 60*fem,
                            child: Text(
                              'Sign up',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont (
                                'Lato',
                                fontSize: 24*ffem,
                                fontWeight: FontWeight.w500,
                                height: 2.5*ffem/fem,
                                color: greenDark,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // line2wFw (207:76)
                      left: 248*fem,
                      top: 75*fem,
                      child: Align(
                        child: SizedBox(
                          width: 98*fem,
                          height: 2*fem,
                          child: Container(
                            decoration: const BoxDecoration (
                              color: greenDark,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
          );
  }
}