import 'package:dma_e_commerce/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class EntrepreneurToolkit extends StatelessWidget {
  const EntrepreneurToolkit({super.key, this.onAction});

  final ValueChanged<String>? onAction;

  static const _actions = [
    _ToolkitAction(
      title: 'Post an opportunity',
      subtitle: 'Find the right buyer',
      icon: Icons.campaign_outlined,
      color: AppColors.orange,
      background: AppColors.lightOrange,
    ),
    _ToolkitAction(
      title: 'Manage storefront',
      subtitle: 'Keep products moving',
      icon: Icons.storefront_outlined,
      color: AppColors.green,
      background: AppColors.lightGreen,
    ),
    _ToolkitAction(
      title: 'Find partners',
      subtitle: 'Grow with local makers',
      icon: Icons.people_alt_outlined,
      color: AppColors.blue,
      background: AppColors.lightBlue,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 11),
      decoration: BoxDecoration(
        color: AppColors.text,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Entrepreneur Toolkit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Everything you need to move business forward',
                      style: TextStyle(color: Colors.white60, fontSize: 8),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Icon(
                  Icons.arrow_outward_rounded,
                  color: Colors.white,
                  size: 15,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              for (var index = 0; index < _actions.length; index++) ...[
                Expanded(
                  child: _ToolkitCard(action: _actions[index], onTap: onAction),
                ),
                if (index != _actions.length - 1) const SizedBox(width: 7),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

class _ToolkitCard extends StatelessWidget {
  const _ToolkitCard({required this.action, this.onTap});

  final _ToolkitAction action;
  final ValueChanged<String>? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: () => onTap?.call(action.title),
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(7, 8, 7, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 29,
                height: 29,
                decoration: BoxDecoration(
                  color: action.background,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Icon(action.icon, color: action.color, size: 17),
              ),
              const SizedBox(height: 7),
              Text(
                action.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: AppColors.text,
                  fontSize: 9,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                action.subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: AppColors.muted, fontSize: 7),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ToolkitAction {
  const _ToolkitAction({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.background,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final Color background;
}
