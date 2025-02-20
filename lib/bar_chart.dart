import 'package:flutter/material.dart';

class BarChart extends StatefulWidget{
  const BarChart({super.key});

  @override
  State<StatefulWidget> createState() => _BarChartState();

}

class _BarChartState extends State<BarChart>{

  final List<int> data = [250, 300, 100, 450, 650, 1000, 400];
  final List<String> labels = ["2019", "2020", "2021", "2022", "2023", "2024", "2025"];
  final List<Color> colors = [
    Colors.grey,
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.blue,
    Colors.pinkAccent,
    Colors.purple
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bar Chart'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomPaint(
            size: Size(350, 350),
            painter: BarChartPainter(data, labels, colors),
          ),
        ],
      ),
    );
  }
}

class BarChartPainter extends CustomPainter {

  final List<int> data;
  final List<String> labels;
  final List<Color> colors;
  BarChartPainter(this.data, this.labels, this.colors);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint axisPaint = Paint()
        ..color = Colors.black
        ..strokeWidth = 2.0;

    final Paint barPaint = Paint();

    final double barWidth = size.width / (data.length * 2);
    final double maxDataValue = data.reduce((a, b) => a > b ? a : b).toDouble();
    final double scaleFactor = (size.height - 40) / maxDataValue;

    // Draw Y-axis
    canvas.drawLine(Offset(40, 0), Offset(40, size.height - 20), axisPaint);

    // Draw X-axis
    canvas.drawLine(Offset(40, size.height - 20), Offset(size.width, size.height - 20), axisPaint);

    final textPainter = TextPainter(textDirection: TextDirection.ltr);

    for (int i = 0; i < data.length; i++) {
      final double left = 50 + (i * 2 * barWidth);
      final double top = size.height -20 - (data[i] * scaleFactor);
      final double right = left + barWidth;
      final double bottom = size.height - 20;

      barPaint.color = colors[i];
      canvas.drawRect(Rect.fromLTRB(left, top, right, bottom), barPaint);


      // Data Values on Top
      textPainter.text = TextSpan(
        text: "${data[i]}",
        style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(left + barWidth / 6, top - 20));


      // labels
      textPainter.text = TextSpan(
        text: labels[i],
        style: TextStyle(color: Colors.black, fontSize: 12),
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(left, size.height - 15));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  }

