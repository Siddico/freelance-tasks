import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/colors.dart';

/// Modern rounded quantity selector with animated +/- buttons,
/// animated count switcher, and haptic feedback.
class QuantitySelector extends StatelessWidget {
  final int quantity;
  final ValueChanged<int> onChanged;

  const QuantitySelector({
    super.key,
    required this.quantity,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // The selector control
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.border, width: 1.5),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.04),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Decrease button
              _QuantityButton(
                icon: Icons.remove_rounded,
                onPressed: quantity > 1
                    ? () {
                        HapticFeedback.lightImpact();
                        onChanged(quantity - 1);
                      }
                    : null,
                isEnabled: quantity > 1,
              ),
              const SizedBox(width: 4),

              // Animated quantity display
              Container(
                width: 48,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.borderLight),
                ),
                child: Center(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    transitionBuilder: (child, animation) {
                      return ScaleTransition(
                        scale: animation,
                        child: FadeTransition(opacity: animation, child: child),
                      );
                    },
                    child: Text(
                      '$quantity',
                      key: ValueKey<int>(quantity),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 4),

              // Increase button
              _QuantityButton(
                icon: Icons.add_rounded,
                onPressed: () {
                  HapticFeedback.lightImpact();
                  onChanged(quantity + 1);
                },
                isEnabled: true,
                isAccent: true,
              ),
            ],
          ),
        ),

        const SizedBox(width: 14),

        // Label
        const Text(
          ':الكمية',
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w800,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}

/// Individual +/- circular button with scale animation.
class _QuantityButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final bool isEnabled;
  final bool isAccent;

  const _QuantityButton({
    required this.icon,
    required this.onPressed,
    required this.isEnabled,
    this.isAccent = false,
  });

  @override
  State<_QuantityButton> createState() => _QuantityButtonState();
}

class _QuantityButtonState extends State<_QuantityButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _scaleController;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 120),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.85).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  void _handleTap() {
    if (!widget.isEnabled || widget.onPressed == null) return;
    _scaleController.forward().then((_) {
      _scaleController.reverse();
    });
    widget.onPressed!();
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = widget.isAccent
        ? AppColors.accent
        : (widget.isEnabled ? AppColors.primary : AppColors.border);
    final iconColor = widget.isEnabled ? Colors.white : AppColors.textLight;

    return GestureDetector(
      onTap: _handleTap,
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: child,
          );
        },
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: widget.isEnabled
                ? [
                    BoxShadow(
                      color: bgColor.withValues(alpha: 0.25),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ]
                : null,
          ),
          child: Center(
            child: Icon(widget.icon, color: iconColor, size: 20),
          ),
        ),
      ),
    );
  }
}
