import 'package:dma_e_commerce/core/theme/app_colors.dart';
import 'package:dma_e_commerce/features/home/data/home_models.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget {
  final List<CategoryModel> categories;
  final List<FeaturedProductModel> products;
  final List<DealModel> deals;

  const ExploreScreen({
    super.key,
    required this.categories,
    required this.products,
    required this.deals,
  });

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final searchController = TextEditingController();
  String selectedIntent = 'All';

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final query = searchController.text.trim().toLowerCase();
    final products = widget.products.where((product) {
      return query.isEmpty ||
          product.name.toLowerCase().contains(query) ||
          product.supplier.toLowerCase().contains(query);
    }).toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 8, 10, 0),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    'Discover',
                    style: TextStyle(
                      color: AppColors.text,
                      fontSize: 23,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 7,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.orange,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Text(
                      'NEW',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.tune_rounded),
                    color: AppColors.green,
                    tooltip: 'Filter discovery',
                  ),
                ],
              ),
              TextField(
                controller: searchController,
                onChanged: (_) => setState(() {}),
                decoration: InputDecoration(
                  hintText: 'Find products, suppliers or ideas',
                  prefixIcon: const Icon(Icons.search_rounded),
                  suffixIcon: searchController.text.isEmpty
                      ? IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.mic_none_rounded),
                          tooltip: 'Voice search',
                        )
                      : IconButton(
                          onPressed: () {
                            searchController.clear();
                            setState(() {});
                          },
                          icon: const Icon(Icons.close_rounded),
                          tooltip: 'Clear search',
                        ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 14),
            children: [
              const _OpportunityHero(),
              const SizedBox(height: 14),
              _IntentChips(
                selected: selectedIntent,
                onSelected: (value) => setState(() => selectedIntent = value),
              ),
              const SizedBox(height: 18),
              const _SectionTitle(
                title: 'Trending in Bangladesh',
                action: 'See all',
              ),
              const SizedBox(height: 8),
              _CategoryRail(categories: widget.categories),
              const SizedBox(height: 18),
              _SectionTitle(
                title: selectedIntent == 'All'
                    ? 'Made for your next order'
                    : 'Best picks for $selectedIntent',
                action: '${products.length} picks',
              ),
              const SizedBox(height: 8),
              _ProductDiscoveryGrid(products: products),
              const SizedBox(height: 18),
              const _SectionTitle(
                title: 'Price drops worth seeing',
                action: 'Hot deals',
              ),
              const SizedBox(height: 8),
              _DealRail(deals: widget.deals),
            ],
          ),
        ),
      ],
    );
  }
}

