import 'dart:ui';
import 'package:flutter/material.dart';
import '../constants/colors.dart';

/// A row of glassmorphic trust/benefit cards: Fast Delivery,
/// Authentic Product, Secure Payment, Return Guarantee.
class BenefitsSection extends StatelessWidget {
  const BenefitsSection({super.key});

  static const List<_BenefitItem> _benefits = [
    _BenefitItem(
      icon: Icons.local_shipping_outlined,
      title: 'شحن سريع',
      subtitle: 'توصيل مجاني',
    ),
    _BenefitItem(
      icon: Icons.verified_user_outlined,
      title: 'منتج أصلي',
      subtitle: 'ضمان 100%',
    ),
    _BenefitItem(
      icon: Icons.security_rounded,
      title: 'دفع آمن',
      subtitle: 'تشفير SSL',
    ),
    _BenefitItem(
      icon: Icons.replay_rounded,
      title: 'استرجاع سهل',
      subtitle: '30 يوم',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          'مميزات التسوق لدينا',
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 14),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            reverse: true,
            physics: const BouncingScrollPhysics(),
            itemCount: _benefits.length,
            itemBuilder: (context, index) {
              final b = _benefits[index];
              return _GlassBenefitCard(item: b);
            },
          ),
        ),
      ],
    );
  }
}

class _BenefitItem {
  final IconData icon;
  final String title;
  final String subtitle;
  const _BenefitItem({
    required this.icon,
    required this.title,
    required this.subtitle,
  });
}

class _GlassBenefitCard extends StatelessWidget {
  final _BenefitItem item;
  const _GlassBenefitCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      margin: const EdgeInsets.only(left: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primary.withValues(alpha: 0.06),
                  AppColors.accent.withValues(alpha: 0.04),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: AppColors.primary.withValues(alpha: 0.12),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.04),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: AppColors.accent.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Icon(item.icon, color: AppColors.accent, size: 20),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  item.title,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  item.subtitle,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
