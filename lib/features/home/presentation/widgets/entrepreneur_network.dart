import 'package:dma_e_commerce/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class EntrepreneurNetwork extends StatelessWidget {
  const EntrepreneurNetwork({super.key, this.onConnect});

  final ValueChanged<String>? onConnect;

  static const entrepreneurs = [
    _Entrepreneur(
      name: 'Nokshi Craft House',
      category: 'Handmade goods',
      location: 'Dhaka, Bangladesh',
      initials: 'NC',
      color: AppColors.green,
      isVerified: true,
    ),
    _Entrepreneur(
      name: 'Riverland Foods',
      category: 'Organic foods',
      location: 'Rajshahi, Bangladesh',
      initials: 'RF',
      color: AppColors.orange,
      isVerified: true,
    ),
    _Entrepreneur(
      name: 'Jute & Loom',
      category: 'Sustainable textiles',
      location: 'Khulna, Bangladesh',
      initials: 'JL',
      color: AppColors.blue,
      isVerified: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(13, 13, 13, 12),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.darkGreen, AppColors.green],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.16),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.28),
                    ),
                  ),
                  child: const Icon(
                    Icons.hub_rounded,
                    color: Colors.white,
                    size: 21,
                  ),
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Entrepreneur Network',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        'Meet. Match. Grow together.',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 9,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.circle, color: Color(0xFFB7F5D3), size: 7),
                      SizedBox(width: 5),
                      Text(
                        'LIVE',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 0.6,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(13, 11, 13, 10),
            child: Row(
              children: [
                const Text(
                  '128+ active entrepreneurs',
                  style: TextStyle(
                    color: AppColors.text,
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const Spacer(),
                const Text(
                  'Connect near you',
                  style: TextStyle(
                    color: AppColors.green,
                    fontSize: 9,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(width: 3),
                const Icon(
                  Icons.arrow_forward_rounded,
                  color: AppColors.green,
                  size: 13,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 140,
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(13, 0, 13, 12),
              scrollDirection: Axis.horizontal,
              itemCount: entrepreneurs.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final entrepreneur = entrepreneurs[index];
                return _EntrepreneurCard(
                  entrepreneur: entrepreneur,
                  onConnect: onConnect,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _EntrepreneurCard extends StatelessWidget {
  const _EntrepreneurCard({required this.entrepreneur, this.onConnect});

  final _Entrepreneur entrepreneur;
  final ValueChanged<String>? onConnect;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 208,
      child: Container(
        padding: const EdgeInsets.all(9),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(9),
          border: Border.all(color: AppColors.border),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0C17202A),
              blurRadius: 8,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 17,
                  backgroundColor: entrepreneur.color,
                  child: Text(
                    entrepreneur.initials,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                const SizedBox(width: 7),
                Expanded(
                  child: Text(
                    entrepreneur.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                if (entrepreneur.isVerified)
                  const Icon(Icons.verified, color: AppColors.blue, size: 14),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              entrepreneur.category,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: AppColors.muted, fontSize: 8),
            ),
            const SizedBox(height: 2),
            Text(
              entrepreneur.location,
              style: const TextStyle(color: AppColors.muted, fontSize: 8),
            ),
            const Spacer(),
            SizedBox(
              height: 27,
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () => onConnect?.call(entrepreneur.name),
                icon: const Icon(Icons.chat_bubble_outline_rounded, size: 13),
                label: const Text(
                  'Start a conversation',
                  style: TextStyle(fontSize: 9, fontWeight: FontWeight.w800),
                ),
                style: FilledButton.styleFrom(
                  backgroundColor: entrepreneur.color,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Entrepreneur {
  const _Entrepreneur({
    required this.name,
    required this.category,
    required this.location,
    required this.initials,
    required this.color,
    required this.isVerified,
  });

  final String name;
  final String category;
  final String location;
  final String initials;
  final Color color;
  final bool isVerified;
}
