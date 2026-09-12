import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class HomeBottomNav extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onChanged;
  final int cartCount;

  const HomeBottomNav({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
    this.cartCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    const items = [
      (Icons.home_rounded, 'Home'),
      (Icons.search_rounded, 'Explore'),
      (Icons.shopping_cart_outlined, 'Cart'),
      (Icons.chat_bubble_outline_rounded, 'Chat'),
      (Icons.person_outline_rounded, 'Account'),
    ];

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFE8EAEB))),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 68,
          child: Row(
            children: List.generate(items.length, (index) {
              final item = items[index];
              final active = selectedIndex == index;
              final isCart = index == 2;

              return Expanded(
                child: InkWell(
                  onTap: () => onChanged(index),
                  splashColor: AppColors.lightGreen,
                  highlightColor: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (isCart)
                        _CartNavButton(active: active, cartCount: cartCount)
                      else
                        Icon(
                          item.$1,
                          size: 20,
                          color: active ? AppColors.green : AppColors.muted,
                        ),
                      SizedBox(height: isCart ? 2 : 3),
                      Text(
                        item.$2,
                        style: TextStyle(
                          fontSize: 8,
                          color: active ? AppColors.green : AppColors.muted,
                          fontWeight: active
                              ? FontWeight.w700
                              : FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _CartNavButton extends StatelessWidget {
  final bool active;
  final int cartCount;

  const _CartNavButton({required this.active, required this.cartCount});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -8),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: active ? AppColors.green : AppColors.lightGreen,
              shape: BoxShape.circle,
              border: Border.all(
                color: active ? Colors.white : AppColors.green,
                width: 3,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.green.withValues(alpha: 0.22),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Icon(
              Icons.shopping_cart_rounded,
              size: 22,
              color: active ? Colors.white : AppColors.green,
            ),
          ),
          Positioned(
            top: -2,
            right: -3,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              decoration: BoxDecoration(
                color: AppColors.red,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: Text(
                '$cartCount',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 9,
                  fontWeight: FontWeight.w800,
                  height: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
