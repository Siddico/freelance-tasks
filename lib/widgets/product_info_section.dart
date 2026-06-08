import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../models/product_model.dart';

class ProductInfoSection extends StatelessWidget {
  final ProductModel product;

  const ProductInfoSection({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final oldPrice = product.price * 1.25;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Category Tag + Availability
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildCategoryTag(product.category),
            _buildStockBadge(product.isAvailable),
          ],
        ),
        const SizedBox(height: 14),

        // Product Name
        Text(
          product.name,
          textDirection: TextDirection.rtl,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w900,
            color: AppColors.textPrimary,
            height: 1.35,
            letterSpacing: -0.3,
          ),
        ),
        const SizedBox(height: 10),

        // Brand row
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Sport Zone',
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
            SizedBox(width: 6),
            Icon(Icons.verified_rounded, color: AppColors.primary, size: 16),
            SizedBox(width: 4),
            Text(
              ':الماركة',
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: 13,
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),

        // Star Rating Row
        _buildRatingRow(),
        const SizedBox(height: 18),

        // Price Display
        _buildPriceRow(oldPrice),
      ],
    );
  }

  Widget _buildCategoryTag(String category) {
    final Map<String, String> arabicCats = {
      'Footwear': 'أحذية رياضية',
      'Supplements': 'مكملات غذائية',
      'Electronics': 'إلكترونيات',
      'Accessories': 'إكسسوارات',
      'Fashion': 'ملابس رياضية',
      'Equipment': 'معدات رياضية',
    };
    final arabicName = arabicCats[category] ?? category;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
      ),
      child: Text(
        arabicName,
        textDirection: TextDirection.rtl,
        style: const TextStyle(
          color: AppColors.primary,
          fontSize: 11,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.2,
        ),
      ),
    );
  }

  Widget _buildStockBadge(bool isAvailable) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isAvailable ? AppColors.successLight : const Color(0xFFFEF2F2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            isAvailable ? 'متوفر في المخزون' : 'نفد من المخزون',
            textDirection: TextDirection.rtl,
            style: TextStyle(
              color: isAvailable ? AppColors.success : AppColors.favorite,
              fontSize: 11,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(width: 6),
          Container(
            width: 7,
            height: 7,
            decoration: BoxDecoration(
              color: isAvailable ? AppColors.success : AppColors.favorite,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          '(${product.reviewCount} تقييم)',
          textDirection: TextDirection.rtl,
          style: const TextStyle(
            fontSize: 13,
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 10),
        Container(
          width: 5,
          height: 5,
          decoration: const BoxDecoration(
            color: AppColors.textLight,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          product.rating.toStringAsFixed(1),
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(width: 6),
        Row(
          children: List.generate(5, (index) {
            final filled = index < product.rating.round();
            return Icon(
              filled ? Icons.star_rounded : Icons.star_outline_rounded,
              color: AppColors.rating,
              size: 18,
            );
          }),
        ),
      ],
    );
  }

  Widget _buildPriceRow(double oldPrice) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.success.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            '\u0648\u0641\u0651\u0631 \$${(oldPrice - product.price).toStringAsFixed(0)}',
            style: const TextStyle(
              color: AppColors.success,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          '\$${oldPrice.toStringAsFixed(2)}',
          style: const TextStyle(
            color: AppColors.textLight,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.lineThrough,
            decorationColor: AppColors.textLight,
          ),
        ),
        const SizedBox(width: 12),
        Text(
          '\$${product.price.toStringAsFixed(2)}',
          style: const TextStyle(
            color: AppColors.primary,
            fontSize: 32,
            fontWeight: FontWeight.w900,
            height: 1.0,
            letterSpacing: -0.5,
          ),
        ),
      ],
    );
  }
}
