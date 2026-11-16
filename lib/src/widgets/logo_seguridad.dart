import 'package:flutter/material.dart';

class LogoSeguridad extends StatefulWidget {
  final double? size;

  const LogoSeguridad({
    super.key,
    this.size,
  });

  @override
  State<LogoSeguridad> createState() => _LogoSeguridadEstado();
}

class _LogoSeguridadEstado extends State<LogoSeguridad>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);

    _opacityAnimation = Tween<double>(begin: 0.25, end: 0.9).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double badgeSize = widget.size! * 0.35;

    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          FadeTransition(
            opacity: _opacityAnimation,
            child: Container(
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(
                color:  Color(0xFFC8F8D4).withValues(alpha: 0.6),
                borderRadius: BorderRadius.circular(24.0),
              ),
            ),
          ),

          Container(
            width: widget.size! * 0.85,
            height: widget.size! * 0.85,
            decoration: BoxDecoration(
              color: const Color(0xFFE8ECE9),
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
          ),

          Container(
            width: widget.size! * 0.70,
            height: widget.size! * 0.70,
            decoration: BoxDecoration(
              color:  Color(0xFF006837),
              borderRadius: BorderRadius.circular(18.0),
            ),
            child: Icon(
              Icons.lock_reset_rounded,
              color: Colors.white,
              size: widget.size! * 0.38,
            ),
          ),

          Positioned(
            right: widget.size! * 0.02,
            bottom: widget.size! * 0.02,
            child: Container(
              width: badgeSize,
              height: badgeSize,
              decoration: BoxDecoration(
                color: const Color(0xFFB70014),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.15),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(
                Icons.school_rounded,
                color: Colors.white,
                size: badgeSize * 0.6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}