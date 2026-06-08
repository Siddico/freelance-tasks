import 'package:flutter/material.dart';

class AppColors {
  // Brand Main Colors
  static const Color primary = Color(0xFF1A365D);       // Deep Premium Navy Blue
  static const Color accent = Color(0xFFFF6B35);        // Active Sports Orange
  static const Color accentLight = Color(0xFFFFECE4);   // Smooth Accent Orange tint for highlights

  // Background and Layout Colors
  static const Color background = Color(0xFFF8FAFC);    // Sleek Slate Light
  static const Color cardBg = Color(0xFFFFFFFF);        // White card sheets
  
  // Typography Colors
  static const Color textPrimary = Color(0xFF0F172A);   // Premium Slate Dark
  static const Color textSecondary = Color(0xFF64748B); // Slate Gray for subtext
  static const Color textLight = Color(0xFF94A3B8);     // Muted borders/hints
  
  // Accent & Functional States
  static const Color success = Color(0xFF10B981);       // Rich green for In-Stock/Savings
  static const Color successLight = Color(0xFFE6F4EA);  // Light Green background tint
  static const Color rating = Color(0xFFFFB016);        // Warning/Star Gold Yellow
  static const Color favorite = Color(0xFFEF4444);      // Active Love Red
  
  // Layout support
  static const Color border = Color(0xFFE2E8F0);        // Neutral Slate Divider
  static const Color borderLight = Color(0xFFF1F5F9);   // Very light border accent
  
  // Glassmorphic properties
  static final Color glassBackground = Colors.white.withValues(alpha: 0.15);
  static final Color glassBorder = Colors.white.withValues(alpha: 0.25);
  static final Color glassShadow = const Color(0xFF1A365D).withValues(alpha: 0.08);
}
