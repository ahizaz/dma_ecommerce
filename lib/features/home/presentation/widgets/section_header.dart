import 'package:dma_e_commerce/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onViewAll;
  const SectionHeader({super.key, required this.title, this.onViewAll});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w800,
        ),),
        Spacer(),
        GestureDetector(
          onTap: onViewAll,
          child: const Row(
            children: [
              Text('View All',style: TextStyle(
                    color:
                      AppColors.green,
                  fontSize: 9,
                  fontWeight:
                      FontWeight.w600,
              ),),
               Icon(

                Icons.chevron_right_rounded,

                color:
                    AppColors.green,

                size: 15,
              ),
            ],
          ),
        )
      ],
    );
  }
}
