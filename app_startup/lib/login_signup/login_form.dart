import 'package:app_startup/components/buttons/login_btn.dart';
import 'package:app_startup/constants/color_app.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/gestures.dart';
// import 'dart:ui';
// import 'package:google_fonts/google_fonts.dart';
import 'package:app_startup/utils.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 443;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // loginform71s (11:706)
        width: double.infinity,
        height: 933 * fem,
        decoration: BoxDecoration(
          color: greenLight,
        ),
        child: Stack(
          children: [
            Positioned(
              // pngtreesavingelectricityenergy (203:443)
              left: 118 * fem,
              top: 0 * fem,
              child: Align(
                child: SizedBox(
                  width: 207 * fem,
                  height: 435 * fem,
                  child: Image.asset(
                    'assets/login-signup/images/pngtreesavingelectricityenergysavingenvironmental1012528-1-wjo.png',
                  ),
                ),
              ),
            ),
            Positioned(
              // group22VYD (11:716)
              left: 0 * fem,
              top: 304 * fem,
              child: Container(
                padding: EdgeInsets.fromLTRB(
                    57 * fem, 25 * fem, 56 * fem, 123 * fem),
                width: 443 * fem,
                height: 677 * fem,
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.circular(40 * fem),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x3f000000),
                      offset: Offset(4 * fem, 4 * fem),
                      blurRadius: 2 * fem,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // autogroupndpk62D (R8ZtnmaaiEfrP1M3UFNdPK)
                      margin: EdgeInsets.fromLTRB(
                          42 * fem, 0 * fem, 52 * fem, 2.8 * fem),
                      width: double.infinity,
                      height: 60 * fem,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // autogroupsywhPX7 (R8ZtvgX4fq7hkE9YAwSYWH)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 62 * fem, 0 * fem),
                            width: 98 * fem,
                            height: double.infinity,
                            child: Stack(
                              children: [
                                Positioned(
                                  // login6wK (11:748)
                                  left: 19.5 * fem,
                                  top: 0 * fem,
                                  child: Center(
                                    child: Align(
                                      child: SizedBox(
                                        width: 58 * fem,
                                        height: 60 * fem,
                                        child: Text(
                                          'Login',
                                          textAlign: TextAlign.center,
                                          style: SafeGoogleFont(
                                            'Lato',
                                            fontSize: 24 * ffem,
                                            fontWeight: FontWeight.w500,
                                            height: 2.5 * ffem / fem,
                                            color: greenDark,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // line3yVK (207:93)
                                  left: 0 * fem,
                                  top: 50 * fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 98 * fem,
                                      height: 2 * fem,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: greenDark,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Center(
                            // signup4mf (11:749)
                            child: Text(
                              'Sign up',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont(
                                'Lato',
                                fontSize: 24 * ffem,
                                fontWeight: FontWeight.w500,
                                height: 2.5 * ffem / fem,
                                color: greenDark,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // autogroup1g6hnSm (R8Zu3BLEod6x2RszBP1g6h)
                      margin: EdgeInsets.fromLTRB(
                          22 * fem, 0 * fem, 23 * fem, 4 * fem),
                      width: double.infinity,
                      height: 216.2 * fem,
                      child: Stack(
                        children: [
                          Positioned(
                            // fieldcontainervariant3Vry (11:733)
                            left: 0 * fem,
                            top: 0 * fem,
                            child: Container(
                              width: 285 * fem,
                              height: 83.11 * fem,
                              child: Stack(
                                children: [
                                  Positioned(
                                    // rectangle20D2H (I11:733;110:850)
                                    left: 0 * fem,
                                    top: 29.0163946152 * fem,
                                    child: Align(
                                      child: SizedBox(
                                        width: 285 * fem,
                                        height: 49.18 * fem,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(9 * fem),
                                            border: Border.all(
                                                color: greenDark),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    // group24K5K (I11:733;110:851)
                                    left: 22.5200195312 * fem,
                                    top: 0 * fem,
                                    child: Container(
                                      width: 46 * fem,
                                      height: 60 * fem,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            // rectangle2131K (I11:733;110:852)
                                            left: 0 * fem,
                                            top: 18.1967220306 * fem,
                                            child: Align(
                                              child: SizedBox(
                                                width: 46 * fem,
                                                height: 21.64 * fem,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Color(0xffffffff),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            // emailvL1 (I11:733;110:853)
                                            left: 4.9999771118 * fem,
                                            top: 0 * fem,
                                            child: Center(
                                              child: Align(
                                                child: SizedBox(
                                                  width: 36 * fem,
                                                  height: 60 * fem,
                                                  child: Text(
                                                    'Email',
                                                    textAlign: TextAlign.center,
                                                    style: SafeGoogleFont(
                                                      'Inter',
                                                      fontSize: 14 * ffem,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 4.2857142857 *
                                                          ffem /
                                                          fem,
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
                                    // johndoegmailcomPjP (I11:733;110:854)
                                    left: 28.5 * fem,
                                    top: 23.1147546768 * fem,
                                    child: Center(
                                      child: Align(
                                        child: SizedBox(
                                          width: 115 * fem,
                                          height: 60 * fem,
                                          child: Text(
                                            'johndoe@gmail.com',
                                            textAlign: TextAlign.center,
                                            style: SafeGoogleFont(
                                              'Inter',
                                              fontSize: 12 * ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 5 * ffem / fem,
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
                            // fieldcontainervariant3rss (11:734)
                            left: 0 * fem,
                            top: 79.0000019073 * fem,
                            child: Container(
                              width: 285 * fem,
                              height: 87.54 * fem,
                              child: Stack(
                                children: [
                                  Positioned(
                                    // rectangle20yhb (I11:734;110:856)
                                    left: 0 * fem,
                                    top: 29.0163917542 * fem,
                                    child: Align(
                                      child: SizedBox(
                                        width: 285 * fem,
                                        height: 49.18 * fem,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(9 * fem),
                                            border: Border.all(
                                                color: greenDark),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    // group23HTP (I11:734;110:857)
                                    left: 20 * fem,
                                    top: 0 * fem,
                                    child: Container(
                                      width: 73 * fem,
                                      height: 60 * fem,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            // rectangle21QY1 (I11:734;110:858)
                                            left: 0 * fem,
                                            top: 18.1967201233 * fem,
                                            child: Align(
                                              child: SizedBox(
                                                width: 73 * fem,
                                                height: 21.64 * fem,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Color(0xffffffff),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            // password8U1 (I11:734;110:859)
                                            left: 4 * fem,
                                            top: 0 * fem,
                                            child: Center(
                                              child: Align(
                                                child: SizedBox(
                                                  width: 65 * fem,
                                                  height: 60 * fem,
                                                  child: Text(
                                                    'Password',
                                                    textAlign: TextAlign.center,
                                                    style: SafeGoogleFont(
                                                      'Inter',
                                                      fontSize: 14 * ffem,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 4.2857142857 *
                                                          ffem /
                                                          fem,
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
                                    // prd (I11:734;110:860)
                                    left: 24 * fem,
                                    top: 27.5409812927 * fem,
                                    child: Center(
                                      child: Align(
                                        child: SizedBox(
                                          width: 74 * fem,
                                          height: 60 * fem,
                                          child: Text(
                                            '**********',
                                            textAlign: TextAlign.center,
                                            style: SafeGoogleFont(
                                              'Bebas Neue',
                                              fontSize: 14 * ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 4.2857142857 * ffem / fem,
                                              letterSpacing: 1.4 * fem,
                                              color: Color(0xaf1a7d5a),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    // eyeicon753 (I11:734;110:861)
                                    left: 246 * fem,
                                    top: 48.6885261536 * fem,
                                    child: Align(
                                      child: SizedBox(
                                        width: 18.05 * fem,
                                        height: 10.62 * fem,
                                        child: Opacity(
                                          opacity: 0.75,
                                          child: Image.asset(
                                            'assets/login-signup/images/eye-icon.png',
                                            width: 18.05 * fem,
                                            height: 10.62 * fem,
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
                            // group26P2Z (207:94)
                            left: 18 * fem,
                            top: 156.1967220306 * fem,
                            child: Container(
                              width: 245.1 * fem,
                              height: 60 * fem,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // icontoggleoff6hf (207:95)
                                    margin: EdgeInsets.fromLTRB(0 * fem,
                                        0 * fem, 7.45 * fem, 0.38 * fem),
                                    width: 24.7 * fem,
                                    height: 15.63 * fem,
                                    child: Image.asset(
                                      'assets/login-signup/images/icon-toggle-off-Mkm.png',
                                      width: 24.7 * fem,
                                      height: 15.63 * fem,
                                    ),
                                  ),
                                  Center(
                                    // remembermePgm (207:97)
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(0 * fem,
                                          0 * fem, 44.95 * fem, 0 * fem),
                                      child: Text(
                                        'Remember me',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont(
                                          'Lato',
                                          fontSize: 12 * ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 5 * ffem / fem,
                                          color: greenDark,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    // forgotpasswordVjo (207:98)
                                    child: Text(
                                      'Forgot password ',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont(
                                        'Lato',
                                        fontSize: 12 * ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 5 * ffem / fem,
                                        decoration: TextDecoration.underline,
                                        color: greenDark,
                                        decorationColor: greenDark,
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
                    // Button Login
                    const LoginBtn(),
                    Container(
                      margin: EdgeInsets.fromLTRB(55, 12, 0, 22),
                      child: Row(
                        children: [
                          Text(
                            "Already have an account? ",
                            style: SafeGoogleFont(
                              'Lato',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              height: 2,
                              color: greenDark,
                            ),
                          ),
                          Text(
                            "Login here",
                            style: SafeGoogleFont(
                              'Lato',
                              fontSize: 14,
                              height: 2,
                              color: greenDark,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // line
                    Container(
                      width: double.infinity,
                      height: 1 * fem,
                      decoration: const BoxDecoration(
                        color: greenDark,
                      ),
                    ),
                    Container(
                      // iconsrAM (11:723)
                      margin: EdgeInsets.fromLTRB(
                          1 * fem, 0 * fem, 0 * fem, 2 * fem),
                      width: 167 * fem,
                      height: 45 * fem,
                      child: Image.asset(
                        'assets/login-signup/images/icons.png',
                        width: 167 * fem,
                        height: 45 * fem,
                      ),
                    ),
                    Center(
                      // oruseyouremailaccountLLR (11:747)
                      child: Text(
                        'or use your email account',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont(
                          'Lato',
                          fontSize: 12 * ffem,
                          fontWeight: FontWeight.w400,
                          height: 5 * ffem / fem,
                          letterSpacing: -0.24 * fem,
                          color: greenDark,
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
