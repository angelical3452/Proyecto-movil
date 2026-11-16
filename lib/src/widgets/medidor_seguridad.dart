import 'package:flutter/material.dart';

class MedidorSeguridad extends StatelessWidget {
  final double value;
  final String label;
  final Color trackColor;
  final Color fillColor;
  final Color textColor;
  final double height;

  const MedidorSeguridad({
    super.key,
    this.value = 0.0,
    this.label = 'Seguridad',
    this.trackColor = const Color(0xFFE6E8E3),
    this.fillColor = const Color(0xFF3F7D58),
    this.textColor = const Color(0xFF2F3E3A),
    this.height = 18,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(height / 2),
            child: Container(
              height: height,
              color: trackColor,
              alignment: Alignment.centerLeft,
              child: TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: value.clamp(0.0, 1.0)),
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOut,
                builder: (context, v, _) => FractionallySizedBox(
                  widthFactor: v,
                  child: Container(
                    decoration: BoxDecoration(
                      color: value >= 0.8
                          ? Colors.green
                          : value >= 0.5
                          ? Colors.yellow
                          : value > 0
                          ? Colors.red
                          : fillColor,
                      borderRadius: BorderRadius.circular(height / 2),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Text(
          value >= 0.8
              ? 'Alta'
              : value >= 0.5
              ? 'Media'
              : value > 0
              ? 'Baja'
              : label,
          style: TextStyle(
            fontSize: 14,
            color: textColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
