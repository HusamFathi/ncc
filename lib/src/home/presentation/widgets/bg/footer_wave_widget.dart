import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class FooterWavePainter extends CustomPainter {
  final List<Color> waveColors; // Allow customizing colors

  FooterWavePainter({List<Color>? waveColors})
    : waveColors =
          waveColors ??
          [
            const Color.fromRGBO(186, 68, 147, 1.0),
            const Color.fromRGBO(132, 42, 216, 1.0),
            const Color.fromRGBO(115, 70, 148, 1.0),
          ];

  double _mapY(
    double value,
    double originalMin,
    double originalMax,
    double newMin,
    double newMax,
  ) {
    // Ensure originalMax is not equal to originalMin to avoid division by zero
    if ((originalMax - originalMin).abs() < 0.00001) return newMin;
    return newMin +
        (value - originalMin) * (newMax - newMin) / (originalMax - originalMin);
  }

  @override
  void paint(Canvas canvas, Size size) {
    // Apply a vertical flip so Y=0 is at the bottom and Y=size.height is at the top
    canvas.translate(0, size.height);
    canvas.scale(1, -1);

    // Define Y-ranges for original header paths (approximations)
    // These define the shape of the wave segments we are borrowing
    const double originalMinYPath0 = 0.12;
    const double originalMaxYPath0 = 0.30;

    const double originalMinYPath1 = 0.31;
    const double originalMaxYPath1 = 0.50;

    // Define target Y-ranges for TOP wave layers (as factors of size.height)
    // Waves will be in the top portion of the widget.
    // Y=1.0 is the absolute top, Y=0.0 is the absolute bottom in this transformed space.

    // Layer 1 (uppermost waves)
    const double topRegionLayer1MinY =
        0.85; // Waves start from 85% of height (15% from top edge)
    const double topRegionLayer1MaxY = 1.0; // Waves go up to the top edge

    // Layer 2 (slightly below layer 1 for layering effect)
    const double topRegionLayer2MinY = 0.80; // Starts a bit lower than layer 1
    const double topRegionLayer2MaxY = 0.95; // Ends a bit lower than layer 1

    // --- Path 1 (waves at the top, filling downwards) ---
    Path path1 = Path();
    // Starting Y for the wave, mapped to the top region
    double startWaveY1 = _mapY(
      0.2020202, // An arbitrary reference point from the original header wave shape
      originalMinYPath0,
      originalMaxYPath0,
      topRegionLayer1MinY,
      topRegionLayer1MaxY,
    );
    path1.moveTo(0, size.height * startWaveY1);

    // Replicating cubic bezier segments with Y coordinates mapped to the top region
    path1.cubicTo(
      size.width * 0.02214851,
      size.height *
          _mapY(
            0.2148830,
            originalMinYPath0,
            originalMaxYPath0,
            topRegionLayer1MinY,
            topRegionLayer1MaxY,
          ),
      size.width * 0.04429703,
      size.height *
          _mapY(
            0.2277458,
            originalMinYPath0,
            originalMaxYPath0,
            topRegionLayer1MinY,
            topRegionLayer1MaxY,
          ),
      size.width * 0.06805556,
      size.height *
          _mapY(
            0.2424242,
            originalMinYPath0,
            originalMaxYPath0,
            topRegionLayer1MinY,
            topRegionLayer1MaxY,
          ),
    );
    // ... (all other cubicTo calls for path1, using topRegionLayer1MinY, topRegionLayer1MaxY)
    path1.cubicTo(
      size.width * 0.09181409,
      size.height *
          _mapY(
            0.2571027,
            originalMinYPath0,
            originalMaxYPath0,
            topRegionLayer1MinY,
            topRegionLayer1MaxY,
          ),
      size.width * 0.1171826,
      size.height *
          _mapY(
            0.2735969,
            originalMinYPath0,
            originalMaxYPath0,
            topRegionLayer1MinY,
            topRegionLayer1MaxY,
          ),
      size.width * 0.1402778,
      size.height *
          _mapY(
            0.2491582,
            originalMinYPath0,
            originalMaxYPath0,
            topRegionLayer1MinY,
            topRegionLayer1MaxY,
          ),
    );
    path1.cubicTo(
      size.width * 0.1633729,
      size.height *
          _mapY(
            0.2247196,
            originalMinYPath0,
            originalMaxYPath0,
            topRegionLayer1MinY,
            topRegionLayer1MaxY,
          ),
      size.width * 0.1841947,
      size.height *
          _mapY(
            0.1593482,
            originalMinYPath0,
            originalMaxYPath0,
            topRegionLayer1MinY,
            topRegionLayer1MaxY,
          ),
      size.width * 0.2076389,
      size.height *
          _mapY(
            0.1717172,
            originalMinYPath0,
            originalMaxYPath0,
            topRegionLayer1MinY,
            topRegionLayer1MaxY,
          ),
    );
    path1.cubicTo(
      size.width * 0.2310831,
      size.height *
          _mapY(
            0.1840862,
            originalMinYPath0,
            originalMaxYPath0,
            topRegionLayer1MinY,
            topRegionLayer1MaxY,
          ),
      size.width * 0.2571498,
      size.height *
          _mapY(
            0.2741956,
            originalMinYPath0,
            originalMaxYPath0,
            topRegionLayer1MinY,
            topRegionLayer1MaxY,
          ),
      size.width * 0.2798611,
      size.height *
          _mapY(
            0.2693603,
            originalMinYPath0,
            originalMaxYPath0,
            topRegionLayer1MinY,
            topRegionLayer1MaxY,
          ),
    );
    path1.cubicTo(
      size.width * 0.3025724,
      size.height *
          _mapY(
            0.2645249,
            originalMinYPath0,
            originalMaxYPath0,
            topRegionLayer1MinY,
            topRegionLayer1MaxY,
          ),
      size.width * 0.3219283,
      size.height *
          _mapY(
            0.1647448,
            originalMinYPath0,
            originalMaxYPath0,
            topRegionLayer1MinY,
            topRegionLayer1MaxY,
          ),
      size.width * 0.3458333,
      size.height *
          _mapY(
            0.1599327,
            originalMinYPath0,
            originalMaxYPath0,
            topRegionLayer1MinY,
            topRegionLayer1MaxY,
          ),
    );
    path1.cubicTo(
      size.width * 0.3697383,
      size.height *
          _mapY(
            0.1551205,
            originalMinYPath0,
            originalMaxYPath0,
            topRegionLayer1MinY,
            topRegionLayer1MaxY,
          ),
      size.width * 0.3981924,
      size.height *
          _mapY(
            0.2452764,
            originalMinYPath0,
            originalMaxYPath0,
            topRegionLayer1MinY,
            topRegionLayer1MaxY,
          ),
      size.width * 0.4256944,
      size.height *
          _mapY(
            0.2693603,
            originalMinYPath0,
            originalMaxYPath0,
            topRegionLayer1MinY,
            topRegionLayer1MaxY,
          ),
    );
    path1.cubicTo(
      size.width * 0.4531965,
      size.height *
          _mapY(
            0.2934441,
            originalMinYPath0,
            originalMaxYPath0,
            topRegionLayer1MinY,
            topRegionLayer1MaxY,
          ),
      size.width * 0.4797466,
      size.height *
          _mapY(
            0.2514559,
            originalMinYPath0,
            originalMaxYPath0,
            topRegionLayer1MinY,
            topRegionLayer1MaxY,
          ),
      size.width * 0.5062500,
      size.height *
          _mapY(
            0.2087542,
            originalMinYPath0,
            originalMaxYPath0,
            topRegionLayer1MinY,
            topRegionLayer1MaxY,
          ),
    );
    path1.cubicTo(
      size.width * 0.5327534,
      size.height *
          _mapY(
            0.1660525,
            originalMinYPath0,
            originalMaxYPath0,
            topRegionLayer1MinY,
            topRegionLayer1MaxY,
          ),
      size.width * 0.5592101,
      size.height *
          _mapY(
            0.1226372,
            originalMinYPath0,
            originalMaxYPath0,
            topRegionLayer1MinY,
            topRegionLayer1MaxY,
          ),
      size.width * 0.5812500,
      size.height *
          _mapY(
            0.1380471,
            originalMinYPath0,
            originalMaxYPath0,
            topRegionLayer1MinY,
            topRegionLayer1MaxY,
          ),
    );
    path1.cubicTo(
      size.width * 0.6032899,
      size.height *
          _mapY(
            0.1534570,
            originalMinYPath0,
            originalMaxYPath0,
            topRegionLayer1MinY,
            topRegionLayer1MaxY,
          ),
      size.width * 0.6209130,
      size.height *
          _mapY(
            0.2276921,
            originalMinYPath0,
            originalMaxYPath0,
            topRegionLayer1MinY,
            topRegionLayer1MaxY,
          ),
      size.width * 0.6437500,
      size.height *
          _mapY(
            0.2390572,
            originalMinYPath0,
            originalMaxYPath0,
            topRegionLayer1MinY,
            topRegionLayer1MaxY,
          ),
    );
    path1.cubicTo(
      size.width * 0.6665870,
      size.height *
          _mapY(
            0.2504224,
            originalMinYPath0,
            originalMaxYPath0,
            topRegionLayer1MinY,
            topRegionLayer1MaxY,
          ),
      size.width * 0.6946380,
      size.height *
          _mapY(
            0.1989175,
            originalMinYPath0,
            originalMaxYPath0,
            topRegionLayer1MinY,
            topRegionLayer1MaxY,
          ),
      size.width * 0.7152778,
      size.height *
          _mapY(
            0.1700337,
            originalMinYPath0,
            originalMaxYPath0,
            topRegionLayer1MinY,
            topRegionLayer1MaxY,
          ),
    );
    path1.cubicTo(
      size.width * 0.7359176,
      size.height *
          _mapY(
            0.1411498,
            originalMinYPath0,
            originalMaxYPath0,
            topRegionLayer1MinY,
            topRegionLayer1MaxY,
          ),
      size.width * 0.7491463,
      size.height *
          _mapY(
            0.1348870,
            originalMinYPath0,
            originalMaxYPath0,
            topRegionLayer1MinY,
            topRegionLayer1MaxY,
          ),
      size.width * 0.7722222,
      size.height *
          _mapY(
            0.1531987,
            originalMinYPath0,
            originalMaxYPath0,
            topRegionLayer1MinY,
            topRegionLayer1MaxY,
          ),
    );
    path1.cubicTo(
      size.width * 0.7952981,
      size.height *
          _mapY(
            0.1715103,
            originalMinYPath0,
            originalMaxYPath0,
            topRegionLayer1MinY,
            topRegionLayer1MaxY,
          ),
      size.width * 0.8282213,
      size.height *
          _mapY(
            0.2143965,
            originalMinYPath0,
            originalMaxYPath0,
            topRegionLayer1MinY,
            topRegionLayer1MaxY,
          ),
      size.width * 0.8562500,
      size.height *
          _mapY(
            0.2104377,
            originalMinYPath0,
            originalMaxYPath0,
            topRegionLayer1MinY,
            topRegionLayer1MaxY,
          ),
    );
    path1.cubicTo(
      size.width * 0.8842787,
      size.height *
          _mapY(
            0.2064789,
            originalMinYPath0,
            originalMaxYPath0,
            topRegionLayer1MinY,
            topRegionLayer1MaxY,
          ),
      size.width * 0.9074130,
      size.height *
          _mapY(
            0.1556751,
            originalMinYPath0,
            originalMaxYPath0,
            topRegionLayer1MinY,
            topRegionLayer1MaxY,
          ),
      size.width * 0.9305556,
      size.height *
          _mapY(
            0.1464646,
            originalMinYPath0,
            originalMaxYPath0,
            topRegionLayer1MinY,
            topRegionLayer1MaxY,
          ),
    );
    path1.cubicTo(
      size.width * 0.9536981,
      size.height *
          _mapY(
            0.1372542,
            originalMinYPath0,
            originalMaxYPath0,
            topRegionLayer1MinY,
            topRegionLayer1MaxY,
          ),
      size.width * 0.9768491,
      size.height *
          _mapY(
            0.1696372,
            originalMinYPath0,
            originalMaxYPath0,
            topRegionLayer1MinY,
            topRegionLayer1MaxY,
          ),
      size.width,
      size.height * startWaveY1,
    );

    // Close path by drawing lines to the bottom corners to fill downwards
    path1.lineTo(
      size.width,
      0,
    ); // Line to bottom-right (Y=0 is bottom in transformed space)
    path1.lineTo(0, 0); // Line to bottom-left
    path1.close(); // Close path

    Paint paintP1 = Paint()..style = PaintingStyle.fill;
    paintP1.shader = ui.Gradient.linear(
      Offset(size.width * 0.5, 0), // Gradient from bottom-center
      Offset(size.width * 0.5, size.height), // to top-center
      waveColors,
      [0.0, 0.35, 1.0],
    );
    canvas.drawPath(path1, paintP1);

    // --- Path 2 (waves at the top, filling downwards) ---
    Path path2 = Path();
    double startWaveY2 = _mapY(
      0.4057239, // Another arbitrary reference point from original header wave shape
      originalMinYPath1,
      originalMaxYPath1,
      topRegionLayer2MinY,
      topRegionLayer2MaxY,
    );
    path2.moveTo(0, size.height * startWaveY2);

    // Replicating cubic bezier segments with Y coordinates mapped to the top region
    path2.cubicTo(
      size.width * 0.02726200,
      size.height *
          _mapY(
            0.4312858,
            originalMinYPath1,
            originalMaxYPath1,
            topRegionLayer2MinY,
            topRegionLayer2MaxY,
          ),
      size.width * 0.05452399,
      size.height *
          _mapY(
            0.4568477,
            originalMinYPath1,
            originalMaxYPath1,
            topRegionLayer2MinY,
            topRegionLayer2MaxY,
          ),
      size.width * 0.07777778,
      size.height *
          _mapY(
            0.4579125,
            originalMinYPath1,
            originalMaxYPath1,
            topRegionLayer2MinY,
            topRegionLayer2MaxY,
          ),
    );
    // ... (all other cubicTo calls for path2, using topRegionLayer2MinY, topRegionLayer2MaxY)
    path2.cubicTo(
      size.width * 0.1010316,
      size.height *
          _mapY(
            0.4589772,
            originalMinYPath1,
            originalMaxYPath1,
            topRegionLayer2MinY,
            topRegionLayer2MaxY,
          ),
      size.width * 0.1202771,
      size.height *
          _mapY(
            0.4355449,
            originalMinYPath1,
            originalMaxYPath1,
            topRegionLayer2MinY,
            topRegionLayer2MaxY,
          ),
      size.width * 0.1430556,
      size.height *
          _mapY(
            0.4040404,
            originalMinYPath1,
            originalMaxYPath1,
            topRegionLayer2MinY,
            topRegionLayer2MaxY,
          ),
    );
    path2.cubicTo(
      size.width * 0.1658340,
      size.height *
          _mapY(
            0.3725359,
            originalMinYPath1,
            originalMaxYPath1,
            topRegionLayer2MinY,
            topRegionLayer2MaxY,
          ),
      size.width * 0.1921452,
      size.height *
          _mapY(
            0.3329591,
            originalMinYPath1,
            originalMaxYPath1,
            topRegionLayer2MinY,
            topRegionLayer2MaxY,
          ),
      size.width * 0.2131944,
      size.height *
          _mapY(
            0.3434343,
            originalMinYPath1,
            originalMaxYPath1,
            topRegionLayer2MinY,
            topRegionLayer2MaxY,
          ),
    );
    path2.cubicTo(
      size.width * 0.2342436,
      size.height *
          _mapY(
            0.3539096,
            originalMinYPath1,
            originalMaxYPath1,
            topRegionLayer2MinY,
            topRegionLayer2MaxY,
          ),
      size.width * 0.2500308,
      size.height *
          _mapY(
            0.4144369,
            originalMinYPath1,
            originalMaxYPath1,
            topRegionLayer2MinY,
            topRegionLayer2MaxY,
          ),
      size.width * 0.2750000,
      size.height *
          _mapY(
            0.4191919,
            originalMinYPath1,
            originalMaxYPath1,
            topRegionLayer2MinY,
            topRegionLayer2MaxY,
          ),
    );
    path2.cubicTo(
      size.width * 0.2999692,
      size.height *
          _mapY(
            0.4239469,
            originalMinYPath1,
            originalMaxYPath1,
            topRegionLayer2MinY,
            topRegionLayer2MaxY,
          ),
      size.width * 0.3341205,
      size.height *
          _mapY(
            0.3729296,
            originalMinYPath1,
            originalMaxYPath1,
            topRegionLayer2MinY,
            topRegionLayer2MaxY,
          ),
      size.width * 0.3618056,
      size.height *
          _mapY(
            0.3636364,
            originalMinYPath1,
            originalMaxYPath1,
            topRegionLayer2MinY,
            topRegionLayer2MaxY,
          ),
    );
    path2.cubicTo(
      size.width * 0.3894906,
      size.height *
          _mapY(
            0.3543432,
            originalMinYPath1,
            originalMaxYPath1,
            topRegionLayer2MinY,
            topRegionLayer2MaxY,
          ),
      size.width * 0.4107095,
      size.height *
          _mapY(
            0.3867741,
            originalMinYPath1,
            originalMaxYPath1,
            topRegionLayer2MinY,
            topRegionLayer2MaxY,
          ),
      size.width * 0.4361111,
      size.height *
          _mapY(
            0.3888889,
            originalMinYPath1,
            originalMaxYPath1,
            topRegionLayer2MinY,
            topRegionLayer2MaxY,
          ),
    );
    path2.cubicTo(
      size.width * 0.4615127,
      size.height *
          _mapY(
            0.3910037,
            originalMinYPath1,
            originalMaxYPath1,
            topRegionLayer2MinY,
            topRegionLayer2MaxY,
          ),
      size.width * 0.4910970,
      size.height *
          _mapY(
            0.3628024,
            originalMinYPath1,
            originalMaxYPath1,
            topRegionLayer2MinY,
            topRegionLayer2MaxY,
          ),
      size.width * 0.5131944,
      size.height *
          _mapY(
            0.3552189,
            originalMinYPath1,
            originalMaxYPath1,
            topRegionLayer2MinY,
            topRegionLayer2MaxY,
          ),
    );
    path2.cubicTo(
      size.width * 0.5352919,
      size.height *
          _mapY(
            0.3476353,
            originalMinYPath1,
            originalMaxYPath1,
            topRegionLayer2MinY,
            topRegionLayer2MaxY,
          ),
      size.width * 0.5499025,
      size.height *
          _mapY(
            0.3606694,
            originalMinYPath1,
            originalMaxYPath1,
            topRegionLayer2MinY,
            topRegionLayer2MaxY,
          ),
      size.width * 0.5687500,
      size.height *
          _mapY(
            0.3973064,
            originalMinYPath1,
            originalMaxYPath1,
            topRegionLayer2MinY,
            topRegionLayer2MaxY,
          ),
    );
    path2.cubicTo(
      size.width * 0.5875975,
      size.height *
          _mapY(
            0.4339433,
            originalMinYPath1,
            originalMaxYPath1,
            topRegionLayer2MinY,
            topRegionLayer2MaxY,
          ),
      size.width * 0.6106818,
      size.height *
          _mapY(
            0.4941831,
            originalMinYPath1,
            originalMaxYPath1,
            topRegionLayer2MinY,
            topRegionLayer2MaxY,
          ),
      size.width * 0.6333333,
      size.height *
          _mapY(
            0.4747475,
            originalMinYPath1,
            originalMaxYPath1,
            topRegionLayer2MinY,
            topRegionLayer2MaxY,
          ),
    );
    path2.cubicTo(
      size.width * 0.6559849,
      size.height *
          _mapY(
            0.4553119,
            originalMinYPath1,
            originalMaxYPath1,
            topRegionLayer2MinY,
            topRegionLayer2MaxY,
          ),
      size.width * 0.6782036,
      size.height *
          _mapY(
            0.3562009,
            originalMinYPath1,
            originalMaxYPath1,
            topRegionLayer2MinY,
            topRegionLayer2MaxY,
          ),
      size.width * 0.7020833,
      size.height *
          _mapY(
            0.3350168,
            originalMinYPath1,
            originalMaxYPath1,
            topRegionLayer2MinY,
            topRegionLayer2MaxY,
          ),
    );
    path2.cubicTo(
      size.width * 0.7259631,
      size.height *
          _mapY(
            0.3138328,
            originalMinYPath1,
            originalMaxYPath1,
            topRegionLayer2MinY,
            topRegionLayer2MaxY,
          ),
      size.width * 0.7515038,
      size.height *
          _mapY(
            0.3705758,
            originalMinYPath1,
            originalMaxYPath1,
            topRegionLayer2MinY,
            topRegionLayer2MaxY,
          ),
      size.width * 0.7777778,
      size.height *
          _mapY(
            0.3804714,
            originalMinYPath1,
            originalMaxYPath1,
            topRegionLayer2MinY,
            topRegionLayer2MaxY,
          ),
    );
    path2.cubicTo(
      size.width * 0.8040517,
      size.height *
          _mapY(
            0.3903670,
            originalMinYPath1,
            originalMaxYPath1,
            topRegionLayer2MinY,
            topRegionLayer2MaxY,
          ),
      size.width * 0.8310588,
      size.height *
          _mapY(
            0.3534153,
            originalMinYPath1,
            originalMaxYPath1,
            topRegionLayer2MinY,
            topRegionLayer2MaxY,
          ),
      size.width * 0.8569444,
      size.height *
          _mapY(
            0.3484848,
            originalMinYPath1,
            originalMaxYPath1,
            topRegionLayer2MinY,
            topRegionLayer2MaxY,
          ),
    );
    path2.cubicTo(
      size.width * 0.8828301,
      size.height *
          _mapY(
            0.3435544,
            originalMinYPath1,
            originalMaxYPath1,
            topRegionLayer2MinY,
            topRegionLayer2MaxY,
          ),
      size.width * 0.9075943,
      size.height *
          _mapY(
            0.3706452,
            originalMinYPath1,
            originalMaxYPath1,
            topRegionLayer2MinY,
            topRegionLayer2MaxY,
          ),
      size.width * 0.9312500,
      size.height *
          _mapY(
            0.3855219,
            originalMinYPath1,
            originalMaxYPath1,
            topRegionLayer2MinY,
            topRegionLayer2MaxY,
          ),
    );
    path2.cubicTo(
      size.width * 0.9549057,
      size.height *
          _mapY(
            0.4003986,
            originalMinYPath1,
            originalMaxYPath1,
            topRegionLayer2MinY,
            topRegionLayer2MaxY,
          ),
      size.width * 0.9774528,
      size.height *
          _mapY(
            0.4030613,
            originalMinYPath1,
            originalMaxYPath1,
            topRegionLayer2MinY,
            topRegionLayer2MaxY,
          ),
      size.width,
      size.height * startWaveY2,
    );

    // Close path by drawing lines to the bottom corners to fill downwards
    path2.lineTo(size.width, 0); // Line to bottom-right
    path2.lineTo(0, 0); // Line to bottom-left
    path2.close(); // Close path

    Paint paintP2 = Paint()..style = PaintingStyle.fill;
    List<Color> waveColorsLayer2 = waveColors
        .map(
          (c) => c.withValues(alpha: math.min(1.0, c.a * 0.85)),
        ) // Slightly less opaque or different tint
        .toList();
    if (waveColors.length > 1 && waveColorsLayer2.length > 1) {
      waveColorsLayer2[0] = waveColors[0].withValues(
        alpha: math.min(1.0, waveColors[0].a * 0.6),
      );
    }

    paintP2.shader = ui.Gradient.linear(
      Offset(size.width * 0.5, 0),
      Offset(size.width * 0.5, size.height),
      waveColorsLayer2,
      [0.0, 0.4, 1.0],
    );
    canvas.drawPath(path2, paintP2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate is! FooterWavePainter ||
        oldDelegate.waveColors != waveColors;
  }
}
