import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_portofolio/view/pages/home/widgets/about_palette.dart';
import 'package:flutter_portofolio/view/pages/home/widgets/phone_chat_socket.dart';
import 'package:google_fonts/google_fonts.dart';

const _chatSocketUrl = String.fromEnvironment('CHAT_WS_URL');

class PhoneChatScreen extends StatefulWidget {
  const PhoneChatScreen({super.key, required this.fullscreen});

  final bool fullscreen;

  @override
  State<PhoneChatScreen> createState() => _PhoneChatScreenState();
}

class _PhoneChatScreenState extends State<PhoneChatScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _entrance = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 650),
  );
  bool _entranceStarted = false;
  final _messageController = TextEditingController();
  final _scrollController = ScrollController();
  final _messages = <_ChatMessage>[
    const _ChatMessage('Hello 👋', fromVisitor: false),
    const _ChatMessage('What are you thinking of?', fromVisitor: false),
  ];
  PhoneChatSocket? _socket;
  bool _connected = false;
  bool _connecting = false;

  @override
  void initState() {
    super.initState();
    if (_chatSocketUrl.isNotEmpty) {
      _connecting = true;
      _socket = PhoneChatSocket(
        url: _chatSocketUrl,
        onMessage: (text) {
          if (!mounted) return;
          setState(() => _messages.add(_ChatMessage(text, fromVisitor: false)));
          _scrollToBottom();
        },
        onConnectionChanged: (connected) {
          if (!mounted) return;
          setState(() {
            _connected = connected;
            _connecting = false;
          });
        },
      )..connect();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (MediaQuery.disableAnimationsOf(context)) {
      _entrance.value = 1;
    } else if (!_entranceStarted) {
      _entranceStarted = true;
      _entrance.forward();
    }
  }

  @override
  void dispose() {
    _entrance.dispose();
    _socket?.dispose();
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _send([String? suggestion]) {
    final text = (suggestion ?? _messageController.text).trim();
    if (text.isEmpty) return;
    final delivered = _socket?.send(text) ?? false;
    setState(
      () => _messages.add(
        _ChatMessage(text, fromVisitor: true, previewOnly: !delivered),
      ),
    );
    _messageController.clear();
    _scrollToBottom();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !_scrollController.hasClients) return;
      final position = _scrollController.position;
      if (position.maxScrollExtent - position.pixels < 2) return;
      if (MediaQuery.disableAnimationsOf(context)) {
        _scrollController.jumpTo(position.maxScrollExtent);
        return;
      }
      _scrollController.animateTo(
        position.maxScrollExtent,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutCubic,
      );
    });
  }

  Widget _riseIn(Widget child, {required double start}) {
    final fade = CurvedAnimation(
      parent: _entrance,
      curve: Interval(start, 1, curve: Curves.easeOut),
    );
    final slide = Tween<Offset>(begin: const Offset(0, .22), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _entrance,
            curve: Interval(start, 1, curve: Curves.easeOutBack),
          ),
        );
    return FadeTransition(
      opacity: fade,
      child: SlideTransition(position: slide, child: child),
    );
  }

  @override
  Widget build(BuildContext context) {
    final hasVisitorMessage = _messages.any((message) => message.fromVisitor);
    final topInset = widget.fullscreen
        ? MediaQuery.paddingOf(context).top
        : 0.0;
    final bottomInset = widget.fullscreen
        ? MediaQuery.paddingOf(context).bottom +
              MediaQuery.viewInsetsOf(context).bottom
        : 0.0;
    final status = _connected
        ? 'Connected live'
        : _connecting
        ? 'Connecting…'
        : _chatSocketUrl.isEmpty
        ? 'Preview · not connected'
        : 'Offline · not connected';
    return ColoredBox(
      color: AboutPalette.paper,
      child: Column(
        children: [
          _riseIn(
            Container(
              padding: EdgeInsets.fromLTRB(14, topInset + 24, 58, 10),
              decoration: const BoxDecoration(
                color: AboutPalette.ink,
                border: Border(bottom: BorderSide(color: Color(0xFF44443E))),
              ),
              child: Row(
                children: [
                  ClipOval(
                    child: Image.asset(
                      'assets/image/profile2.png',
                      width: 32,
                      height: 32,
                      fit: BoxFit.cover,
                      cacheWidth: (32 * MediaQuery.devicePixelRatioOf(context))
                          .round()
                          .clamp(1, 900),
                      semanticLabel: 'Reyhan Septri Asta',
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Reyhan',
                          style: GoogleFonts.spaceGrotesk(
                            color: AboutPalette.paper,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          status,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.inter(
                            color: AboutPalette.mutedOnDark,
                            fontSize: 9,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            start: 0,
          ),
          Expanded(
            child: RepaintBoundary(
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.fromLTRB(12, 14, 12, 14),
                itemCount: _messages.length,
                itemBuilder: (context, index) => _AnimatedChatBubble(
                  key: ValueKey('chat-message-$index'),
                  delay: index < 2
                      ? Duration(milliseconds: 90 + index * 120)
                      : Duration.zero,
                  child: _bubble(_messages[index]),
                ),
              ),
            ),
          ),
          _riseIn(
            Padding(
              padding: EdgeInsets.fromLTRB(12, 10, 12, 16 + bottomInset),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!_connected) ...[
                    Text(
                      'Preview mode · messages are not delivered',
                      style: GoogleFonts.inter(
                        color: AboutPalette.body,
                        fontSize: 9,
                      ),
                    ),
                    const SizedBox(height: 7),
                  ],
                  if (!hasVisitorMessage) ...[
                    SizedBox(
                      height: 44,
                      child: _DraggableSuggestions(onSelected: _send),
                    ),
                    const SizedBox(height: 8),
                  ],
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _messageController,
                          textInputAction: TextInputAction.send,
                          onFieldSubmitted: _send,
                          minLines: 1,
                          maxLines: 3,
                          style: GoogleFonts.inter(
                            color: AboutPalette.ink,
                            fontSize: 12,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Write a message…',
                            hintStyle: GoogleFonts.inter(
                              color: AboutPalette.body,
                              fontSize: 11,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 13,
                              vertical: 12,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(22),
                              borderSide: const BorderSide(
                                color: AboutPalette.body,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 7),
                      IconButton.filled(
                        tooltip: 'Send message',
                        onPressed: _send,
                        icon: const Icon(Icons.arrow_upward_rounded),
                        color: AboutPalette.ink,
                        style: IconButton.styleFrom(
                          backgroundColor: AboutPalette.accent,
                          minimumSize: const Size(44, 44),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            start: .18,
          ),
        ],
      ),
    );
  }

  Widget _bubble(_ChatMessage message) => Align(
    alignment: message.fromVisitor
        ? Alignment.centerRight
        : Alignment.centerLeft,
    child: Padding(
      padding: const EdgeInsets.only(bottom: 7),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 210),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
          decoration: BoxDecoration(
            color: message.fromVisitor ? AboutPalette.accent : Colors.white,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message.text,
                style: GoogleFonts.inter(
                  color: AboutPalette.ink,
                  fontSize: 12,
                  height: 1.35,
                ),
              ),
              if (message.previewOnly) ...[
                const SizedBox(height: 3),
                Text(
                  'Preview only · not sent',
                  style: GoogleFonts.inter(
                    color: AboutPalette.body,
                    fontSize: 9,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    ),
  );
}

class _ChatMessage {
  const _ChatMessage(
    this.text, {
    required this.fromVisitor,
    this.previewOnly = false,
  });

  final String text;
  final bool fromVisitor;
  final bool previewOnly;
}

class _DraggableSuggestions extends StatefulWidget {
  const _DraggableSuggestions({required this.onSelected});

  final ValueChanged<String> onSelected;

  @override
  State<_DraggableSuggestions> createState() => _DraggableSuggestionsState();
}

class _DraggableSuggestionsState extends State<_DraggableSuggestions> {
  final _rowKey = GlobalKey();
  double _offset = 0;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) => GestureDetector(
      key: const ValueKey('preview-suggestions-strip'),
      behavior: HitTestBehavior.opaque,
      onHorizontalDragUpdate: (details) {
        final contentWidth = _rowKey.currentContext?.size?.width ?? 0;
        final maxDrag = (contentWidth - constraints.maxWidth).clamp(
          0.0,
          double.infinity,
        );
        setState(() {
          _offset = (_offset + details.delta.dx).clamp(-maxDrag, 0.0);
        });
      },
      child: ClipRect(
        child: OverflowBox(
          alignment: Alignment.centerLeft,
          minWidth: 0,
          maxWidth: double.infinity,
          child: Transform.translate(
            offset: Offset(_offset, 0),
            child: Row(
              key: _rowKey,
              mainAxisSize: MainAxisSize.min,
              children: [
                for (final suggestion in const [
                  'Hi',
                  'Can we connect?',
                  "Let's work together",
                ]) ...[
                  if (suggestion != 'Hi') const SizedBox(width: 6),
                  TextButton(
                    onPressed: () => widget.onSelected(suggestion),
                    style: TextButton.styleFrom(
                      foregroundColor: AboutPalette.ink,
                      minimumSize: const Size(44, 44),
                      padding: EdgeInsets.zero,
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: AboutPalette.body),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Text(
                        suggestion,
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          height: 1.35,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

class _AnimatedChatBubble extends StatefulWidget {
  const _AnimatedChatBubble({
    super.key,
    required this.child,
    required this.delay,
  });

  final Widget child;
  final Duration delay;

  @override
  State<_AnimatedChatBubble> createState() => _AnimatedChatBubbleState();
}

class _AnimatedChatBubbleState extends State<_AnimatedChatBubble>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 540),
  );
  late final Animation<double> _fade = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeOut,
  );
  late final Animation<Offset> _slide = Tween<Offset>(
    begin: const Offset(0, .32),
    end: Offset.zero,
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));
  Timer? _delayTimer;
  bool _started = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (MediaQuery.disableAnimationsOf(context)) {
      _delayTimer?.cancel();
      _controller.value = 1;
    } else if (!_started) {
      _started = true;
      if (widget.delay == Duration.zero) {
        _controller.forward();
      } else {
        _delayTimer = Timer(widget.delay, () {
          if (mounted) _controller.forward();
        });
      }
    }
  }

  @override
  void dispose() {
    _delayTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => FadeTransition(
    opacity: _fade,
    child: SlideTransition(position: _slide, child: widget.child),
  );
}
