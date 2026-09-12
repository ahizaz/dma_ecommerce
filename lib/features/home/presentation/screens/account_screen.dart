import 'package:dma_e_commerce/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(14, 12, 14, 4),
          child: Row(
            children: [
              const Text(
                'My Account',
                style: TextStyle(
                  color: AppColors.text,
                  fontSize: 23,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.settings_outlined),
                color: AppColors.text,
                tooltip: 'Account settings',
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(14, 4, 14, 18),
            children: const [
              _ProfileHeader(),
              SizedBox(height: 12),
              _BusinessStats(),
              SizedBox(height: 12),
              _RatingSection(),
              SizedBox(height: 16),
              _AccountSectionTitle(title: 'Account'),
              SizedBox(height: 7),
              _AccountAction(
                icon: Icons.receipt_long_outlined,
                title: 'My orders',
                subtitle: 'Track your recent purchases',
              ),
              _AccountAction(
                icon: Icons.location_on_outlined,
                title: 'Saved addresses',
                subtitle: 'Manage delivery locations',
              ),
              _AccountAction(
                icon: Icons.help_outline_rounded,
                title: 'Help & support',
                subtitle: 'Get help with your account',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.darkGreen,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Container(
            width: 58,
            height: 58,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.person_rounded,
              size: 34,
              color: AppColors.green,
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome back, Rahim',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'rahim@example.com',
                  style: TextStyle(color: Color(0xFFB8EBD3), fontSize: 11),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit_outlined),
            color: Colors.white,
            tooltip: 'Edit profile',
          ),
        ],
      ),
    );
  }
}

class _BusinessStats extends StatelessWidget {
  const _BusinessStats();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: const Row(
        children: [
          _StatItem(value: '12', label: 'Orders'),
          _StatDivider(),
          _StatItem(value: '04', label: 'Wishlist'),
          _StatDivider(),
          _StatItem(value: '08', label: 'Following'),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;

  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              color: AppColors.text,
              fontSize: 18,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            label,
            style: const TextStyle(color: AppColors.muted, fontSize: 10),
          ),
        ],
      ),
    );
  }
}

class _StatDivider extends StatelessWidget {
  const _StatDivider();

  @override
  Widget build(BuildContext context) {
    return Container(width: 1, height: 30, color: AppColors.border);
  }
}

class _RatingSection extends StatelessWidget {
  const _RatingSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.lightOrange,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFFFD8CB)),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.star_rounded,
              color: AppColors.orange,
              size: 27,
            ),
          ),
          const SizedBox(width: 11),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your rating',
                  style: TextStyle(
                    color: AppColors.text,
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Help us improve your experience',
                  style: TextStyle(color: AppColors.muted, fontSize: 10),
                ),
              ],
            ),
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '4.8',
                style: TextStyle(
                  color: AppColors.text,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 2),
              Row(
                children: [
                  Icon(Icons.star_rounded, size: 13, color: AppColors.orange),
                  Icon(Icons.star_rounded, size: 13, color: AppColors.orange),
                  Icon(Icons.star_rounded, size: 13, color: AppColors.orange),
                  Icon(Icons.star_rounded, size: 13, color: AppColors.orange),
                  Icon(
                    Icons.star_half_rounded,
                    size: 13,
                    color: AppColors.orange,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AccountSectionTitle extends StatelessWidget {
  final String title;

  const _AccountSectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: AppColors.text,
        fontSize: 15,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}

class _AccountAction extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _AccountAction({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 2),
      leading: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: AppColors.lightGreen,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: AppColors.green, size: 20),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.text,
          fontSize: 13,
          fontWeight: FontWeight.w700,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(color: AppColors.muted, fontSize: 10),
      ),
      trailing: const Icon(Icons.chevron_right_rounded, color: AppColors.muted),
      onTap: () {},
    );
  }
}
