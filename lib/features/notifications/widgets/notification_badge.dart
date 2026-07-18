import 'package:flutter/material.dart';

class NotificationBadge extends StatefulWidget {
  final int count;
  final VoidCallback onPressed;

  const NotificationBadge({
    super.key,
    required this.count,
    required this.onPressed,
  });

  @override
  State<NotificationBadge> createState() =>
      _NotificationBadgeState();
}

class _NotificationBadgeState
    extends State<NotificationBadge>
    with SingleTickerProviderStateMixin {

  late final AnimationController _controller;

  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 400,
      ),
    );

    _animation = Tween(
      begin: 0.85,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut,
      ),
    );

    _controller.forward();
  }

  @override
  void didUpdateWidget(
    NotificationBadge oldWidget,
  ) {
    super.didUpdateWidget(oldWidget);

    if (widget.count != oldWidget.count) {
      _controller
        ..reset()
        ..forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: Stack(
        clipBehavior: Clip.none,
        children: [

          Container(
            decoration: BoxDecoration(
              color: Colors.pink.withOpacity(.08),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.notifications_rounded,
              ),
              onPressed: widget.onPressed,
            ),
          ),

          if (widget.count > 0)

            Positioned(
              right: 5,
              top: 6,
              child: Container(
                padding:
                    const EdgeInsets.all(5),
                decoration:
                    const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),

                constraints:
                    const BoxConstraints(
                  minWidth: 18,
                  minHeight: 18,
                ),

                child: Text(
                  widget.count > 9
                      ? "9+"
                      : widget.count.toString(),

                  textAlign: TextAlign.center,

                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight:
                        FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}