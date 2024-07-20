import 'package:flutter/material.dart';

class MediaProgressBar extends StatefulWidget {
  final int count;
  final int currentIndex;
  final Duration duration;

  const MediaProgressBar({super.key,
    required this.count,
    required this.currentIndex,
    required this.duration,
  });

  @override
  _MediaProgressBarState createState() => _MediaProgressBarState();
}

class _MediaProgressBarState extends State<MediaProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Notify parent or handle completion
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant MediaProgressBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentIndex != widget.currentIndex) {
      _controller.reset();
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(widget.count, (index) {
        return ProgressBar(
          progress: index == widget.currentIndex
              ? _controller.value
              : (index < widget.currentIndex ? 1.0 : 0.0),
          color: Colors.white,
        );
      }),
    );
  }
}

class ProgressBar extends StatelessWidget {
  final double progress;
  final Color color;

  const ProgressBar({super.key, required this.progress, this.color = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        height: 5.0,
        decoration: BoxDecoration(
          color: color.withOpacity(0.5),
          borderRadius: BorderRadius.circular(3.0),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            height: 5.0,
            width: MediaQuery.of(context).size.width * progress,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(3.0),
            ),
          ),
        ),
      ),
    );
  }
}
