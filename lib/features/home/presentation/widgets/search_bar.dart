import 'package:flutter/material.dart';

class HomeSearchBar extends StatelessWidget {
  final VoidCallback? onTap;

  const HomeSearchBar({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black.withValues(alpha: .06),
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        readOnly: onTap != null,
        onTap: onTap,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          isDense: true,

          contentPadding: EdgeInsets.zero,

          hintText: 'What are you looking for?',
          hintStyle: const TextStyle(fontSize: 11, color: Color(0xFF9CA2A6)),

          prefixIcon: const Icon(
            Icons.search_rounded,
            size: 20,
            color: Color(0xFF687076),
          ),

          prefixIconConstraints: const BoxConstraints(
            minWidth: 40,
            minHeight: 42,
            maxHeight: 42,
          ),

          border: InputBorder.none,
        ),
      ),
    );
  }
}
