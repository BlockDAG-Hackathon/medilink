import 'package:flutter/material.dart';
import 'package:svg_path_parser/svg_path_parser.dart';


final Map<String, List<String>> _svgBodyPartsData = {
  'head': [
    'M69 0L63 4V14H60.5V19.5C61.3333 20 63 21.2 63 22V30L69 34H79L84.5 30V22L87.5 19.5V14H84.5V4L79 0H69Z',
    'M229 20L230.5 28L234 24.5V20H245V24.5V28L250 26.5V18L252.5 14L250 13V4L243 0H234L227.5 7V11L225.5 14L229 20Z'
  ],
  'neck': [
    'M84.5 39.5V34L78 39.5V47H95.5L84.5 39.5Z',
    'M65 40.5V35L67 34L71 39.5L71.5 47H54L65 40.5Z',
    'M238.5 22.5H236L235 30.5L219 45H226L236 47L237 33L238.5 30.5V22.5Z',
    'M241.5 22.5H240V33L241.5 33.5L243 47.5L248.5 45L257 43.5L243.5 33.5L243 30.5L241.5 22.5Z'
  ],
  'chest': [
    'M71 73.5V55L57.5 50L51.5 63L47.5 67.5L61.5 75L71 73.5Z',
    'M77 54L86.5 50H92.5L98.5 64L102 66V68L85.5 75L77 73.5V54Z'
  ],
  'back': [
    'M220 47H212L219 52L225 67L236 75.5L235 52L220 47Z',
    'M258 47L243 52V75.5L252 67L258 51L266 47H258Z',
    'M265 55.5H260L255.5 68.5L269.5 67V61L265 55.5Z',
    'M222.5 67L217.5 55.5H213L209 61V67H222.5Z',
    'M222.5 73L209 71L222.5 114.5L237 125.5L235 83L222.5 73Z',
    'M255.5 73L243 83L241.5 125.5L255.5 114.5L268.5 70L255.5 73Z'
  ],
  'shoulder': [
    'M100 62.5L95.5 51L100.5 51.5L109 63.5V68L100 62.5Z',
    'M113.5 57.5L109 51H102.5L109 60L111.5 66.5H113.5V57.5Z',
    'M48.5 62.5L53.5 51C51.8333 51 48.5 51.1 48.5 51.5C48.5 51.9 43.1667 59 40.5 62.5V67L48.5 62.5Z',
    'M36.5 57V67L47 51H40.5L36.5 57Z',
    'M213.5 51.5L204.5 50.5L196.5 63.5H198.5L200 67.5L213.5 51.5Z',
    'M264 53.5L278.5 67.5L280 60L275 51.5L267.5 50.5L264 53.5Z'
  ],
  'arm': [
    'M110 70H101.5L102.5 81.5L105 87L111.5 93.5H115V87L110 70Z', 
    'M119 79.5L115 74L115.5 93.5L117 94.5L120 91.5L119 79.5Z',
    'M114 103L107 98L106.506 93.5509L115.5 101V103H114Z', 
    'M121 96H117.5V107L132.5 132L135 131L126.5 118V110L121 96Z',
    'M115 120.5L108 101L116 106.5L129.5 131L128 135L115 120.5Z', 
    'M38 70H47L46 81.5L44 87L38 93.5509H34V96L30.5 92.5V81L34 74.5V87L38 70Z',
    'M42 98V93.5509L34 101L35.5 103L42 98Z', 
    'M30.5 105V96H27L21 118L14.5 131L17 132L30.5 105Z',
    'M19.5 132L23 135L35.5 118L42 101L34 105L19.5 132Z',
    'M270 87L272 67.5L282 77V95L278.5 96.5L275 98V95L270 87Z',
    'M283 104L279.5 99L278.5 104L274.5 103.5L279.5 118L288.5 127L283 115.5V104Z',
    'M285.5 118V101.5L290.5 103.5C292 110.5 295.1 124.7 295.5 125.5C295.9 126.3 298.333 130.5 299.5 132.5L298 135.5L296.5 138L285.5 118Z',
    'M207 87L205.5 67.5L195 78L194 95L201.5 96.5L207 87Z',
    'M200 103.5V99L195 101.5L194 115.5L189.5 127H192L200 115.5L203 103.5H200Z',
    'M183 125.5L189.5 101.5H194L192 115.5L187 128.5L182 136.5L178 132.5L183 125.5Z'
  ],
  'abs': [
    'M50 75.5V72L52 75.5H50Z',
    'M60 77L55.5 75.5L54.5 78L60 79.5V77Z',
    // ... (All 'abs' paths continue here)
  ],
  'butt': [
    'M254.5 118L251 122.5L258 125.5L263.5 133.5L264.5 131L262 121L254.5 118Z',
    'M227 122.5L223 118L216 121.5L213.5 133.5L215.5 132.5L220.5 125.5L227 122.5Z',
    'M231 129L230 125.5L219 131L213.5 139V151.5L217.5 158L237.5 144.5L236.5 133.5L231 129Z',
    'M240.5 144.5L242 132.5L249 126.5L258 129L264.5 140V152.5L262 156.5L260 158L258 154L251 151.5L240.5 144.5Z'
  ],
  'leg': [
    'M49.5 123.5L52.5 126L51 164.5L60 199L54.5 164.5V143.5L64.5 166L63.5 198L60 199H57.5L47.5 166L49.5 123.5Z',
    'M96 127L99 123.5L100.5 166L91.5 199H88.5H86L82.1556 169.206L82 168L80.5 162L93.5 131.5V142.5L82 168L82.1556 169.206L96 142.5L95 166L88.5 199L97.5 166L96 127Z',
    // ... (All 'leg' paths continue here)
  ],
  // Add other parts like 'abs', 'foot', etc.
};