class _OpportunityHero extends StatelessWidget {
  const _OpportunityHero();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 176),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.darkGreen,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -8,
            top: -18,
            child: Icon(
              Icons.public_rounded,
              size: 150,
              color: Colors.white.withAlpha(18),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'THE MARKET IS MOVING',
                style: TextStyle(
                  color: Color(0xFF9EF0C8),
                  fontSize: 9,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 8),
              const SizedBox(
                width: 215,
                child: Text(
                  'Find the next product\npeople want to buy.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    height: 1.05,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  const _HeroStat(value: '128+', label: 'new listings'),
                  const SizedBox(width: 22),
                  const _HeroStat(value: '24h', label: 'fresh trends'),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 11,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.orange,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Row(
                      children: [
                        Text(
                          'Explore now',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(
                          Icons.arrow_forward_rounded,
                          color: Colors.white,
                          size: 13,
                        ),
                      ],
                    ),
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

class _HeroStat extends StatelessWidget {
  final String value;
  final String label;

  const _HeroStat({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w900,
          ),
        ),
        Text(
          label,
          style: const TextStyle(color: Color(0xFFB8EBD2), fontSize: 8),
        ),
      ],
    );
  }
}

class _IntentChips extends StatelessWidget {
  final String selected;
  final ValueChanged<String> onSelected;

  const _IntentChips({required this.selected, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    const intents = ['All', 'Source', 'Export', 'Wholesale'];
    return SizedBox(
      height: 42,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: intents.length,
        separatorBuilder: (_, __) => const SizedBox(width: 7),
        itemBuilder: (_, index) {
          final intent = intents[index];
          final active = selected == intent;
          return ChoiceChip(
            label: Text(intent),
            selected: active,
            onSelected: (_) => onSelected(intent),
            showCheckmark: false,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
            labelStyle: TextStyle(
              color: active ? Colors.white : AppColors.text,
              fontSize: 10,
              fontWeight: FontWeight.w700,
            ),
            backgroundColor: Colors.white,
            selectedColor: AppColors.green,
            side: BorderSide(
              color: active ? AppColors.green : AppColors.border,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8),
          );
        },
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  final String action;

  const _SectionTitle({required this.title, required this.action});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              color: AppColors.text,
              fontSize: 15,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        Text(
          action,
          style: const TextStyle(
            color: AppColors.green,
            fontSize: 9,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(width: 2),
        const Icon(
          Icons.arrow_forward_ios_rounded,
          color: AppColors.green,
          size: 10,
        ),
      ],
    );
  }
}

class _CategoryRail extends StatelessWidget {
  final List<CategoryModel> categories;

  const _CategoryRail({required this.categories});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 112,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 9),
        itemBuilder: (_, index) {
          final category = categories[index];
          return SizedBox(
            width: 92,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    category.imageUrl,
                    width: 92,
                    height: 112,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) =>
                        Container(color: AppColors.lightGreen),
                  ),
                ),
                Positioned(
                  left: 6,
                  right: 6,
                  bottom: 7,
                  child: Text(
                    category.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ProductDiscoveryGrid extends StatelessWidget {
  final List<FeaturedProductModel> products;

  const _ProductDiscoveryGrid({required this.products});

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 28),
        child: Center(
          child: Text(
            'No matching products found',
            style: TextStyle(color: AppColors.muted),
          ),
        ),
      );
    }
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 9,
        mainAxisSpacing: 9,
        childAspectRatio: .84,
      ),
      itemBuilder: (_, index) => _DiscoveryCard(product: products[index]),
    );
  }
}

class _DiscoveryCard extends StatelessWidget {
  final FeaturedProductModel product;

  const _DiscoveryCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(11),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(11),
                  ),
                  child: Image.network(
                    product.imageUrl,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => const Center(
                      child: Icon(Icons.image_outlined, color: AppColors.muted),
                    ),
                  ),
                ),
                Positioned(
                  left: 6,
                  top: 6,
                  child: _StatusTag(text: product.tag),
                ),
                const Positioned(
                  right: 6,
                  top: 6,
                  child: CircleAvatar(
                    radius: 13,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.bookmark_border_rounded, size: 16),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 6, 8, 7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  '${product.price} ${product.unit}',
                  style: const TextStyle(
                    color: AppColors.green,
                    fontSize: 11,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 3),
                Row(
                  children: [
                    const Icon(
                      Icons.star_rounded,
                      color: Color(0xFFFFB300),
                      size: 12,
                    ),
                    Text(
                      ' ${product.rating}',
                      style: const TextStyle(fontSize: 8),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.north_east_rounded,
                      color: AppColors.green,
                      size: 14,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DealRail extends StatelessWidget {
  final List<DealModel> deals;

  const _DealRail({required this.deals});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 84,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: deals.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (_, index) {
          final deal = deals[index];
          return Container(
            width: 226,
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: AppColors.lightOrange,
              borderRadius: BorderRadius.circular(11),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    deal.imageUrl,
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) =>
                        Container(width: 70, height: 70, color: Colors.white),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        deal.discount,
                        style: const TextStyle(
                          color: AppColors.orange,
                          fontSize: 8,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        deal.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        deal.price,
                        style: const TextStyle(
                          color: AppColors.green,
                          fontSize: 11,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.chevron_right_rounded,
                  color: AppColors.orange,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _StatusTag extends StatelessWidget {
  final String text;

  const _StatusTag({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: AppColors.green,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 7,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
