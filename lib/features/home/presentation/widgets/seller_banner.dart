import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class SellerBanner extends StatelessWidget {
  const SellerBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 47,

      padding: const EdgeInsets.symmetric(horizontal: 9),

      decoration: BoxDecoration(
        color: AppColors.lightGreen,

        borderRadius: BorderRadius.circular(9),
      ),

      child: Row(
        children: [
          const Icon(
            Icons.workspace_premium_rounded,

            color: AppColors.green,

            size: 28,
          ),

          const SizedBox(width: 7),

          const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  'Become a Verified Seller',

                  style: TextStyle(fontSize: 9, fontWeight: FontWeight.w800),
                ),

                SizedBox(height: 2),

                Text(
                  'Grow your business and reach more buyers.',

                  style: TextStyle(fontSize: 7, color: AppColors.muted),
                ),
              ],
            ),
          ),

          FilledButton(
            onPressed: () {},

            style: ButtonStyle(
              backgroundColor: const WidgetStatePropertyAll(AppColors.green),

              minimumSize: const WidgetStatePropertyAll(Size(74, 28)),

              padding: const WidgetStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 9),
              ),
            ),

            child: const Text('Start Selling', style: TextStyle(fontSize: 8)),
          ),
        ],
      ),
    );
  }
}
