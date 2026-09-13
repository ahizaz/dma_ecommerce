import 'package:dma_e_commerce/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatMessage {
  final String text;
  final bool fromUser;

  const _ChatMessage({required this.text, required this.fromUser});
}

class _ChatScreenState extends State<ChatScreen> {
  final _messageController = TextEditingController();
  final _scrollController = ScrollController();
  final List<_ChatMessage> _messages = [
    const _ChatMessage(
      text:
          'Hi! I can help with products, orders, payments, delivery, and selling on Made in Bangladesh.',
      fromUser: false,
    ),
  ];

  int _selectedTopic = 0;
  bool _isTyping = false;

  final _topics = const [
    ('All', Icons.grid_view_rounded),
    ('Orders', Icons.receipt_long_rounded),
    ('Products', Icons.inventory_2_outlined),
    ('Selling', Icons.storefront_outlined),
  ];

  final _questionsByTopic = const [
    [
      'Where is my order?',
      'How do I request a return?',
      'What payment methods are available?',
    ],
    [
      'Where is my order?',
      'How long does delivery take?',
      'How do I request a return?',
    ],
    [
      'How do I find a product?',
      'How can I compare products?',
      'What payment methods are available?',
    ],
    [
      'How can I sell here?',
      'How do I add a product?',
      'Where can I see my sales?',
    ],
  ];

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _sendMessage([String? suggestedQuestion]) {
    final text = (suggestedQuestion ?? _messageController.text).trim();
    if (text.isEmpty || _isTyping) return;

    setState(() {
      _messages.add(_ChatMessage(text: text, fromUser: true));
      _messageController.clear();
      _isTyping = true;
    });
    _scrollToBottom();

    Future.delayed(const Duration(milliseconds: 650), () {
      if (!mounted) return;
      setState(() {
        _messages.add(_ChatMessage(text: _answerFor(text), fromUser: false));
        _isTyping = false;
      });
      _scrollToBottom();
    });
  }

  String _answerFor(String question) {
    final lowerQuestion = question.toLowerCase();
    if (lowerQuestion.contains('order') ||
        lowerQuestion.contains('delivery') ||
        lowerQuestion.contains('ship')) {
      return 'You can track your order from Account > My Orders. Delivery usually takes 3-5 business days after dispatch.';
    }
    if (lowerQuestion.contains('sell') ||
        lowerQuestion.contains('seller') ||
        lowerQuestion.contains('store')) {
      return 'To start selling, open Account and choose Become a Seller. Add your business details and product catalogue to get started.';
    }
    if (lowerQuestion.contains('pay') ||
        lowerQuestion.contains('cash') ||
        lowerQuestion.contains('price')) {
      return 'We support secure online payment and cash on delivery where available. The available options appear at checkout.';
    }
    if (lowerQuestion.contains('return') || lowerQuestion.contains('refund')) {
      return 'Go to Account > My Orders, select the item, and choose Return or Refund. Keep the product unused and in its original packaging.';
    }
    return 'I can help you with products, orders, delivery, payments, returns, and selling. Try one of the suggested questions below.';
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeader(),
        _buildTopicSegments(),
        Expanded(child: _buildConversation()),
        _buildComposer(),
      ],
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 8),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: const BoxDecoration(
              color: AppColors.lightGreen,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.support_agent_rounded,
              color: AppColors.green,
            ),
          ),
          const SizedBox(width: 11),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Help & Chat',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                ),
                SizedBox(height: 2),
                Text(
                  'Usually replies instantly',
                  style: TextStyle(color: AppColors.muted, fontSize: 12),
                ),
              ],
            ),
          ),
          Container(
            width: 9,
            height: 9,
            decoration: const BoxDecoration(
              color: AppColors.green,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 6),
          const Text(
            'Online',
            style: TextStyle(
              color: AppColors.green,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopicSegments() {
    return SizedBox(
      height: 52,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
        scrollDirection: Axis.horizontal,
        itemCount: _topics.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final selected = index == _selectedTopic;
          final topic = _topics[index];
          return ChoiceChip(
            selected: selected,
            label: Text(topic.$1),
            avatar: Icon(topic.$2, size: 16),
            labelStyle: TextStyle(
              color: selected ? Colors.white : AppColors.text,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
            backgroundColor: Colors.white,
            selectedColor: AppColors.green,
            side: BorderSide(
              color: selected ? AppColors.green : const Color(0xFFE1E7E4),
            ),
            onSelected: (_) => setState(() => _selectedTopic = index),
          );
        },
      ),
    );
  }

  Widget _buildConversation() {
    return ListView(
      controller: _scrollController,
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      children: [
        const Center(
          child: Text(
            'TODAY',
            style: TextStyle(
              color: AppColors.muted,
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 1,
            ),
          ),
        ),
        const SizedBox(height: 12),
        ..._messages.map(_buildMessage),
        if (_isTyping)
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: const SizedBox(
                width: 24,
                height: 14,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
          ),
        if (!_isTyping) _buildSuggestions(),
      ],
    );
  }

  Widget _buildMessage(_ChatMessage message) {
    return Align(
      alignment: message.fromUser
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 310),
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
        decoration: BoxDecoration(
          color: message.fromUser ? AppColors.green : Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: Radius.circular(message.fromUser ? 16 : 4),
            bottomRight: Radius.circular(message.fromUser ? 4 : 16),
          ),
        ),
        child: Text(
          message.text,
          style: TextStyle(
            color: message.fromUser ? Colors.white : AppColors.text,
            fontSize: 13,
            height: 1.35,
          ),
        ),
      ),
    );
  }

  Widget _buildSuggestions() {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: _questionsByTopic[_selectedTopic]
            .map(
              (question) => ActionChip(
                label: Text(question),
                onPressed: () => _sendMessage(question),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildComposer() {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFE8EAEB))),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              textInputAction: TextInputAction.send,
              onSubmitted: (_) => _sendMessage(),
              decoration: const InputDecoration(
                hintText: 'Ask about the app...',
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 11,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          IconButton.filled(
            onPressed: _isTyping ? null : _sendMessage,
            icon: const Icon(Icons.arrow_upward_rounded, size: 20),
            style: IconButton.styleFrom(
              backgroundColor: AppColors.green,
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
