import 'package:dma_e_commerce/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class TopHeader extends StatelessWidget {
  const TopHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.location_on_rounded, size: 17, color: AppColors.muted),
        SizedBox(width: 4),
        const Text(
          'Dhaka, Bangladesh',
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
        ),
        const Icon(Icons.keyboard_arrow_down_rounded, size: 16),
        const Spacer(),
        _NotificationIcon(icon: Icons.notifications_none_rounded, badge: '3'),
        const SizedBox(width: 12),
        _NotificationIcon(icon: Icons.shopping_cart_outlined, badge: '2'),
        const SizedBox(width: 8),
      ],
    );
  }
}

class _NotificationIcon extends StatelessWidget {
  final IconData icon;

  final String badge;
  const _NotificationIcon({super.key, required this.icon, required this.badge});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Icon(icon, size: 22),

        Positioned(
          right: -7,
          top: -8,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 1),
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: Text(
              badge,
              style: TextStyle(
                color: Colors.white,
                fontSize: 8,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
