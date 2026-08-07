import 'package:flutter/material.dart';

//! app theme color
Color kHeritageRadioColorPrimary = Color(0xfffbaf3f);
Color kHeritageRadioColorSecondary = Color(0xfffdcf7e);
// center colors
Color kNCCPrimaryColor = Color(0xffba4493);
Color kNCCSecondaryColor = Color(0xff842ad8);
Color kNCCThirdColor = Color(0xfff5b2d1);

/// this value will be u`sed for all widgets that will need rounded corners
const double kRoundedCorners = 12;

//
//  tokens end points

const double kMediumRadius = 20;
const double kLargeRadius = 30;

///
const double kSmallRadius = 12;
////////////////////////////////////////////////////////////////

const double kTextFiledBordersRadius = 10;

///
/// gap between widgets and containers in pixels (double)
/// large is 40 medium is 25 small is 10 tiny is 10
const double kLargeGap = 40;

/// gap between widgets and containers in pixels (double)
/// large is 40 medium is 25 small is 10 tiny is 10
const double kMediumGap = (25);

/// gap between widgets and containers in pixels (double)
/// large is 40 medium is 25 small is 10 tiny is 10
const double kSmallGap = (10);

/// gap between widgets and containers in pixels (double)
/// large is 40 medium is 25 small is 10 tiny is 10
const double kTinyGap = (5);
//
///tiny padding is equal to 5
const double kTinyPadding = (5);

///small padding is equal to 10
const double kSmallPadding = (10);

///medium padding is equal to 25

const double kMediumPadding = (25);

///large padding is equal to 40

const double kLargePadding = (40);
////////////////////////////////////////////////////////////////

// sign /sin uip button size
Size kLargeButtonSize = const Size(225, 65);

///
///
///
///

/// auth forms min width
double kAuthFormsMinWidth = 350;

/// auth forms max width

double kAuthFormsMaxWidth = 400;
/////////////////////////////////////////////////////////////////////////////////////
/// animated container duration
Duration kAnimationDuration = const Duration(milliseconds: 500);
Curve kAnimationCurve = Curves.bounceIn;

///
///dividers
const double kDividerThicknessThin = 1.0;
const double kDividerThicknessMedium = 2.0;
const double kDividerThicknessThick = 3.0;

/// max screen content width designed for this app
double kMaxScreenWidth = 1000;

TextStyle kLandingBlocTitleTextStyle(context) =>
    Theme.of(context).textTheme.headlineMedium!;
const String kFacebookPageLink =
    'https://www.facebook.com/profile.php?id=61572682074346';
const String kInstagramPageLink = 'https://www.instagram.com/autobots.ly/';
const String kLinkedInPageLink =
    'https://www.linkedin.com/company/autobots-%D8%A3%D8%AA%D9%88%D8%A8%D9%88%D8%AA%D8%B3/?viewAsMember=true';
const String kSupportEmail = 'hello@autobots.ly';
const String termsOfUseLink = 'https://www.atheerio.com/terms-of-service';
const String privacyPolicyLink = 'https://www.atheerio.com/privacy'; //

const String kRadioHeritageId = 'radio_heritage';
