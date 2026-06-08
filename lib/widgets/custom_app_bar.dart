import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/colors.dart';

class CustomAppBar extends StatefulWidget {
  final bool isFavorite;
  final int cartCount;
  final VoidCallback onBack;
  final VoidCallback onFavoriteToggle;
  final VoidCallback onCartPressed;

  const CustomAppBar({
    super.key,
    required this.isFavorite,
    required this.cartCount,
    required this.onBack,
    required this.onFavoriteToggle,
    required this.onCartPressed,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> with SingleTickerProviderStateMixin {
  late final AnimationController _favoriteController;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _favoriteController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween<double>(begin: 1.0, end: 1.3), weight: 50),
      TweenSequenceItem(tween: Tween<double>(begin: 1.3, end: 1.0), weight: 50),
    ]).animate(CurvedAnimation(parent: _favoriteController, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _favoriteController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant CustomAppBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isFavorite != widget.isFavorite) {
      _favoriteController.forward(from: 0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Back Button (Wrapped in a beautiful soft shadow circle)
            _buildAppBarButton(
              icon: Icons.arrow_back_ios_new_rounded,
              onPressed: widget.onBack,
              padding: const EdgeInsets.only(right: 2), // visually centers iOS back chevron
            ),
            
            // Actions: Favorite + Cart
            Row(
              children: [
                // Favorite Icon with scale animation
                AnimatedBuilder(
                  animation: _scaleAnimation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _scaleAnimation.value,
                      child: child,
                    );
                  },
                  child: _buildAppBarButton(
                    icon: widget.isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                    iconColor: widget.isFavorite ? AppColors.favorite : AppColors.textPrimary,
                    onPressed: () {
                      HapticFeedback.mediumImpact();
                      widget.onFavoriteToggle();
                    },
                  ),
                ),
                const SizedBox(width: 12),
                
                // Shopping Cart Button with Animated Badge
                Stack(
                  alignment: Alignment.center,
                  children: [
                    _buildAppBarButton(
                      icon: Icons.shopping_cart_outlined,
                      onPressed: widget.onCartPressed,
                    ),
                    if (widget.cartCount > 0)
                      Positioned(
                        top: 2,
                        right: 2,
                        child: TweenAnimationBuilder<double>(
                          tween: Tween<double>(begin: 0.0, end: 1.0),
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.elasticOut,
                          builder: (context, scale, child) {
                            return Transform.scale(
                              scale: scale,
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: AppColors.accent,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white, width: 1.5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.accent.withValues(alpha: 0.3),
                                      blurRadius: 6,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                constraints: const BoxConstraints(
                                  minWidth: 18,
                                  minHeight: 18,
                                ),
                                child: Center(
                                  child: Text(
                                    '${widget.cartCount}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 9,
                                      fontWeight: FontWeight.bold,
                                      height: 1.0,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBarButton({
    required IconData icon,
    required VoidCallback onPressed,
    Color iconColor = AppColors.textPrimary,
    EdgeInsetsGeometry padding = EdgeInsets.zero,
  }) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.9), // Glassy white base
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white.withValues(alpha: 0.5), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipOval(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onPressed,
            child: Padding(
              padding: padding,
              child: Center(
                child: Icon(
                  icon,
                  size: 20,
                  color: iconColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
