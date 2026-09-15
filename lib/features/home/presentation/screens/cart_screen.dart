import 'package:dma_e_commerce/core/theme/app_colors.dart';
import 'package:dma_e_commerce/features/home/data/home_models.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  final VoidCallback onBrowseProducts;
  final List<FeaturedProductModel> products;
  final ValueChanged<FeaturedProductModel> onRemoveProduct;
  final Map<String, int> quantities;
  final ValueChanged<FeaturedProductModel> onIncreaseQuantity;
  final ValueChanged<FeaturedProductModel> onDecreaseQuantity;
  final VoidCallback onClearCart;
  final VoidCallback? onCheckout;

  const CartScreen({
    super.key,
    required this.onBrowseProducts,
    required this.products,
    required this.onRemoveProduct,
    required this.quantities,
    required this.onIncreaseQuantity,
    required this.onDecreaseQuantity,
    required this.onClearCart,
    this.onCheckout,
  });

  @override
  Widget build(BuildContext context) {
    if (products.isNotEmpty) {
      return _FilledCart(
        products: products,
        onRemoveProduct: onRemoveProduct,
        quantities: quantities,
        onIncreaseQuantity: onIncreaseQuantity,
        onDecreaseQuantity: onDecreaseQuantity,
        onClearCart: onClearCart,
        onCheckout: onCheckout,
        onBrowseProducts: onBrowseProducts,
      );
    }

    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 16, 18, 12),
            child: Row(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'My Cart',
                        style: TextStyle(
                          color: AppColors.text,
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        'Your selected products',
                        style: TextStyle(color: AppColors.muted, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 11,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.lightGreen,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${products.length} item${products.length == 1 ? '' : 's'}',
                    style: TextStyle(
                      color: AppColors.darkGreen,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(18, 10, 18, 24),
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(22, 28, 22, 25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.border),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x0D17202A),
                        blurRadius: 18,
                        offset: Offset(0, 7),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      _EmptyCartIllustration(),
                      const SizedBox(height: 20),
                      const Text(
                        'Your cart is waiting',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.text,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Add products from trusted Bangladesh sellers\nand they will appear here.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.muted,
                          fontSize: 13,
                          height: 1.45,
                        ),
                      ),
                      const SizedBox(height: 22),
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton.icon(
                          onPressed: onBrowseProducts,
                          icon: const Icon(Icons.explore_rounded, size: 19),
                          label: const Text('Browse Products'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.green,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                            textStyle: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                const _OrderSummaryPreview(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FilledCart extends StatelessWidget {
  final List<FeaturedProductModel> products;
  final ValueChanged<FeaturedProductModel> onRemoveProduct;
  final Map<String, int> quantities;
  final ValueChanged<FeaturedProductModel> onIncreaseQuantity;
  final ValueChanged<FeaturedProductModel> onDecreaseQuantity;
  final VoidCallback onClearCart;
  final VoidCallback? onCheckout;
  final VoidCallback onBrowseProducts;

  const _FilledCart({
    required this.products,
    required this.onRemoveProduct,
    required this.quantities,
    required this.onIncreaseQuantity,
    required this.onDecreaseQuantity,
    required this.onClearCart,
    this.onCheckout,
    required this.onBrowseProducts,
  });

  double _priceOf(FeaturedProductModel product) {
    return double.tryParse(product.price.replaceAll(RegExp(r'[^0-9.]'), '')) ??
        0;
  }

  @override
  Widget build(BuildContext context) {
    final subtotal = products.fold<double>(
      0,
      (total, product) =>
          total + (_priceOf(product) * (quantities[product.name] ?? 1)),
    );
    const delivery = 120.0;

    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 16, 18, 12),
            child: Row(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'My Cart',
                        style: TextStyle(
                          color: AppColors.text,
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        'Ready for your next order',
                        style: TextStyle(color: AppColors.muted, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 11,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.lightGreen,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${products.length} item${products.length == 1 ? '' : 's'}',
                    style: const TextStyle(
                      color: AppColors.darkGreen,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                TextButton.icon(
                  onPressed: onClearCart,
                  icon: const Icon(Icons.delete_sweep_outlined, size: 17),
                  label: const Text('Clear cart'),
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.red,
                    padding: EdgeInsets.zero,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(18, 4, 18, 24),
              children: [
                ...products.map(
                  (product) => _CartProductTile(
                    product: product,
                    quantity: quantities[product.name] ?? 1,
                    onRemove: () => onRemoveProduct(product),
                    onIncrease: () => onIncreaseQuantity(product),
                    onDecrease: () => onDecreaseQuantity(product),
                  ),
                ),
                const SizedBox(height: 8),
                TextButton.icon(
                  onPressed: onBrowseProducts,
                  icon: const Icon(Icons.add_rounded, size: 17),
                  label: const Text('Add more products'),
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.green,
                    alignment: Alignment.centerLeft,
                  ),
                ),
                const SizedBox(height: 8),
                const _PromoCodeField(),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2F5F4),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      _SummaryRow(
                        label: 'Subtotal',
                        value: 'BDT ${subtotal.toStringAsFixed(0)}',
                      ),
                      const SizedBox(height: 9),
                      const _SummaryRow(
                        label: 'Delivery estimate',
                        value: 'BDT 120',
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Divider(height: 1, color: AppColors.border),
                      ),
                      _SummaryRow(
                        label: 'Estimated total',
                        value:
                            'BDT ${(subtotal + delivery).toStringAsFixed(0)}',
                        strong: true,
                      ),
                      const SizedBox(height: 14),
                      SizedBox(
                        width: double.infinity,
                        height: 46,
                        child: ElevatedButton.icon(
                          onPressed:
                              onCheckout ??
                              () => ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Checkout is ready for your order',
                                  ),
                                ),
                              ),
                          icon: const Icon(
                            Icons.lock_outline_rounded,
                            size: 17,
                          ),
                          label: const Text('Proceed to Checkout'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.green,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.verified_user_outlined,
                      size: 15,
                      color: AppColors.green,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Secure checkout  •  Trusted Bangladesh sellers',
                      style: TextStyle(color: AppColors.muted, fontSize: 10),
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

class _CartProductTile extends StatelessWidget {
  final FeaturedProductModel product;
  final int quantity;
  final VoidCallback onRemove;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const _CartProductTile({
    required this.product,
    required this.quantity,
    required this.onRemove,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              product.imageUrl,
              width: 68,
              height: 68,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: 68,
                height: 68,
                color: AppColors.lightGreen,
                child: const Icon(Icons.image_outlined, color: AppColors.green),
              ),
            ),
          ),
          const SizedBox(width: 11),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  product.supplier,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: AppColors.muted, fontSize: 9),
                ),
                const SizedBox(height: 6),
                Text(
                  'BDT ${(double.tryParse(product.price.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0) * quantity}',
                  style: const TextStyle(
                    color: AppColors.green,
                    fontSize: 12,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.lightGreen,
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _QuantityButton(icon: Icons.remove, onTap: onDecrease),
                    Text(
                      '$quantity',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    _QuantityButton(icon: Icons.add, onTap: onIncrease),
                  ],
                ),
              ),
              IconButton(
                onPressed: onRemove,
                icon: const Icon(Icons.delete_outline_rounded, size: 19),
                color: AppColors.muted,
                tooltip: 'Remove item',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _QuantityButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(icon, size: 14),
      color: AppColors.darkGreen,
      constraints: const BoxConstraints.tightFor(width: 28, height: 28),
      padding: EdgeInsets.zero,
      tooltip: icon == Icons.add ? 'Increase quantity' : 'Decrease quantity',
    );
  }
}

class _PromoCodeField extends StatefulWidget {
  const _PromoCodeField();

  @override
  State<_PromoCodeField> createState() => _PromoCodeFieldState();
}

class _PromoCodeFieldState extends State<_PromoCodeField> {
  final controller = TextEditingController();
  bool applied = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            textCapitalization: TextCapitalization.characters,
            decoration: InputDecoration(
              hintText: 'Promo code',
              prefixIcon: const Icon(Icons.local_offer_outlined, size: 18),
              isDense: true,
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(11),
                borderSide: const BorderSide(color: AppColors.border),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(11),
                borderSide: const BorderSide(color: AppColors.border),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          height: 44,
          child: OutlinedButton(
            onPressed: () {
              setState(() {
                applied = controller.text.trim().toUpperCase() == 'BD100';
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    applied
                        ? 'BD100 applied: BDT 100 off'
                        : 'Try code BD100 for BDT 100 off',
                  ),
                ),
              );
            },
            child: Text(applied ? 'Applied' : 'Apply'),
          ),
        ),
      ],
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool strong;

  const _SummaryRow({
    required this.label,
    required this.value,
    this.strong = false,
  });

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      color: strong ? AppColors.text : AppColors.muted,
      fontSize: strong ? 14 : 12,
      fontWeight: strong ? FontWeight.w800 : FontWeight.w500,
    );
    return Row(
      children: [
        Text(label, style: style),
        const Spacer(),
        Text(value, style: style),
      ],
    );
  }
}

class _EmptyCartIllustration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 128,
      height: 128,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 116,
            height: 116,
            decoration: const BoxDecoration(
              color: AppColors.lightGreen,
              shape: BoxShape.circle,
            ),
          ),
          Positioned(
            top: 7,
            right: 4,
            child: Container(
              width: 27,
              height: 27,
              decoration: const BoxDecoration(
                color: AppColors.lightOrange,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.local_shipping_rounded,
                color: AppColors.orange,
                size: 15,
              ),
            ),
          ),
          Container(
            width: 66,
            height: 58,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(17),
              border: Border.all(color: AppColors.green, width: 3),
            ),
            child: const Icon(
              Icons.shopping_cart_rounded,
              color: AppColors.green,
              size: 35,
            ),
          ),
          Positioned(bottom: 12, left: 21, child: _Dot(color: AppColors.red)),
          const Positioned(
            bottom: 12,
            right: 21,
            child: _Dot(color: AppColors.green),
          ),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final Color color;

  const _Dot({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

class _OrderSummaryPreview extends StatelessWidget {
  const _OrderSummaryPreview();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F5F4),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.receipt_long_rounded,
                color: AppColors.muted,
                size: 18,
              ),
              const SizedBox(width: 8),
              const Expanded(
                child: Text(
                  'Order summary',
                  style: TextStyle(
                    color: AppColors.text,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Text(
                '৳ 0.00',
                style: TextStyle(
                  color: AppColors.muted,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(height: 1, color: AppColors.border),
          const SizedBox(height: 12),
          const Row(
            children: [
              Text(
                'Add an item to see your total',
                style: TextStyle(color: AppColors.muted, fontSize: 11),
              ),
              Spacer(),
              Text(
                'Checkout',
                style: TextStyle(
                  color: Color(0xFFABB4B0),
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
