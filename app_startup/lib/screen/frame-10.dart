import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';

class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 443;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // frame10pRX (224:155)
        width: double.infinity,
        height: 933*fem,
        decoration: BoxDecoration (
          color: Color(0xfff7f7f7),
        ),
        child: Stack(
          children: [
            Positioned(
              // bottomnavj2h (224:128)
              left: 0*fem,
              top: 867*fem,
              child: Container(
                width: 443*fem,
                height: 66*fem,
                decoration: BoxDecoration (
                  color: Color(0xffffffff),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // frame61W1 (I224:128;211:160)
                      padding: EdgeInsets.fromLTRB(41.88*fem, 13*fem, 41.88*fem, 13*fem),
                      width: 110.75*fem,
                      height: double.infinity,
                      decoration: BoxDecoration (
                        border: Border.all(color: Color(0xff1a7d5a)),
                      ),
                      child: Container(
                        // frame1XUM (I224:128;211:161)
                        width: double.infinity,
                        height: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // iconGRw (I224:128;211:162)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 8*fem),
                              width: 20*fem,
                              height: 22*fem,
                              child: Image.asset(
                                'assets/page-4/images/icon-UYH.png',
                                width: 20*fem,
                                height: 22*fem,
                              ),
                            ),
                            Center(
                              // homeBJ1 (I224:128;211:163)
                              child: Text(
                                'Home',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont (
                                  'Outfit',
                                  fontSize: 10*ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1*ffem/fem,
                                  color: Color(0xff1a7d5a),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      // autogrouppvnytTK (R8ZxCFjrYFMQ9sc7KLpvny)
                      padding: EdgeInsets.fromLTRB(39.88*fem, 13*fem, 36.88*fem, 13*fem),
                      height: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // frame7QgZ (I224:128;211:164)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 69.25*fem, 0*fem),
                            width: 31*fem,
                            height: double.infinity,
                            child: Container(
                              // frame2wRb (I224:128;211:165)
                              padding: EdgeInsets.fromLTRB(0*fem, 1*fem, 0*fem, 0*fem),
                              width: double.infinity,
                              height: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // iconURX (I224:128;211:166)
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 7*fem),
                                    width: 22*fem,
                                    height: 22*fem,
                                    child: Image.asset(
                                      'assets/page-4/images/icon-9NH.png',
                                      width: 22*fem,
                                      height: 22*fem,
                                    ),
                                  ),
                                  Center(
                                    // settingBqj (I224:128;211:167)
                                    child: Text(
                                      'Setting',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont (
                                        'Outfit',
                                        fontSize: 10*ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1*ffem/fem,
                                        color: Color(0xff1a1927),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            // frame8iam (I224:128;211:168)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 66.25*fem, 0*fem),
                            width: 52*fem,
                            height: double.infinity,
                            child: Container(
                              // frame33N9 (I224:128;211:169)
                              width: double.infinity,
                              height: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // iconPS1 (I224:128;212:379)
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 10*fem),
                                    width: 18*fem,
                                    height: 20*fem,
                                    child: Image.asset(
                                      'assets/page-4/images/icon-zGR.png',
                                      width: 18*fem,
                                      height: 20*fem,
                                    ),
                                  ),
                                  Center(
                                    // notification4o3 (I224:128;211:171)
                                    child: Text(
                                      'Notification',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont (
                                        'Outfit',
                                        fontSize: 10*ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1*ffem/fem,
                                        color: Color(0xff1a1927),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            // frame99pV (I224:128;211:172)
                            width: 37*fem,
                            height: double.infinity,
                            child: Container(
                              // frame4u2y (I224:128;211:173)
                              width: double.infinity,
                              height: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // icondUm (I224:128;211:174)
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 10*fem),
                                    width: 20*fem,
                                    height: 20*fem,
                                    child: Image.asset(
                                      'assets/page-4/images/icon-Ffw.png',
                                      width: 20*fem,
                                      height: 20*fem,
                                    ),
                                  ),
                                  Center(
                                    // managejnh (I224:128;211:175)
                                    child: Text(
                                      'Manage',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont (
                                        'Outfit',
                                        fontSize: 10*ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1*ffem/fem,
                                        color: Color(0xff1a1927),
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
                  ],
                ),
              ),
            ),
            Positioned(
              // autogroupwp8qrsK (R8ZwnMG26YnUsPJyNBWP8q)
              left: 0*fem,
              top: 0*fem,
              child: Container(
                padding: EdgeInsets.fromLTRB(20*fem, 20*fem, 20*fem, 645*fem),
                width: 443*fem,
                height: 867*fem,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // home8pq (243:92)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 23*fem),
                      child: Text(
                        'Home',
                        style: SafeGoogleFont (
                          'Inter',
                          fontSize: 22*ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.2125*ffem/fem,
                          color: Color(0xff1a1927),
                        ),
                      ),
                    ),
                    Container(
                      // frame20eHP (250:818)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 20*fem),
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // frame19BHK (250:817)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 5*fem, 0*fem),
                            width: 158*fem,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // frame21sfw (253:839)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 5*fem),
                                  padding: EdgeInsets.fromLTRB(12*fem, 9*fem, 9*fem, 9*fem),
                                  width: double.infinity,
                                  decoration: BoxDecoration (
                                    borderRadius: BorderRadius.circular(10*fem),
                                    gradient: LinearGradient (
                                      begin: Alignment(-1.942, -2.333),
                                      end: Alignment(1.058, 3.439),
                                      colors: <Color>[Color(0xa5e65c00), Color(0xa5f9d423)],
                                      stops: <double>[0, 1],
                                    ),
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Center(
                                        // buildingnamemyhouseHDs (246:158)
                                        child: Container(
                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 15*fem, 0*fem),
                                          constraints: BoxConstraints (
                                            maxWidth: 114*fem,
                                          ),
                                          child: Text(
                                            'Building name \n(My house)',
                                            textAlign: TextAlign.center,
                                            style: SafeGoogleFont (
                                              'Inter',
                                              fontSize: 16*ffem,
                                              fontWeight: FontWeight.w600,
                                              height: 1.2125*ffem/fem,
                                              color: Color(0xff1a1927),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        // iconLxq (253:836)
                                        width: 8*fem,
                                        height: 4*fem,
                                        child: Image.asset(
                                          'assets/page-4/images/icon-QjB.png',
                                          width: 8*fem,
                                          height: 4*fem,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  // frame14GrV (246:221)
                                  padding: EdgeInsets.fromLTRB(10*fem, 8.5*fem, 10*fem, 8.5*fem),
                                  width: double.infinity,
                                  decoration: BoxDecoration (
                                    border: Border.all(color: Color(0x0c000000)),
                                    color: Color(0xffb2ddff),
                                    borderRadius: BorderRadius.circular(8*fem),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x19000000),
                                        offset: Offset(0*fem, 2*fem),
                                        blurRadius: 3*fem,
                                      ),
                                      BoxShadow(
                                        color: Color(0x0a000000),
                                        offset: Offset(0*fem, 2*fem),
                                        blurRadius: 1*fem,
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Center(
                                        // adddeviceKZs (246:222)
                                        child: Container(
                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 50*fem, 0*fem),
                                          child: Text(
                                            'Add device',
                                            textAlign: TextAlign.center,
                                            style: SafeGoogleFont (
                                              'Outfit',
                                              fontSize: 14*ffem,
                                              fontWeight: FontWeight.w600,
                                              height: 0.7142857143*ffem/fem,
                                              color: Color(0xff1a1927),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        // iconPZj (250:790)
                                        width: 18*fem,
                                        height: 18*fem,
                                        child: Image.asset(
                                          'assets/page-4/images/icon-L8R.png',
                                          width: 18*fem,
                                          height: 18*fem,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // frame18u2H (250:813)
                            width: 240*fem,
                            height: 100*fem,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10*fem),
                              child: Image.asset(
                                'assets/page-4/images/frame-18.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // segmentedcontrolDof (234:62)
                      padding: EdgeInsets.fromLTRB(2*fem, 2*fem, 2*fem, 2*fem),
                      width: double.infinity,
                      height: 32*fem,
                      decoration: BoxDecoration (
                        color: Color(0xfffafafa),
                        borderRadius: BorderRadius.circular(10*fem),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x3f000000),
                            offset: Offset(0*fem, 1*fem),
                            blurRadius: 1*fem,
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ImageFiltered(
                            // frame12uAh (234:46)
                            imageFilter: ImageFilter.blur (
                              sigmaX: 0.1000000015*fem,
                              sigmaY: 0.1000000015*fem,
                            ),
                            child: Container(
                              width: 199.5*fem,
                              height: double.infinity,
                              decoration: BoxDecoration (
                                border: Border.all(color: Color(0xe5ffffff)),
                                borderRadius: BorderRadius.circular(8*fem),
                                gradient: LinearGradient (
                                  begin: Alignment(0, -1),
                                  end: Alignment(0, 1),
                                  colors: <Color>[Color(0xff29b483), Color(0xff1a7d5a)],
                                  stops: <double>[0, 1],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x26000000),
                                    offset: Offset(1*fem, 2*fem),
                                    blurRadius: 2*fem,
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Center(
                                  child: Text(
                                    'Room',
                                    textAlign: TextAlign.center,
                                    style: SafeGoogleFont (
                                      'Outfit',
                                      fontSize: 14*ffem,
                                      fontWeight: FontWeight.w600,
                                      height: 0.7142857143*ffem/fem,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            // frame13rVF (234:49)
                            width: 199.5*fem,
                            height: double.infinity,
                            decoration: BoxDecoration (
                              borderRadius: BorderRadius.circular(8*fem),
                            ),
                            child: Center(
                              child: Center(
                                child: Text(
                                  'Devices',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont (
                                    'Outfit',
                                    fontSize: 14*ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 0.7142857143*ffem/fem,
                                    color: Color(0x33000000),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // bodycontainer9UM (250:646)
              left: 20*fem,
              top: 237*fem,
              child: Container(
                width: 403*fem,
                height: 598.54*fem,
                child: Stack(
                  children: [
                    Positioned(
                      // bodydeR (240:685)
                      left: 0*fem,
                      top: 16.2995452881*fem,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(27*fem, 27*fem, 27*fem, 0*fem),
                        width: 403*fem,
                        height: 582.25*fem,
                        decoration: BoxDecoration (
                          color: Color(0xfffff9e7),
                          borderRadius: BorderRadius.circular(20*fem),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x3f000000),
                              offset: Offset(2*fem, 2*fem),
                              blurRadius: 1*fem,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // autogroupwdjdtaM (R8Zy2jM5hKQhU9kzc1wDJD)
                              width: double.infinity,
                              height: 210*fem,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // cardroompyo (250:658)
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 29*fem, 0*fem),
                                    padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 11*fem),
                                    width: 160*fem,
                                    height: double.infinity,
                                    decoration: BoxDecoration (
                                      border: Border.all(color: Color(0x7fffffff)),
                                      color: Color(0xfff8f8f8),
                                      borderRadius: BorderRadius.circular(22*fem),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x283b4d56),
                                          offset: Offset(0*fem, 20*fem),
                                          blurRadius: 20*fem,
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          // autogrouphvcdHsP (R8ZyBeFu4REjxKuQPEhvCd)
                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 8.5*fem),
                                          padding: EdgeInsets.fromLTRB(128*fem, 10*fem, 10*fem, 10*fem),
                                          width: double.infinity,
                                          height: 120*fem,
                                          decoration: BoxDecoration (
                                            borderRadius: BorderRadius.circular(22*fem),
                                            image: DecorationImage (
                                              fit: BoxFit.cover,
                                              image: AssetImage (
                                                'assets/page-4/images/image-bg-Mzy.png',
                                              ),
                                            ),
                                          ),
                                          child: Align(
                                            // moreBSy (I250:658;240:128)
                                            alignment: Alignment.topRight,
                                            child: SizedBox(
                                              width: 22*fem,
                                              height: 22*fem,
                                              child: Container(
                                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 78*fem),
                                                child: Image.asset(
                                                  'assets/page-4/images/more-XyT.png',
                                                  width: 22*fem,
                                                  height: 22*fem,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          // livingroom4mf (I250:658;240:145)
                                          margin: EdgeInsets.fromLTRB(10*fem, 0*fem, 0*fem, 11.5*fem),
                                          child: Text(
                                            'Living room',
                                            style: SafeGoogleFont (
                                              'Outfit',
                                              fontSize: 14*ffem,
                                              fontWeight: FontWeight.w600,
                                              height: 0.7142857143*ffem/fem,
                                              color: Color(0xff4e4e4e),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          // devices92R (I250:658;240:147)
                                          margin: EdgeInsets.fromLTRB(10*fem, 0*fem, 0*fem, 8*fem),
                                          child: Text(
                                            '4 devices',
                                            style: SafeGoogleFont (
                                              'Outfit',
                                              fontSize: 14*ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 0.7142857143*ffem/fem,
                                              color: Color(0xff979797),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          // frame17rhX (I250:658;240:155)
                                          margin: EdgeInsets.fromLTRB(12*fem, 0*fem, 8*fem, 0*fem),
                                          width: double.infinity,
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                // onBjo (I250:658;240:148)
                                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 67*fem, 0*fem),
                                                child: Text(
                                                  'ON',
                                                  style: SafeGoogleFont (
                                                    'Outfit',
                                                    fontSize: 14*ffem,
                                                    fontWeight: FontWeight.w600,
                                                    height: 0.7142857143*ffem/fem,
                                                    color: Color(0xff4e4e4e),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                // button1JpR (I250:658;240:149)
                                                width: 51*fem,
                                                height: 31*fem,
                                                child: Image.asset(
                                                  'assets/page-4/images/button-1-eAM.png',
                                                  width: 51*fem,
                                                  height: 31*fem,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    // cardroomTBX (250:659)
                                    padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 11*fem),
                                    width: 160*fem,
                                    height: double.infinity,
                                    decoration: BoxDecoration (
                                      border: Border.all(color: Color(0x7fffffff)),
                                      color: Color(0xfff8f8f8),
                                      borderRadius: BorderRadius.circular(22*fem),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x283b4d56),
                                          offset: Offset(0*fem, 20*fem),
                                          blurRadius: 20*fem,
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          // autogroupebzfXhB (R8ZyP46YwHXGEtQbrnEbZf)
                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 8.5*fem),
                                          padding: EdgeInsets.fromLTRB(128*fem, 10*fem, 10*fem, 10*fem),
                                          width: double.infinity,
                                          height: 120*fem,
                                          decoration: BoxDecoration (
                                            borderRadius: BorderRadius.circular(22*fem),
                                            image: DecorationImage (
                                              fit: BoxFit.cover,
                                              image: AssetImage (
                                                'assets/page-4/images/image-bg-Hiy.png',
                                              ),
                                            ),
                                          ),
                                          child: Align(
                                            // moredER (I250:659;240:417)
                                            alignment: Alignment.topRight,
                                            child: SizedBox(
                                              width: 22*fem,
                                              height: 22*fem,
                                              child: Container(
                                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 78*fem),
                                                child: Image.asset(
                                                  'assets/page-4/images/more.png',
                                                  width: 22*fem,
                                                  height: 22*fem,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          // livingroom5cD (I250:659;240:419)
                                          margin: EdgeInsets.fromLTRB(10*fem, 0*fem, 0*fem, 11.5*fem),
                                          child: Text(
                                            'Living room',
                                            style: SafeGoogleFont (
                                              'Outfit',
                                              fontSize: 14*ffem,
                                              fontWeight: FontWeight.w600,
                                              height: 0.7142857143*ffem/fem,
                                              color: Color(0xff4e4e4e),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          // devicesCwj (I250:659;240:420)
                                          margin: EdgeInsets.fromLTRB(10*fem, 0*fem, 0*fem, 8*fem),
                                          child: Text(
                                            '4 devices',
                                            style: SafeGoogleFont (
                                              'Outfit',
                                              fontSize: 14*ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 0.7142857143*ffem/fem,
                                              color: Color(0xff979797),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          // frame17vsj (I250:659;240:421)
                                          margin: EdgeInsets.fromLTRB(12*fem, 0*fem, 8*fem, 0*fem),
                                          width: double.infinity,
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                // offfaR (I250:659;240:422)
                                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 61*fem, 0*fem),
                                                child: Text(
                                                  'OFF',
                                                  style: SafeGoogleFont (
                                                    'Outfit',
                                                    fontSize: 14*ffem,
                                                    fontWeight: FontWeight.w600,
                                                    height: 0.7142857143*ffem/fem,
                                                    color: Color(0xff4e4e4e),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                // button1nf3 (I250:659;240:423)
                                                width: 51*fem,
                                                height: 31*fem,
                                                child: Image.asset(
                                                  'assets/page-4/images/button-1-udj.png',
                                                  width: 51*fem,
                                                  height: 31*fem,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30*fem,
                            ),
                            Container(
                              // autogroupdjiyGaD (R8ZyXYrPt6Gtkzpt2HDJiy)
                              width: double.infinity,
                              height: 210*fem,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // cardroomCyf (240:471)
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 29*fem, 0*fem),
                                    padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 11*fem),
                                    width: 160*fem,
                                    height: double.infinity,
                                    decoration: BoxDecoration (
                                      border: Border.all(color: Color(0x7fffffff)),
                                      color: Color(0xfff8f8f8),
                                      borderRadius: BorderRadius.circular(22*fem),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x283b4d56),
                                          offset: Offset(0*fem, 20*fem),
                                          blurRadius: 20*fem,
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          // autogroup1bxyoiZ (R8ZyhDExoKe5atUj7Q1bxy)
                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 8.5*fem),
                                          padding: EdgeInsets.fromLTRB(128*fem, 10*fem, 10*fem, 10*fem),
                                          width: double.infinity,
                                          height: 120*fem,
                                          decoration: BoxDecoration (
                                            borderRadius: BorderRadius.circular(22*fem),
                                            image: DecorationImage (
                                              fit: BoxFit.cover,
                                              image: AssetImage (
                                                'assets/page-4/images/image-bg.png',
                                              ),
                                            ),
                                          ),
                                          child: Align(
                                            // moreg1f (I240:471;240:128)
                                            alignment: Alignment.topRight,
                                            child: SizedBox(
                                              width: 22*fem,
                                              height: 22*fem,
                                              child: Container(
                                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 78*fem),
                                                child: Image.asset(
                                                  'assets/page-4/images/more-gi5.png',
                                                  width: 22*fem,
                                                  height: 22*fem,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          // livingroomm37 (I240:471;240:145)
                                          margin: EdgeInsets.fromLTRB(10*fem, 0*fem, 0*fem, 11.5*fem),
                                          child: Text(
                                            'Living room',
                                            style: SafeGoogleFont (
                                              'Outfit',
                                              fontSize: 14*ffem,
                                              fontWeight: FontWeight.w600,
                                              height: 0.7142857143*ffem/fem,
                                              color: Color(0xff4e4e4e),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          // devicesTwX (I240:471;240:147)
                                          margin: EdgeInsets.fromLTRB(10*fem, 0*fem, 0*fem, 8*fem),
                                          child: Text(
                                            '4 devices',
                                            style: SafeGoogleFont (
                                              'Outfit',
                                              fontSize: 14*ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 0.7142857143*ffem/fem,
                                              color: Color(0xff979797),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          // frame17yey (I240:471;240:155)
                                          margin: EdgeInsets.fromLTRB(12*fem, 0*fem, 8*fem, 0*fem),
                                          width: double.infinity,
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                // on6jb (I240:471;240:148)
                                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 67*fem, 0*fem),
                                                child: Text(
                                                  'ON',
                                                  style: SafeGoogleFont (
                                                    'Outfit',
                                                    fontSize: 14*ffem,
                                                    fontWeight: FontWeight.w600,
                                                    height: 0.7142857143*ffem/fem,
                                                    color: Color(0xff4e4e4e),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                // button1Nx1 (I240:471;240:149)
                                                width: 51*fem,
                                                height: 31*fem,
                                                child: Image.asset(
                                                  'assets/page-4/images/button-1-yv9.png',
                                                  width: 51*fem,
                                                  height: 31*fem,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    // cardroomtvM (240:536)
                                    padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 11*fem),
                                    width: 160*fem,
                                    height: double.infinity,
                                    decoration: BoxDecoration (
                                      border: Border.all(color: Color(0x7fffffff)),
                                      color: Color(0xfff8f8f8),
                                      borderRadius: BorderRadius.circular(22*fem),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x283b4d56),
                                          offset: Offset(0*fem, 20*fem),
                                          blurRadius: 20*fem,
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          // autogrouppthbxQR (R8ZyshwUZ9A6LuaqRxPthB)
                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 8.5*fem),
                                          padding: EdgeInsets.fromLTRB(128*fem, 10*fem, 10*fem, 10*fem),
                                          width: double.infinity,
                                          height: 120*fem,
                                          decoration: BoxDecoration (
                                            borderRadius: BorderRadius.circular(22*fem),
                                            image: DecorationImage (
                                              fit: BoxFit.cover,
                                              image: AssetImage (
                                                'assets/page-4/images/image-bg-UDf.png',
                                              ),
                                            ),
                                          ),
                                          child: Align(
                                            // moreS4h (I240:536;240:417)
                                            alignment: Alignment.topRight,
                                            child: SizedBox(
                                              width: 22*fem,
                                              height: 22*fem,
                                              child: Container(
                                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 78*fem),
                                                child: Image.asset(
                                                  'assets/page-4/images/more-EaV.png',
                                                  width: 22*fem,
                                                  height: 22*fem,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          // livingroomXbw (I240:536;240:419)
                                          margin: EdgeInsets.fromLTRB(10*fem, 0*fem, 0*fem, 11.5*fem),
                                          child: Text(
                                            'Living room',
                                            style: SafeGoogleFont (
                                              'Outfit',
                                              fontSize: 14*ffem,
                                              fontWeight: FontWeight.w600,
                                              height: 0.7142857143*ffem/fem,
                                              color: Color(0xff4e4e4e),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          // devicesdus (I240:536;240:420)
                                          margin: EdgeInsets.fromLTRB(10*fem, 0*fem, 0*fem, 8*fem),
                                          child: Text(
                                            '4 devices',
                                            style: SafeGoogleFont (
                                              'Outfit',
                                              fontSize: 14*ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 0.7142857143*ffem/fem,
                                              color: Color(0xff979797),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          // frame17Knh (I240:536;240:421)
                                          margin: EdgeInsets.fromLTRB(12*fem, 0*fem, 8*fem, 0*fem),
                                          width: double.infinity,
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                // offRqj (I240:536;240:422)
                                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 61*fem, 0*fem),
                                                child: Text(
                                                  'OFF',
                                                  style: SafeGoogleFont (
                                                    'Outfit',
                                                    fontSize: 14*ffem,
                                                    fontWeight: FontWeight.w600,
                                                    height: 0.7142857143*ffem/fem,
                                                    color: Color(0xff4e4e4e),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                // button19mj (I240:536;240:423)
                                                width: 51*fem,
                                                height: 31*fem,
                                                child: Image.asset(
                                                  'assets/page-4/images/button-1-EGR.png',
                                                  width: 51*fem,
                                                  height: 31*fem,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30*fem,
                            ),
                            Container(
                              // autogroupfp53rg9 (R8Zz1Ciz6SXXk4fCWvfp53)
                              width: double.infinity,
                              height: 210*fem,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // cardroom13F (240:549)
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 29*fem, 0*fem),
                                    padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 11*fem),
                                    width: 160*fem,
                                    height: double.infinity,
                                    decoration: BoxDecoration (
                                      border: Border.all(color: Color(0x7fffffff)),
                                      color: Color(0xfff8f8f8),
                                      borderRadius: BorderRadius.circular(22*fem),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x283b4d56),
                                          offset: Offset(0*fem, 20*fem),
                                          blurRadius: 20*fem,
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          // autogroupbl3pmgd (R8Zz92qGmaMhWsWsJ5BL3P)
                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 8.5*fem),
                                          padding: EdgeInsets.fromLTRB(128*fem, 10*fem, 10*fem, 10*fem),
                                          width: double.infinity,
                                          height: 120*fem,
                                          decoration: BoxDecoration (
                                            image: DecorationImage (
                                              fit: BoxFit.cover,
                                              image: AssetImage (
                                                'assets/page-4/images/image-bg-QYh.png',
                                              ),
                                            ),
                                          ),
                                          child: Align(
                                            // moreQjb (I240:549;240:128)
                                            alignment: Alignment.topRight,
                                            child: SizedBox(
                                              width: 22*fem,
                                              height: 22*fem,
                                              child: Container(
                                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 78*fem),
                                                child: Image.asset(
                                                  'assets/page-4/images/more-2zm.png',
                                                  width: 22*fem,
                                                  height: 22*fem,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          // livingroomHHb (I240:549;240:145)
                                          margin: EdgeInsets.fromLTRB(10*fem, 0*fem, 0*fem, 11.5*fem),
                                          child: Text(
                                            'Living room',
                                            style: SafeGoogleFont (
                                              'Outfit',
                                              fontSize: 14*ffem,
                                              fontWeight: FontWeight.w600,
                                              height: 0.7142857143*ffem/fem,
                                              color: Color(0xff4e4e4e),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          // devicesb3P (I240:549;240:147)
                                          margin: EdgeInsets.fromLTRB(10*fem, 0*fem, 0*fem, 8*fem),
                                          child: Text(
                                            '4 devices',
                                            style: SafeGoogleFont (
                                              'Outfit',
                                              fontSize: 14*ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 0.7142857143*ffem/fem,
                                              color: Color(0xff979797),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          // frame177XX (I240:549;240:155)
                                          margin: EdgeInsets.fromLTRB(12*fem, 0*fem, 8*fem, 0*fem),
                                          width: double.infinity,
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                // onTLV (I240:549;240:148)
                                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 67*fem, 0*fem),
                                                child: Text(
                                                  'ON',
                                                  style: SafeGoogleFont (
                                                    'Outfit',
                                                    fontSize: 14*ffem,
                                                    fontWeight: FontWeight.w600,
                                                    height: 0.7142857143*ffem/fem,
                                                    color: Color(0xff4e4e4e),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                // button1BGV (I240:549;240:149)
                                                width: 51*fem,
                                                height: 31*fem,
                                                child: Image.asset(
                                                  'assets/page-4/images/button-1.png',
                                                  width: 51*fem,
                                                  height: 31*fem,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    // cardroomuyB (240:550)
                                    padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 11*fem),
                                    width: 160*fem,
                                    height: double.infinity,
                                    decoration: BoxDecoration (
                                      border: Border.all(color: Color(0x7fffffff)),
                                      color: Color(0xfff8f8f8),
                                      borderRadius: BorderRadius.circular(22*fem),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x283b4d56),
                                          offset: Offset(0*fem, 20*fem),
                                          blurRadius: 20*fem,
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          // autogroupepnmxwT (R8ZzMmy3BnV9J39HYKePnM)
                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 8.5*fem),
                                          padding: EdgeInsets.fromLTRB(128*fem, 10*fem, 10*fem, 10*fem),
                                          width: double.infinity,
                                          height: 120*fem,
                                          decoration: BoxDecoration (
                                            image: DecorationImage (
                                              fit: BoxFit.cover,
                                              image: AssetImage (
                                                'assets/page-4/images/image-bg-d3f.png',
                                              ),
                                            ),
                                          ),
                                          child: Align(
                                            // morepyf (I240:550;240:417)
                                            alignment: Alignment.topRight,
                                            child: SizedBox(
                                              width: 22*fem,
                                              height: 22*fem,
                                              child: Container(
                                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 78*fem),
                                                child: Image.asset(
                                                  'assets/page-4/images/more-yVs.png',
                                                  width: 22*fem,
                                                  height: 22*fem,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          // livingroomXNH (I240:550;240:419)
                                          margin: EdgeInsets.fromLTRB(10*fem, 0*fem, 0*fem, 11.5*fem),
                                          child: Text(
                                            'Living room',
                                            style: SafeGoogleFont (
                                              'Outfit',
                                              fontSize: 14*ffem,
                                              fontWeight: FontWeight.w600,
                                              height: 0.7142857143*ffem/fem,
                                              color: Color(0xff4e4e4e),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          // deviceseC1 (I240:550;240:420)
                                          margin: EdgeInsets.fromLTRB(10*fem, 0*fem, 0*fem, 8*fem),
                                          child: Text(
                                            '4 devices',
                                            style: SafeGoogleFont (
                                              'Outfit',
                                              fontSize: 14*ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 0.7142857143*ffem/fem,
                                              color: Color(0xff979797),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          // frame17xyP (I240:550;240:421)
                                          margin: EdgeInsets.fromLTRB(12*fem, 0*fem, 8*fem, 0*fem),
                                          width: double.infinity,
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                // offuNq (I240:550;240:422)
                                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 61*fem, 0*fem),
                                                child: Text(
                                                  'OFF',
                                                  style: SafeGoogleFont (
                                                    'Outfit',
                                                    fontSize: 14*ffem,
                                                    fontWeight: FontWeight.w600,
                                                    height: 0.7142857143*ffem/fem,
                                                    color: Color(0xff4e4e4e),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                // button1dJq (I240:550;240:423)
                                                width: 51*fem,
                                                height: 31*fem,
                                                child: Image.asset(
                                                  'assets/page-4/images/button-1-RDB.png',
                                                  width: 51*fem,
                                                  height: 31*fem,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      // topcontainerxc1 (250:645)
                      left: 155.3200073242*fem,
                      top: 0*fem,
                      child: Align(
                        child: SizedBox(
                          width: 90.64*fem,
                          height: 23.43*fem,
                          child: Image.asset(
                            'assets/page-4/images/top-container.png',
                            width: 90.64*fem,
                            height: 23.43*fem,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // subtractQiu (250:832)
              left: 20*fem,
              top: 253*fem,
              child: Align(
                child: SizedBox(
                  width: 403*fem,
                  height: 20*fem,
                  child: Image.asset(
                    'assets/page-4/images/subtract.png',
                    width: 403*fem,
                    height: 20*fem,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
          );
  }
}