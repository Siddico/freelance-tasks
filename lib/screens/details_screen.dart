import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/colors.dart';
import '../data/dummy_products.dart';
import '../models/product_model.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/product_image_carousel.dart';
import '../widgets/product_info_section.dart';
import '../widgets/size_selector.dart';
import '../widgets/quantity_selector.dart';
import '../widgets/product_description.dart';
import '../widgets/benefits_section.dart';
import '../widgets/reviews_section.dart';
import '../widgets/related_products_section.dart';
import '../widgets/bottom_purchase_bar.dart';

/// The premium Product Details Screen for Sport Zone.
/// Wrapped entirely in RTL directionality (Arabic First).
/// Uses ValueNotifier-style state management via StatefulWidget.
class DetailsScreen extends StatefulWidget {
  final ProductModel product;

  const DetailsScreen({super.key, required this.product});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  // ── State Variables ──
  late bool _isFavorite;
  late String _selectedOption;
  int _quantity = 1;
  int _cartCount = 0;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.product.isFavorite;
    _selectedOption = widget.product.options.isNotEmpty
        ? widget.product.options[0]
        : '';
  }

  // ── Event Handlers ──

  void _onFavoriteToggle() {
    setState(() {
      _isFavorite = !_isFavorite;
    });

    HapticFeedback.mediumImpact();
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _isFavorite
              ? 'تمت الإضافة إلى قائمة الأمنيات ❤️'
              : 'تمت الإزالة من قائمة الأمنيات',
          textDirection: TextDirection.rtl,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
        backgroundColor:
            _isFavorite ? AppColors.primary : AppColors.textSecondary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  void _onAddToCart() {
    setState(() {
      _cartCount += _quantity;
    });

    HapticFeedback.heavyImpact();
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          textDirection: TextDirection.rtl,
          children: [
            const Icon(
              Icons.check_circle_rounded,
              color: AppColors.success,
              size: 22,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                'تمت إضافة $_quantity × ${widget.product.name} إلى السلة',
                textDirection: TextDirection.rtl,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.primary,
        duration: const Duration(seconds: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  void _onRelatedProductTapped(ProductModel product) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => DetailsScreen(product: product),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Stack(
          children: [
            // ── Main Scrollable Content ──
            Positioned.fill(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom + 100,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 1) Product Image Carousel
                    ProductImageCarousel(
                      images: widget.product.allImages,
                      heroTag: 'hero-${widget.product.id}',
                      discount: 'خصم 25%',
                      isBestSeller: widget.product.rating >= 4.7,
                    ),
                    const SizedBox(height: 8),

                    // All details sections in a padded container
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // 2) Product Information
                          ProductInfoSection(product: widget.product),
                          const SizedBox(height: 24),

                          // Divider
                          const Divider(
                            color: AppColors.borderLight,
                            height: 1,
                          ),
                          const SizedBox(height: 20),

                          // 3) Product Options (Sizes / Flavors)
                          if (widget.product.options.isNotEmpty) ...[
                            SizeSelector(
                              title: _getOptionsTitle(),
                              options: widget.product.options,
                              selectedOption: _selectedOption,
                              onSelected: (option) {
                                setState(() {
                                  _selectedOption = option;
                                });
                              },
                            ),
                            const SizedBox(height: 24),
                          ],

                          // 4) Quantity Selector
                          QuantitySelector(
                            quantity: _quantity,
                            onChanged: (newQuantity) {
                              setState(() {
                                _quantity = newQuantity;
                              });
                            },
                          ),
                          const SizedBox(height: 24),

                          const Divider(
                            color: AppColors.borderLight,
                            height: 1,
                          ),
                          const SizedBox(height: 20),

                          // 5) Product Description + Specs
                          ProductDescription(
                            description: widget.product.description,
                            specifications: widget.product.specifications,
                          ),
                          const SizedBox(height: 28),

                          // 6) Benefits Section
                          const BenefitsSection(),
                          const SizedBox(height: 28),

                          const Divider(
                            color: AppColors.borderLight,
                            height: 1,
                          ),
                          const SizedBox(height: 20),

                          // 7) Customer Reviews
                          ReviewsSection(
                            reviews: widget.product.reviews,
                            rating: widget.product.rating,
                            reviewCount: widget.product.reviewCount,
                          ),
                          const SizedBox(height: 28),

                          // 8) Related Products
                          RelatedProductsSection(
                            products: dummyProducts,
                            currentProductId: widget.product.id,
                            onProductTapped: _onRelatedProductTapped,
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ── Floating App Bar ──
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: CustomAppBar(
                isFavorite: _isFavorite,
                cartCount: _cartCount,
                onBack: () => Navigator.of(context).pop(),
                onFavoriteToggle: _onFavoriteToggle,
                onCartPressed: () {
                  // Placeholder for cart navigation
                },
              ),
            ),

            // ── Sticky Bottom Purchase Bar ──
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: BottomPurchaseBar(
                unitPrice: widget.product.price,
                quantity: _quantity,
                onAddToCart: _onAddToCart,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Determines the label for the options section based on category.
  String _getOptionsTitle() {
    switch (widget.product.category) {
      case 'Footwear':
        return 'اختر المقاس';
      case 'Supplements':
        return 'اختر النكهة';
      case 'Fashion':
        return 'اختر المقاس';
      case 'Electronics':
        return 'اختر اللون';
      default:
        return 'اختر الخيار';
    }
  }
}