// Assuming you have a utility class for SVG Path parsing
Path _parseSvgPath(String svgPathString) {
  // final path = Path();
  Path path = parseSvgPath(svgPathString);
  return path;
}


class BodyHeatmap extends StatelessWidget {
  final Map<String, int> selectedParts;
  final Color unselectedColor;
  final Color baseColor;
  final double width;
  final bool showLegend;
  final TextStyle legendTextStyle;
  final MainAxisAlignment legendAlignment;
  final int intensityLevels;
  final ValueChanged<String>? onPartTap; // 💥 NEW CALLBACK

  const BodyHeatmap({
    super.key,
    required this.selectedParts,
    required this.baseColor,
    this.unselectedColor = const Color(0xFFCCCCCC),
    this.width = 300,
    this.showLegend = true,
    this.legendTextStyle = const TextStyle(fontSize: 14, color: Colors.black),
    this.legendAlignment = MainAxisAlignment.center,
    this.intensityLevels = 3,
    this.onPartTap, // 💥 NEW PROPERTY
  });

  // --- Coloring Logic (Reused from your original code) ---
  Color _getFillColor(String part) {
    final value = selectedParts[part];
    if (value == null || value == 0) return unselectedColor;
    return baseColor;
  }

  double _getFillOpacity(String part) {
    final value = selectedParts[part];
    if (value == null || value == 0) return 1.0;

    final allValues = selectedParts.values.where((v) => v > 0);
    if (allValues.isEmpty) return 1.0;

    final min = allValues.reduce((a, b) => a < b ? a : b);
    final max = allValues.reduce((a, b) => a > b ? a : b);
    final normalized = max == min ? 1.0 : (value - min) / (max - min);

    final steps = List.generate(
      intensityLevels,
      (i) => (i + 1) / intensityLevels,
    );

    final index = (normalized * (steps.length - 1)).round().clamp(0, steps.length - 1);
    return steps[index];
  }

