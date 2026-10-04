import 'package:flutter/material.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/item/app_fonts.dart';

class PhoneWidget extends StatefulWidget {
  final int height;
  final int width;
  const PhoneWidget({super.key, required this.height, required this.width});

  @override
  State<PhoneWidget> createState() => _PhoneWidgetState();
}

class _PhoneWidgetState extends State<PhoneWidget>
    with TickerProviderStateMixin {
  bool isHovered = false;

  late AnimationController _slideController;
  late Animation<Offset> _slideOut;
  late Animation<Offset> _slideIn;
  late Animation<double> _fadeOut;
  late Animation<double> _fadeIn;

  // Untuk blinking cursor di kode
  late AnimationController _blinkController;
  late Animation<double> _blink;
  

  late AnimationController _notificationController;
  late Animation<Offset> _notificationSlide;
  late Animation<double> _notificationFade;

  @override
  void initState() {
    super.initState();

    _slideController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _slideOut = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, -0.3),
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeInOut,
    ));

    _slideIn = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeInOut,
    ));

    _fadeOut = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: _slideController,
        curve: const Interval(0.0, 0.5),
      ),
    );

    _fadeIn = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _slideController,
        curve: const Interval(0.5, 1.0),
      ),
    );

    // Blink cursor
    _blinkController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _notificationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _notificationSlide = Tween<Offset>(
      begin: const Offset(0, -0.35),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _notificationController,
        curve: Curves.easeOutCubic,
      ),
    );

    _notificationFade = CurvedAnimation(
      parent: _notificationController,
      curve: Curves.easeOut,
    );

    Future.delayed(const Duration(milliseconds: 1200), () {
      if (mounted) {
        _notificationController.forward();
      }
    });

    _blink = Tween<double>(begin: 1, end: 0).animate(_blinkController);
  }

  @override
  void dispose() {
    _slideController.dispose();
    _blinkController.dispose();
    _notificationController.dispose();
    super.dispose();
  }

  void _onHover(bool val) {
    if (isHovered == val) return;
    isHovered = val;
    if (val) {
      _blinkController.repeat(reverse: true);
      _slideController.forward();
    } else {
      _blinkController.stop();
      _blinkController.value = 1;
      _slideController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {

    // The parent supplies a breakpoint-aware size, keeping the widget within
    // the hero column on compact screens.
    const double scale = 1.0;

    return MouseRegion(
          onEnter: (_) => _onHover(true),
          onExit: (_) => _onHover(false),
          child: _buildPhone(context, scale, widget.height, widget.width),
        );
  }

  Widget _buildPhone(BuildContext context, double scale, int height, int width) {
    final basePhoneHeight = height;
    final basePhoneWidth = width;
    final double phoneHeight = basePhoneHeight * scale;
    final double phoneWidth = basePhoneWidth * scale;
    return Container(
      width: phoneWidth,
      height: phoneHeight,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(36),
        border: Border.all(color: Colors.white24, width: 6),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Stack(
          children: [
            // ── Screen background ──
            Container(color: const Color(0xFF0c0c0c)),

            // ── Idle screen (jam + lock) ──
            Positioned.fill(
              child: FadeTransition(
                opacity: _fadeOut,
                child: SlideTransition(
                  position: _slideOut,
                  child: _buildIdleScreen(),
                ),
              ),
            ),

            // ── Hover screen (hello world + kode) ──
            Center(
              child: FadeTransition(
                opacity: _fadeIn,
                child: SlideTransition(
                  position: _slideIn,
                  child: _buildHoverScreen(),
                ),
              ),
            ),

            // ── Status bar ──
            Positioned(
              top: 8,
              left: 16,
              right: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _currentTime(),
                    style: const TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 9,
                      color: Colors.white38,
                    ),
                  ),
                  const Row(
                    children: [
                      Icon(Icons.wifi, size: 10, color: Colors.white24),
                      SizedBox(width: 3),
                      Icon(Icons.battery_full, size: 10, color: Colors.white24),
                    ],
                  ),
                ],
              ),
            ),

            // ── Notch ──
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 60,
                  height: 16,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                ),
              ),
            ),

            // ── Home bar ──
            Positioned(
              bottom: 6,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 48,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIdleScreen() {
    return Stack(
      children: [
        // Wallpaper
        Positioned.fill(
          child: Image.asset(
            'assets/image/phone_profile.webp',
            fit: BoxFit.cover,
          ),
        ),

        // Overlay
        Positioned.fill(
          child: Container(
            color: Colors.black.withValues(alpha: 0.35),
          ),
        ),

        // Jam & lock
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                _currentTime(),
                style: const TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 36,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                _currentDate(),
                style: const TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 10,
                  color: Colors.white70,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 20),
              
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: FadeTransition(
                  opacity: _notificationFade,
                  child: SlideTransition(
                    position: _notificationSlide,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.15),
                        ),
                        // blur effect
                        backgroundBlendMode: BlendMode.overlay,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 34,
                            height: 34,
                            decoration: BoxDecoration(
                              color: AppColor.yellowgreen,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(
                              Icons.work_outline,
                              size: 18,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Portfolio Status",
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 9,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  "AVAILABLE FOR\nFULL-TIME, CONTRACT\n& FREELANCE",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    height: 1.3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Positioned(
          bottom: 45,
          left: 12,
          right: 12,
          child: Icon(
              Icons.lock_outline,
              color: Colors.white54,
              size: 22,
            ),
        ),
      ],
    );
  }
 

  Widget _buildHoverScreen() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hello world
          const Text(
            'Hello, World!',
            style: TextStyle(
              fontFamily: 'monospace',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColor.yellowgreen,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            '— Reyhan Septri Asta',
            style: AppFontStyle.poppinsBodySmall,
            // style: TextStyle(
            //   fontFamily: 'monospace',
            //   fontSize: 19,
            //   color: Colors.white38,
            // ),
          ),
          const SizedBox(height: 12),
          // Code snippet
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.04),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.white10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _codeText("// Reyhan Septri Asta", AppColor.grey2),
                _codeText("// Flutter Mobile Developer · 3 Years", AppColor.grey2),
                _codeText("// Currently @ CKL Cargo", AppColor.grey2),
                _codeText("// ══════════════", AppColor.grey2),
                _codeText("// I build intuitive mobile experiences", AppColor.grey2),
                _codeText("// using Flutter. Passionate about clean", AppColor.grey2),
                _codeText("// architecture, smooth UX, and code", AppColor.grey2),
                _codeText("// that scales.", AppColor.grey2),
                _codeText("// ══════════════", AppColor.grey2),
                _codeLine('void', ' main() {', null),
                _codeLine(null, '  runApp(', null),
                _codeLine(null, '    ', 'MyApp()'),
                _codeLine(null, '  );', null),
                Row(
                  children: [
                    _codeText('}', null),
                    // Blinking cursor
                    AnimatedBuilder(
                      animation: _blink,
                      builder: (_, __) => Opacity(
                        opacity: _blink.value,
                        child: Container(
                          width: 6,
                          height: 12,
                          margin: const EdgeInsets.only(left: 2),
                          color: AppColor.yellowgreen,
                        ),
                      ),
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

  Widget _codeLine(String? keyword, String? normal, String? highlight) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Row(
        children: [
          if (keyword != null)
            Text(keyword,
                style: const TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 10,
                    color: Color(0xFFc792ea))),
          if (normal != null)
            Text(normal,
                style: const TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 10,
                    color: Colors.white54)),
          if (highlight != null)
            Text(highlight,
                style: const TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 10,
                    color: AppColor.yellowgreen)),
        ],
      ),
    );
  }

  Widget _codeText(String text, Color? color) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'monospace',
        fontSize: 10,
        color: color ?? Colors.white54,
      ),
    );
  }

  String _currentTime() {
    final now = DateTime.now();
    return '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';
  }

  String _currentDate() {
    const days = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];
    const months = ['JAN','FEB','MAR','APR','MAY','JUN','JUL','AUG','SEP','OCT','NOV','DEC'];
    final now = DateTime.now();
    return '${days[now.weekday - 1]}, ${months[now.month - 1]} ${now.day}';
  }
}
