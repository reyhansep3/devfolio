import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_portofolio/view/pages/home/widgets/about_palette.dart';
import 'package:flutter_portofolio/view/pages/home/widgets/phone_chat_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

const phonePreviewHeroTag = 'phone-preview-widget';

class PhoneWidget extends StatefulWidget {
  const PhoneWidget({
    super.key,
    required this.height,
    required this.width,
    this.fullscreen = false,
    this.expanded = false,
    this.initiallyUnlocked = false,
  });

  final int height;
  final int width;
  final bool fullscreen;
  final bool expanded;
  final bool initiallyUnlocked;

  @override
  State<PhoneWidget> createState() => _PhoneWidgetState();
}

class _PhoneWidgetState extends State<PhoneWidget>
    with TickerProviderStateMixin {
  late bool _unlocked = widget.initiallyUnlocked;
  late bool _showLockScreen = !widget.initiallyUnlocked;
  late bool _showChatScreen = widget.initiallyUnlocked;
  late final AnimationController _bounce = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 850),
  )..repeat(reverse: true, count: 4);
  late final AnimationController _unlockSlide =
      AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 420),
      )..addStatusListener((status) {
        if (status == AnimationStatus.completed && mounted) {
          setState(() => _showLockScreen = false);
        } else if (status == AnimationStatus.dismissed &&
            !_unlocked &&
            !_dragging &&
            mounted) {
          setState(() => _showChatScreen = false);
        }
      });
  late final Timer _clock = Timer.periodic(const Duration(minutes: 1), (_) {
    if (mounted && !_unlocked) setState(() {});
  });
  double _dragDistance = 0;
  bool _dragging = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_unlocked || MediaQuery.disableAnimationsOf(context)) _bounce.stop();
  }

  @override
  void dispose() {
    _clock.cancel();
    _bounce.dispose();
    _unlockSlide.dispose();
    super.dispose();
  }

  void _unlock() {
    if (!_unlocked) {
      _bounce.stop();
      final reduceMotion = MediaQuery.disableAnimationsOf(context);
      setState(() {
        _unlocked = true;
        _showChatScreen = true;
        if (reduceMotion) _showLockScreen = false;
      });
      if (!reduceMotion) {
        _unlockSlide.animateTo(
          1,
          duration: Duration(
            milliseconds: (420 * (1 - _unlockSlide.value)).round().clamp(
              150,
              420,
            ),
          ),
          curve: Curves.easeOutCubic,
        );
      }
    }
  }

  void _cancelSwipe() {
    if (_unlocked) return;
    _dragging = false;
    if (_unlockSlide.value == 0) {
      setState(() => _showChatScreen = false);
    } else {
      _unlockSlide.animateBack(
        0,
        duration: Duration(
          milliseconds: (300 * _unlockSlide.value).round().clamp(120, 300),
        ),
        curve: Curves.easeOutCubic,
      );
    }
  }

  void _toggleFullscreen() {
    final router = GoRouter.of(context);
    if (widget.expanded) {
      if (router.canPop()) {
        router.pop();
      } else {
        router.go('/');
      }
    } else {
      router.push('/phone-preview', extra: _unlocked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final frameless = widget.fullscreen;
    return Container(
      width: widget.width.toDouble(),
      height: widget.height.toDouble(),
      decoration: BoxDecoration(
        color: AboutPalette.ink,
        borderRadius: frameless ? null : BorderRadius.circular(36),
        border: frameless ? null : Border.all(color: Colors.white24, width: 6),
      ),
      child: ClipRRect(
        borderRadius: frameless ? BorderRadius.zero : BorderRadius.circular(30),
        child: Stack(
          children: [
            Positioned.fill(
              child: _showChatScreen
                  ? PhoneChatScreen(fullscreen: frameless)
                  : const ColoredBox(color: AboutPalette.ink),
            ),
            if (_showLockScreen)
              Positioned.fill(
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset.zero,
                    end: const Offset(0, -1),
                  ).animate(_unlockSlide),
                  child: _lockScreen(),
                ),
              ),
            if (!frameless)
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    width: 60,
                    height: 16,
                    decoration: const BoxDecoration(
                      color: AboutPalette.ink,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(12),
                      ),
                    ),
                  ),
                ),
              ),
            if (!frameless)
              Positioned(
                bottom: 6,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    width: 48,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ),
            Positioned(
              top: frameless ? MediaQuery.paddingOf(context).top + 16 : 24,
              right: frameless ? MediaQuery.paddingOf(context).right + 16 : 10,
              child: IconButton(
                onPressed: _toggleFullscreen,
                tooltip: widget.expanded
                    ? 'Back to normal size'
                    : 'Open phone fullscreen',
                icon: Icon(
                  widget.expanded
                      ? Icons.fullscreen_exit_rounded
                      : Icons.fullscreen_rounded,
                ),
                color: Colors.white,
                iconSize: 24,
                constraints: const BoxConstraints(minWidth: 44, minHeight: 44),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.black.withValues(alpha: .7),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _lockScreen() {
    final topInset = widget.fullscreen
        ? MediaQuery.paddingOf(context).top
        : 0.0;
    final now = DateTime.now();
    final time =
        '${now.hour.toString().padLeft(2, '0')}:'
        '${now.minute.toString().padLeft(2, '0')}';
    const weekdays = [
      'MONDAY',
      'TUESDAY',
      'WEDNESDAY',
      'THURSDAY',
      'FRIDAY',
      'SATURDAY',
      'SUNDAY',
    ];
    const months = [
      'JANUARY',
      'FEBRUARY',
      'MARCH',
      'APRIL',
      'MAY',
      'JUNE',
      'JULY',
      'AUGUST',
      'SEPTEMBER',
      'OCTOBER',
      'NOVEMBER',
      'DECEMBER',
    ];
    final date =
        '${weekdays[now.weekday - 1]}, ${months[now.month - 1]} ${now.day}';

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onVerticalDragStart: (_) {
        _dragDistance = 0;
        _dragging = true;
        setState(() => _showChatScreen = true);
      },
      onVerticalDragUpdate: (details) {
        _dragDistance += details.delta.dy;
        _unlockSlide.value = (-_dragDistance / widget.height).clamp(0.0, 1.0);
      },
      onVerticalDragEnd: (details) {
        _dragging = false;
        if (_dragDistance < -55 || (details.primaryVelocity ?? 0) < -350) {
          _unlock();
        } else {
          _cancelSwipe();
        }
      },
      onVerticalDragCancel: _cancelSwipe,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/image/phone_profile.webp',
              fit: BoxFit.cover,
              cacheWidth:
                  (widget.width * MediaQuery.devicePixelRatioOf(context))
                      .round()
                      .clamp(1, 900),
              semanticLabel: 'Reyhan Septri Asta portrait',
            ),
          ),
          Positioned.fill(
            child: ColoredBox(color: AboutPalette.ink.withValues(alpha: .52)),
          ),
          Positioned(
            top: topInset + 65,
            left: 15,
            right: 15,
            child: Column(
              children: [
                Text(
                  time,
                  style: GoogleFonts.spaceGrotesk(
                    color: Colors.white,
                    fontSize: widget.width < 290 ? 45 : 58,
                    fontWeight: FontWeight.w700,
                    height: 1,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  date,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.1,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 15,
            right: 15,
            bottom: (widget.height * .19).clamp(92.0, 165.0),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AboutPalette.paper.withValues(alpha: .94),
                borderRadius: BorderRadius.circular(17),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AboutPalette.accent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.chat_bubble_outline_rounded,
                      color: AboutPalette.ink,
                      size: 18,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'You can start a conversation',
                          style: GoogleFonts.inter(
                            color: AboutPalette.ink,
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Start connecting with me via live chat',
                          style: GoogleFonts.inter(
                            color: AboutPalette.body,
                            fontSize: 10,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: widget.fullscreen ? 42 : 22,
            child: Semantics(
              button: true,
              label: 'Swipe up to unlock chat',
              onTap: _unlock,
              child: GestureDetector(
                onTap: _unlock,
                behavior: HitTestBehavior.opaque,
                child: Column(
                  children: [
                    AnimatedBuilder(
                      animation: _bounce,
                      builder: (context, child) => Transform.translate(
                        offset: Offset(0, -6 * _bounce.value),
                        child: child,
                      ),
                      child: const Icon(
                        Icons.keyboard_double_arrow_up_rounded,
                        color: Colors.white,
                        size: 27,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      'Swipe up to unlock',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PhonePreviewPage extends StatelessWidget {
  const PhonePreviewPage({super.key, this.initiallyUnlocked = false});

  final bool initiallyUnlocked;

  @override
  Widget build(BuildContext context) {
    final viewport = MediaQuery.sizeOf(context);
    final isPhone = viewport.width < 600;
    final phoneWidth = (viewport.width * 0.31).clamp(290.0, 390.0);
    final availableHeight = viewport.height - 96;
    final fittedWidth = phoneWidth.clamp(0.0, availableHeight / 1.96);

    return Material(
      color: isPhone ? const Color(0xFF0c0c0c) : const Color(0xFFF0F0EB),
      child: Center(
        child: Hero(
          tag: phonePreviewHeroTag,
          child: PhoneWidget(
            width: isPhone ? viewport.width.round() : fittedWidth.round(),
            height: isPhone
                ? viewport.height.round()
                : (fittedWidth * 1.96).round(),
            fullscreen: isPhone,
            expanded: true,
            initiallyUnlocked: initiallyUnlocked,
          ),
        ),
      ),
    );
  }
}
