import 'package:dma_e_commerce/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class TradeActions extends StatelessWidget {
  const TradeActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: 
        _TradeAction(title: 'Import', icon: Icons.public_rounded, background: AppColors.lightGreen, iconColor: AppColors.green)
        ),
        SizedBox(width: 7,),
          Expanded(
          child: _TradeAction(
            title: 'Export',
            icon:
                Icons.local_shipping_rounded,
            background:
                AppColors.lightOrange,
            iconColor:
                AppColors.orange,
          ),
        ),
         SizedBox(width: 7),
          Expanded(
          child: _TradeAction(
            title: 'Wholesale',
            icon:
                Icons.business_rounded,
            background:
                AppColors.lightBlue,
            iconColor:
                AppColors.blue,
          ),
        )
      ],
    );
  }
}
class _TradeAction extends StatelessWidget {
   final String title;

  final IconData icon;

  final Color background;

  final Color iconColor;
  const _TradeAction({super.key, required this.title, required this.icon, required this.background, required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      decoration: BoxDecoration(
          color: background,

        borderRadius:
            BorderRadius.circular(8),
      ),
      child: Row(

        mainAxisAlignment:
            MainAxisAlignment.center,
            children: [
                Icon(
            icon,
            size: 17,
            color: iconColor,
          ),
          SizedBox(width: 5,),
          Text(
            title,
            style:
                const TextStyle(
              fontSize: 10,
              fontWeight:
                  FontWeight.w600,
            ),
          ),

            ],
      ),
    );
  }
}