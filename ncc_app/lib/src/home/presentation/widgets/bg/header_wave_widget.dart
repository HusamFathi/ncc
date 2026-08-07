// RPSCustomPainter class remains at the bottom of the file
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class HeaderWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Apply a vertical flip
    canvas.translate(0, size.height);
    canvas.scale(1, -1);

    Path path_0 = Path();
    path_0.moveTo(0, size.height * 1.016835);
    path_0.cubicTo(
      0,
      size.height * 1.016835,
      0,
      size.height * 0.2020202,
      0,
      size.height * 0.2020202,
    );
    path_0.cubicTo(
      size.width * 0.02214851,
      size.height * 0.2148830,
      size.width * 0.04429703,
      size.height * 0.2277458,
      size.width * 0.06805556,
      size.height * 0.2424242,
    );
    path_0.cubicTo(
      size.width * 0.09181409,
      size.height * 0.2571027,
      size.width * 0.1171826,
      size.height * 0.2735969,
      size.width * 0.1402778,
      size.height * 0.2491582,
    );
    path_0.cubicTo(
      size.width * 0.1633729,
      size.height * 0.2247196,
      size.width * 0.1841947,
      size.height * 0.1593482,
      size.width * 0.2076389,
      size.height * 0.1717172,
    );
    path_0.cubicTo(
      size.width * 0.2310831,
      size.height * 0.1840862,
      size.width * 0.2571498,
      size.height * 0.2741956,
      size.width * 0.2798611,
      size.height * 0.2693603,
    );
    path_0.cubicTo(
      size.width * 0.3025724,
      size.height * 0.2645249,
      size.width * 0.3219283,
      size.height * 0.1647448,
      size.width * 0.3458333,
      size.height * 0.1599327,
    );
    path_0.cubicTo(
      size.width * 0.3697383,
      size.height * 0.1551205,
      size.width * 0.3981924,
      size.height * 0.2452764,
      size.width * 0.4256944,
      size.height * 0.2693603,
    );
    path_0.cubicTo(
      size.width * 0.4531965,
      size.height * 0.2934441,
      size.width * 0.4797466,
      size.height * 0.2514559,
      size.width * 0.5062500,
      size.height * 0.2087542,
    );
    path_0.cubicTo(
      size.width * 0.5327534,
      size.height * 0.1660525,
      size.width * 0.5592101,
      size.height * 0.1226372,
      size.width * 0.5812500,
      size.height * 0.1380471,
    );
    path_0.cubicTo(
      size.width * 0.6032899,
      size.height * 0.1534570,
      size.width * 0.6209130,
      size.height * 0.2276921,
      size.width * 0.6437500,
      size.height * 0.2390572,
    );
    path_0.cubicTo(
      size.width * 0.6665870,
      size.height * 0.2504224,
      size.width * 0.6946380,
      size.height * 0.1989175,
      size.width * 0.7152778,
      size.height * 0.1700337,
    );
    path_0.cubicTo(
      size.width * 0.7359176,
      size.height * 0.1411498,
      size.width * 0.7491463,
      size.height * 0.1348870,
      size.width * 0.7722222,
      size.height * 0.1531987,
    );
    path_0.cubicTo(
      size.width * 0.7952981,
      size.height * 0.1715103,
      size.width * 0.8282213,
      size.height * 0.2143965,
      size.width * 0.8562500,
      size.height * 0.2104377,
    );
    path_0.cubicTo(
      size.width * 0.8842787,
      size.height * 0.2064789,
      size.width * 0.9074130,
      size.height * 0.1556751,
      size.width * 0.9305556,
      size.height * 0.1464646,
    );
    path_0.cubicTo(
      size.width * 0.9536981,
      size.height * 0.1372542,
      size.width * 0.9768491,
      size.height * 0.1696372,
      size.width,
      size.height * 0.2020202,
    );
    path_0.cubicTo(
      size.width,
      size.height * 0.2020202,
      size.width,
      size.height * 1.016835,
      size.width,
      size.height * 1.016835,
    );
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.shader = ui.Gradient.linear(
      Offset(0, size.height * 0.5000000),
      Offset(size.width, size.height * 0.5000000),
      [
        const Color.fromRGBO(186, 68, 147, 1.0),
        const Color.fromRGBO(132, 42, 216, 1.0),
        const Color.fromRGBO(115, 70, 148, 1.0),
      ],
      [0, 0.35, 1],
    );
    canvas.drawPath(path_0, paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(0, size.height * 1.016835);
    path_1.cubicTo(
      0,
      size.height * 1.016835,
      0,
      size.height * 0.4057239,
      0,
      size.height * 0.4057239,
    );
    path_1.cubicTo(
      size.width * 0.02726200,
      size.height * 0.4312858,
      size.width * 0.05452399,
      size.height * 0.4568477,
      size.width * 0.07777778,
      size.height * 0.4579125,
    );
    path_1.cubicTo(
      size.width * 0.1010316,
      size.height * 0.4589772,
      size.width * 0.1202771,
      size.height * 0.4355449,
      size.width * 0.1430556,
      size.height * 0.4040404,
    );
    path_1.cubicTo(
      size.width * 0.1658340,
      size.height * 0.3725359,
      size.width * 0.1921452,
      size.height * 0.3329591,
      size.width * 0.2131944,
      size.height * 0.3434343,
    );
    path_1.cubicTo(
      size.width * 0.2342436,
      size.height * 0.3539096,
      size.width * 0.2500308,
      size.height * 0.4144369,
      size.width * 0.2750000,
      size.height * 0.4191919,
    );
    path_1.cubicTo(
      size.width * 0.2999692,
      size.height * 0.4239469,
      size.width * 0.3341205,
      size.height * 0.3729296,
      size.width * 0.3618056,
      size.height * 0.3636364,
    );
    path_1.cubicTo(
      size.width * 0.3894906,
      size.height * 0.3543432,
      size.width * 0.4107095,
      size.height * 0.3867741,
      size.width * 0.4361111,
      size.height * 0.3888889,
    );
    path_1.cubicTo(
      size.width * 0.4615127,
      size.height * 0.3910037,
      size.width * 0.4910970,
      size.height * 0.3628024,
      size.width * 0.5131944,
      size.height * 0.3552189,
    );
    path_1.cubicTo(
      size.width * 0.5352919,
      size.height * 0.3476353,
      size.width * 0.5499025,
      size.height * 0.3606694,
      size.width * 0.5687500,
      size.height * 0.3973064,
    );
    path_1.cubicTo(
      size.width * 0.5875975,
      size.height * 0.4339433,
      size.width * 0.6106818,
      size.height * 0.4941831,
      size.width * 0.6333333,
      size.height * 0.4747475,
    );
    path_1.cubicTo(
      size.width * 0.6559849,
      size.height * 0.4553119,
      size.width * 0.6782036,
      size.height * 0.3562009,
      size.width * 0.7020833,
      size.height * 0.3350168,
    );
    path_1.cubicTo(
      size.width * 0.7259631,
      size.height * 0.3138328,
      size.width * 0.7515038,
      size.height * 0.3705758,
      size.width * 0.7777778,
      size.height * 0.3804714,
    );
    path_1.cubicTo(
      size.width * 0.8040517,
      size.height * 0.3903670,
      size.width * 0.8310588,
      size.height * 0.3534153,
      size.width * 0.8569444,
      size.height * 0.3484848,
    );
    path_1.cubicTo(
      size.width * 0.8828301,
      size.height * 0.3435544,
      size.width * 0.9075943,
      size.height * 0.3706452,
      size.width * 0.9312500,
      size.height * 0.3855219,
    );
    path_1.cubicTo(
      size.width * 0.9549057,
      size.height * 0.4003986,
      size.width * 0.9774528,
      size.height * 0.4030613,
      size.width,
      size.height * 0.4057239,
    );
    path_1.cubicTo(
      size.width,
      size.height * 0.4057239,
      size.width,
      size.height * 1.016835,
      size.width,
      size.height * 1.016835,
    );
    path_1.close();

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.shader = ui.Gradient.linear(
      Offset(0, size.height * 0.5000000),
      Offset(size.width, size.height * 0.5000000),
      [
        const Color.fromRGBO(186, 68, 147, 1.0),
        const Color.fromRGBO(132, 42, 216, 1.0),
        const Color.fromRGBO(115, 70, 148, 1.0),
      ],
      [0, 0.35, 1],
    );
    canvas.drawPath(path_1, paint1Fill);

    Path path_2 = Path();
    path_2.moveTo(0, size.height * 1.016835);
    path_2.cubicTo(
      0,
      size.height * 1.016835,
      0,
      size.height * 0.6094276,
      0,
      size.height * 0.6094276,
    );
    path_2.cubicTo(
      size.width * 0.02244752,
      size.height * 0.6385052,
      size.width * 0.04489504,
      size.height * 0.6675828,
      size.width * 0.06736111,
      size.height * 0.6599327,
    );
    path_2.cubicTo(
      size.width * 0.08982718,
      size.height * 0.6522825,
      size.width * 0.1123118,
      size.height * 0.6079046,
      size.width * 0.1381944,
      size.height * 0.5841751,
    );
    path_2.cubicTo(
      size.width * 0.1640771,
      size.height * 0.5604456,
      size.width * 0.1933578,
      size.height * 0.5573645,
      size.width * 0.2173611,
      size.height * 0.5875421,
    );
    path_2.cubicTo(
      size.width * 0.2413645,
      size.height * 0.6177196,
      size.width * 0.2600905,
      size.height * 0.6811558,
      size.width * 0.2854167,
      size.height * 0.6750842,
    );
    path_2.cubicTo(
      size.width * 0.3107428,
      size.height * 0.6690126,
      size.width * 0.3426691,
      size.height * 0.5934331,
      size.width * 0.3652778,
      size.height * 0.5555556,
    );
    path_2.cubicTo(
      size.width * 0.3878865,
      size.height * 0.5176780,
      size.width * 0.4011777,
      size.height * 0.5175022,
      size.width * 0.4250000,
      size.height * 0.5521886,
    );
    path_2.cubicTo(
      size.width * 0.4488223,
      size.height * 0.5868749,
      size.width * 0.4831759,
      size.height * 0.6564234,
      size.width * 0.5055556,
      size.height * 0.6616162,
    );
    path_2.cubicTo(
      size.width * 0.5279352,
      size.height * 0.6668089,
      size.width * 0.5383410,
      size.height * 0.6076460,
      size.width * 0.5590278,
      size.height * 0.6077441,
    );
    path_2.cubicTo(
      size.width * 0.5797145,
      size.height * 0.6078422,
      size.width * 0.6106822,
      size.height * 0.6672014,
      size.width * 0.6368056,
      size.height * 0.6784512,
    );
    path_2.cubicTo(
      size.width * 0.6629289,
      size.height * 0.6897010,
      size.width * 0.6842079,
      size.height * 0.6528415,
      size.width * 0.7104167,
      size.height * 0.6178451,
    );
    path_2.cubicTo(
      size.width * 0.7366254,
      size.height * 0.5828488,
      size.width * 0.7677639,
      size.height * 0.5497157,
      size.width * 0.7958333,
      size.height * 0.5572391,
    );
    path_2.cubicTo(
      size.width * 0.8239028,
      size.height * 0.5647625,
      size.width * 0.8489033,
      size.height * 0.6129424,
      size.width * 0.8694444,
      size.height * 0.6094276,
    );
    path_2.cubicTo(
      size.width * 0.8899856,
      size.height * 0.6059128,
      size.width * 0.9060673,
      size.height * 0.5507033,
      size.width * 0.9270833,
      size.height * 0.5420875,
    );
    path_2.cubicTo(
      size.width * 0.9480994,
      size.height * 0.5334718,
      size.width * 0.9740497,
      size.height * 0.5714497,
      size.width,
      size.height * 0.6094276,
    );
    path_2.cubicTo(
      size.width,
      size.height * 0.6094276,
      size.width,
      size.height * 1.016835,
      size.width,
      size.height * 1.016835,
    );
    path_2.close();

    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.shader = ui.Gradient.linear(
      Offset(0, size.height * 0.5000000),
      Offset(size.width, size.height * 0.5000000),
      [
        const Color.fromRGBO(186, 68, 147, 1.0),
        const Color.fromRGBO(132, 42, 216, 1.0),
        const Color.fromRGBO(115, 70, 148, 1.0),
      ],
      [0, 0.35, 1],
    );
    canvas.drawPath(path_2, paint2Fill);

    Path path_3 = Path();
    path_3.moveTo(0, size.height * 1.016835);
    path_3.cubicTo(
      0,
      size.height * 1.016835,
      0,
      size.height * 0.8131313,
      0,
      size.height * 0.8131313,
    );
    path_3.cubicTo(
      size.width * 0.01811033,
      size.height * 0.8197237,
      size.width * 0.03622066,
      size.height * 0.8263160,
      size.width * 0.05902778,
      size.height * 0.8080808,
    );
    path_3.cubicTo(
      size.width * 0.08183490,
      size.height * 0.7898456,
      size.width * 0.1093388,
      size.height * 0.7467828,
      size.width * 0.1326389,
      size.height * 0.7643098,
    );
    path_3.cubicTo(
      size.width * 0.1559390,
      size.height * 0.7818367,
      size.width * 0.1750352,
      size.height * 0.8599534,
      size.width * 0.2027778,
      size.height * 0.8838384,
    );
    path_3.cubicTo(
      size.width * 0.2305203,
      size.height * 0.9077234,
      size.width * 0.2669092,
      size.height * 0.8773767,
      size.width * 0.2937500,
      size.height * 0.8484848,
    );
    path_3.cubicTo(
      size.width * 0.3205908,
      size.height * 0.8195930,
      size.width * 0.3378837,
      size.height * 0.7921560,
      size.width * 0.3618056,
      size.height * 0.7777778,
    );
    path_3.cubicTo(
      size.width * 0.3857274,
      size.height * 0.7633995,
      size.width * 0.4162783,
      size.height * 0.7620800,
      size.width * 0.4361111,
      size.height * 0.7828283,
    );
    path_3.cubicTo(
      size.width * 0.4559439,
      size.height * 0.8035765,
      size.width * 0.4650585,
      size.height * 0.8463925,
      size.width * 0.4888889,
      size.height * 0.8653199,
    );
    path_3.cubicTo(
      size.width * 0.5127192,
      size.height * 0.8842473,
      size.width * 0.5512653,
      size.height * 0.8792861,
      size.width * 0.5819444,
      size.height * 0.8720539,
    );
    path_3.cubicTo(
      size.width * 0.6126236,
      size.height * 0.8648217,
      size.width * 0.6354359,
      size.height * 0.8553184,
      size.width * 0.6555556,
      size.height * 0.8282828,
    );
    path_3.cubicTo(
      size.width * 0.6756752,
      size.height * 0.8012473,
      size.width * 0.6931022,
      size.height * 0.7566794,
      size.width * 0.7159722,
      size.height * 0.7424242,
    );
    path_3.cubicTo(
      size.width * 0.7388422,
      size.height * 0.7281691,
      size.width * 0.7671553,
      size.height * 0.7442265,
      size.width * 0.7951389,
      size.height * 0.7693603,
    );
    path_3.cubicTo(
      size.width * 0.8231225,
      size.height * 0.7944940,
      size.width * 0.8507766,
      size.height * 0.8287041,
      size.width * 0.8687500,
      size.height * 0.8367003,
    );
    path_3.cubicTo(
      size.width * 0.8867234,
      size.height * 0.8446966,
      size.width * 0.8950162,
      size.height * 0.8264790,
      size.width * 0.9152778,
      size.height * 0.8181818,
    );
    path_3.cubicTo(
      size.width * 0.9355393,
      size.height * 0.8098847,
      size.width * 0.9677697,
      size.height * 0.8115080,
      size.width,
      size.height * 0.8131313,
    );
    path_3.cubicTo(
      size.width,
      size.height * 0.8131313,
      size.width,
      size.height * 1.016835,
      size.width,
      size.height * 1.016835,
    );
    path_3.close();

    Paint paint3Fill = Paint()..style = PaintingStyle.fill;
    paint3Fill.shader = ui.Gradient.linear(
      Offset(0, size.height * 0.5000000),
      Offset(size.width, size.height * 0.5000000),
      [
        const Color.fromRGBO(186, 68, 147, 1.0),
        const Color.fromRGBO(132, 42, 216, 1.0),
        const Color.fromRGBO(115, 70, 148, 1.0),
      ],
      [0, 0.35, 1],
    );
    canvas.drawPath(path_3, paint3Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