  // --- Legend Widget (Reused from your original code) ---
  List<Widget> buildLegend() {
    const totalWidth = 80.0;
    const height = 15.0;

    final boxWidth = totalWidth / intensityLevels;

    return List.generate(intensityLevels, (i) {
      final opacity = (i + 1) / intensityLevels;
      return Container(
        height: height,
        width: boxWidth,
        color: baseColor.withOpacity(opacity),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Define the intrinsic size of the SVG viewbox (319x295)
    const double svgWidth = 319.0;
    const double svgHeight = 295.0;
    final double actualHeight = (svgHeight / svgWidth) * width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // 💥 NEW: GestureDetector for Taps
        GestureDetector(
          onTapUp: (details) {
            if (onPartTap == null) return;
            final Offset tapPoint = details.localPosition;
            
            // Check which part contains the tap point
            String? hitPartId;
            // Iterate in reverse to respect drawing order (frontmost paths first)
            for (var entry in _svgBodyPartsData.entries.toList().reversed) {
              final partId = entry.key;
              final pathStrings = entry.value;

              for (String pathString in pathStrings) {
                final path = _parseSvgPath(pathString); // Parse the SVG path
                
                // Scale the path to the widget's actual size
                final Matrix4 matrix = Matrix4.identity()
                  ..scale(width / svgWidth, actualHeight / svgHeight);

                final Path scaledPath = path.transform(matrix.storage);
                
                if (scaledPath.contains(tapPoint)) {
                  hitPartId = partId;
                  break; // Found the specific path
                }
              }
              if (hitPartId != null) break; // Found the body part
            }

            if (hitPartId != null) {
              onPartTap!(hitPartId!);
            }
          },
          child: CustomPaint(
            size: Size(width, actualHeight),
            painter: _BodyHeatmapPainter(
              svgBodyPartsData: _svgBodyPartsData,
              selectedParts: selectedParts,
              unselectedColor: unselectedColor,
              baseColor: baseColor,
              intensityLevels: intensityLevels,
              getFillColor: _getFillColor,
              getFillOpacity: _getFillOpacity,
            ),
          ),
        ),

        // Legend
        if (showLegend)
          Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 8.0, left: 20.0, right: 20.0),
            child: Row(
              mainAxisAlignment: legendAlignment,
              children: [
                Text('Low', style: legendTextStyle),
                const SizedBox(width: 5),
                Row(children: buildLegend()),
                const SizedBox(width: 5),
                Text('High', style: legendTextStyle),
              ],
            ),
          ),
      ],
    );
  }
}

// 3. The Custom Painter
class _BodyHeatmapPainter extends CustomPainter {
  final Map<String, List<String>> svgBodyPartsData;
  final Map<String, int> selectedParts;
  final Color unselectedColor;
  final Color baseColor;
  final int intensityLevels;
  final Color Function(String part) getFillColor;
  final double Function(String part) getFillOpacity;

  _BodyHeatmapPainter({
    required this.svgBodyPartsData,
    required this.selectedParts,
    required this.unselectedColor,
    required this.baseColor,
    required this.intensityLevels,
    required this.getFillColor,
    required this.getFillOpacity,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const double svgWidth = 319.0;
    const double svgHeight = 295.0;

    // Scaling factor from original SVG viewbox to current widget size
    final double scaleX = size.width / svgWidth;
    final double scaleY = size.height / svgHeight;

    // Apply global scaling transformation to the canvas
    canvas.scale(scaleX, scaleY);

    // Iterate through all body parts
    svgBodyPartsData.forEach((partId, pathStrings) {
      // Get heatmap color/opacity based on the part's ID
      final Color baseFill = getFillColor(partId);
      final double opacity = getFillOpacity(partId);

      final paint = Paint()
        ..color = baseFill.withOpacity(opacity)
        ..style = PaintingStyle.fill;
        // Optionally add a stroke for borders
        // ..strokeWidth = 1.0 
        // ..style = PaintingStyle.stroke;

      // Draw all paths belonging to this body part
      for (String pathString in pathStrings) {
        final Path path = _parseSvgPath(pathString);
        canvas.drawPath(path, paint);
      }
    });
  }

  @override
  bool shouldRepaint(covariant _BodyHeatmapPainter oldDelegate) {
    // Repaint only if the data or coloring logic changes
    return oldDelegate.selectedParts != selectedParts ||
        oldDelegate.baseColor != baseColor ||
        oldDelegate.unselectedColor != unselectedColor;
  }
}