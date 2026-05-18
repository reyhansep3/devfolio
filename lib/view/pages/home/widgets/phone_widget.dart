import 'package:flutter/material.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/item/app_fonts.dart';
import 'package:flutter_portofolio/item/media_query.dart';

class PhoneWidget extends StatefulWidget {
  const PhoneWidget({super.key});

  @override
  State<PhoneWidget> createState() => _PhoneWidgetState();
}

class _PhoneWidgetState extends State<PhoneWidget>
    with TickerProviderStateMixin {
  bool isHovered = false;
  Offset cursor = Offset.zero;

  late AnimationController _slideController;
  late Animation<Offset> _slideOut;
  late Animation<Offset> _slideIn;
  late Animation<double> _fadeOut;
  late Animation<double> _fadeIn;

  // Untuk blinking cursor di kode
  late AnimationController _blinkController;
  late Animation<double> _blink;

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
    )..repeat(reverse: true);

    _blink = Tween<double>(begin: 1, end: 0).animate(_blinkController);
  }

  @override
  void dispose() {
    _slideController.dispose();
    _blinkController.dispose();
    super.dispose();
  }

  void _onHover(bool val) {
    setState(() => isHovered = val);
    if (val) {
      _slideController.forward();
    } else {
      _slideController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.none,
      onHover: (e) => setState(() => cursor = e.localPosition),
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // ── Phone body ──
          AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            curve: Curves.elasticOut,
            transform: isHovered
                ? (Matrix4.identity()
                  ..translate(0.0, -12.0)
                  ..rotateZ(-0.03))
                : Matrix4.identity(),
            child: _buildPhone(context),
          ),

          // ── Custom cursor ──
          AnimatedPositioned(
            duration: const Duration(milliseconds: 60),
            curve: Curves.easeOut,
            left: cursor.dx - (isHovered ? 40 : 0),
            top: cursor.dy - (isHovered ? 40 : 0),
            child: IgnorePointer(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                width: isHovered ? 80 : 0,
                height: isHovered ? 80 : 0,
                decoration: BoxDecoration(
                  color: isHovered
                      // ignore: deprecated_member_use
                      ? AppColor.yellowgreen.withOpacity(0.15)
                      : Colors.transparent,
                  border: Border.all(
                    color: AppColor.yellowgreen,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(
                    isHovered ? 0 : 99,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhone(BuildContext context) {
    return Container(
      width: context.height*0.4,
      height: context.height*0.75,
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

            // ── Idle screen (jam + lock) ──
            Center(
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
      // ── Foto kamu sebagai wallpaper ──
      Positioned.fill(
        child: Image.asset(
          'assets/image/phone_profile.png', // ganti dengan path foto kamu
          fit: BoxFit.cover,
        ),
      ),

      // ── Overlay gelap supaya teks terbaca ──
      Positioned.fill(
        child: Container(
          color: Colors.black.withOpacity(0.35),
        ),
      ),

      // ── Konten jam & lock ──
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
                letterSpacing: -1,
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
            const SizedBox(height: 16),
            const Icon(Icons.lock_outline, color: Colors.white54, size: 22),
          ],
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
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: AppColor.yellowgreen,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            '— Reyhan Septri Asta',
            style: AppFontStyle.smallText,
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
                _codeText("// ══════════════════", AppColor.grey2),
                _codeText("// Reyhan Septri Asta", AppColor.grey2),
                _codeText("// Flutter Mobile Developer · 3 Years", AppColor.grey2),
                _codeText("// Currently @ CKL Cargo", AppColor.grey2),
                _codeText("// ══════════════════", AppColor.grey2),
                _codeText("// I build intuitive mobile experiences", AppColor.grey2),
                _codeText("// using Flutter. Passionate about clean", AppColor.grey2),
                _codeText("// architecture, smooth UX, and code", AppColor.grey2),
                _codeText("// that scales.", AppColor.grey2),
                _codeText("// ══════════════════", AppColor.grey2),
                SizedBox(height: context.height*0.02,),
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

// import 'package:flutter/material.dart';
// import 'package:flutter_portofolio/item/app_colors.dart';
// import 'package:flutter_portofolio/item/app_fonts.dart';
// import 'package:flutter_portofolio/item/media_query.dart';

// class PhoneWidget extends StatefulWidget {
//   const PhoneWidget({super.key});

//   @override
//   State<PhoneWidget> createState() => _PhoneWidgetState();
// }

// class _PhoneWidgetState extends State<PhoneWidget>
//     with TickerProviderStateMixin {

//   bool isHovered = false;
//   Offset cursor = Offset.zero;


//   bool showWelcome = true;
//   bool startFadeOut = false;
//   String displayedText = '';
//   late AnimationController _welcomeFadeController;
//   late Animation<double> _welcomeFade;
//   late Animation<double> _welcomeScale;

//   final String welcomeText = ' Welcome';

//   late AnimationController _slideController;
//   late Animation<Offset> _slideOut;
//   late Animation<Offset> _slideIn;
//   late Animation<double> _fadeOut;
//   late Animation<double> _fadeIn;

//   // Cursor blink
//   late AnimationController _blinkController;
//   late Animation<double> _blink;

//   @override
//     void initState() {
//       super.initState();
//       _slideController = AnimationController(
//         duration: const Duration(milliseconds: 400),
//         vsync: this,
//       );
//       _slideOut = Tween<Offset>(
//         begin: Offset.zero,
//         end: const Offset(0, -0.3),
//       ).animate(
//         CurvedAnimation(
//           parent: _slideController,
//           curve: Curves.easeInOut,
//         ),
//       );

//       _slideIn = Tween<Offset>(
//         begin: const Offset(0, 0.3),
//         end: Offset.zero,
//       ).animate(
//         CurvedAnimation(
//           parent: _slideController,
//           curve: Curves.easeInOut,
//         ),
//       );

//       _fadeOut = Tween<double>(
//         begin: 1,
//         end: 0,
//       ).animate(
//         CurvedAnimation(
//           parent: _slideController,
//           curve: const Interval(0.0, 0.5),
//         ),
//       );

//       _fadeIn = Tween<double>(
//         begin: 0,
//         end: 1,
//       ).animate(
//         CurvedAnimation(
//           parent: _slideController,
//           curve: const Interval(0.5, 1.0),
//         ),
//       );
//       // FIRST INIT CONTROLLER
//       _welcomeFadeController = AnimationController(
//         vsync: this,
//         duration: const Duration(milliseconds: 800),
//       );

//       // THEN USE IT
//       _welcomeFade = Tween<double>(
//         begin: 1,
//         end: 0,
//       ).animate(
//         CurvedAnimation(
//           parent: _welcomeFadeController,
//           curve: Curves.easeInOut,
//         ),
//       );

//       _welcomeScale = Tween<double>(
//         begin: 1,
//         end: 0.96,
//       ).animate(
//         CurvedAnimation(
//           parent: _welcomeFadeController,
//           curve: Curves.easeInOut,
//         ),
//       );

//       _blinkController = AnimationController(
//         duration: const Duration(milliseconds: 800),
//         vsync: this,
//       )..repeat(reverse: true);

//       _blink = Tween<double>(
//         begin: 1,
//         end: 0,
//       ).animate(_blinkController);

//       _startWelcomeTyping();
//     }

//   Future<void> _startWelcomeTyping() async {

//   displayedText = '';

//   for (int i = 0; i < welcomeText.length; i++) {

//     await Future.delayed(
//       const Duration(milliseconds: 180),
//     );

//     if (!mounted) return;

//     setState(() {
//       displayedText += welcomeText[i];
//     });
//   }

//   // Wait after finished typing
//   await Future.delayed(
//     const Duration(milliseconds: 900),
//   );

//   if (!mounted) return;

//   setState(() {
//     startFadeOut = true;
//   });

//   // Start fade animation
//   await _welcomeFadeController.forward();

//   if (!mounted) return;

//   setState(() {
//     showWelcome = false;
//   });
// }

//   @override
//   void dispose() {
//     _slideController.dispose();
//     _welcomeFadeController.dispose();
//     _blinkController.dispose();
//     super.dispose();
//   }

//   void _onHover(bool val) {
//     setState(() => isHovered = val);

//     if (val) {
//       _slideController.forward();
//     } else {
//       _slideController.reverse();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       cursor: SystemMouseCursors.none,
//       onHover: (e) => setState(() => cursor = e.localPosition),
//       onEnter: (_) => _onHover(true),
//       onExit: (_) => _onHover(false),
//       child: Stack(
//         clipBehavior: Clip.none,
//         children: [

//           // Phone
//           AnimatedContainer(
//             duration: const Duration(milliseconds: 400),
//             curve: Curves.elasticOut,
//             transform: isHovered
//                 ? (Matrix4.identity()
//                   ..translate(0.0, -12.0)
//                   ..rotateZ(-0.03))
//                 : Matrix4.identity(),
//             child: _buildPhone(context),
//           ),

//           // Custom cursor
//           AnimatedPositioned(
//             duration: const Duration(milliseconds: 60),
//             curve: Curves.easeOut,
//             left: cursor.dx - (isHovered ? 40 : 0),
//             top: cursor.dy - (isHovered ? 40 : 0),
//             child: IgnorePointer(
//               child: AnimatedContainer(
//                 duration: const Duration(milliseconds: 300),
//                 width: isHovered ? 80 : 0,
//                 height: isHovered ? 80 : 0,
//                 decoration: BoxDecoration(
//                   color: isHovered
//                       ? AppColor.yellowgreen.withValues(alpha:0.15)
//                       : Colors.transparent,
//                   border: Border.all(
//                     color: AppColor.yellowgreen,
//                     width: 1.5,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildPhone(BuildContext context) {
//     return Container(
//       width: context.height * 0.4,
//       height: context.height * 0.75,
//       decoration: BoxDecoration(
//         color: Colors.black,
//         borderRadius: BorderRadius.circular(36),
//         border: Border.all(
//           color: Colors.white24,
//           width: 6,
//         ),
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(30),
//         child: Stack(
//           children: [

//             // Background
//             Container(
//               color: const Color(0xFF0c0c0c),
//             ),

//             // Status bar
//             Positioned(
//               top: 8,
//               left: 16,
//               right: 16,
//               child: Row(
//                 mainAxisAlignment:
//                     MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     _currentTime(),
//                     style: const TextStyle(
//                       fontFamily: 'monospace',
//                       fontSize: 9,
//                       color: Colors.white38,
//                     ),
//                   ),
//                   const Row(
//                     children: [
//                       Icon(
//                         Icons.wifi,
//                         size: 10,
//                         color: Colors.white24,
//                       ),
//                       SizedBox(width: 3),
//                       Icon(
//                         Icons.battery_full,
//                         size: 10,
//                         color: Colors.white24,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),

//             // Notch
//             Positioned(
//               top: 0,
//               left: 0,
//               right: 0,
//               child: Center(
//                 child: Container(
//                   width: 60,
//                   height: 16,
//                   decoration: const BoxDecoration(
//                     color: Colors.black,
//                     borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(12),
//                       bottomRight: Radius.circular(12),
//                     ),
//                   ),
//                 ),
//               ),
//             ),

//             // Welcome / Lock Screen
//             Center(
//               child: AnimatedSwitcher(
//                 duration: const Duration(milliseconds: 700),
//                 switchInCurve: Curves.easeOut,
//                 switchOutCurve: Curves.easeIn,
//                 transitionBuilder: (child, animation) {
//                   return FadeTransition(
//                     opacity: animation,
//                     child: SlideTransition(
//                       position: Tween<Offset>(
//                         begin: const Offset(0, 0.08),
//                         end: Offset.zero,
//                       ).animate(animation),
//                       child: child,
//                     ),
//                   );
//                 },
//                 child: showWelcome
//                     ? _buildWelcomeScreen()
//                     : FadeTransition(
//                         opacity: _fadeOut,
//                         child: SlideTransition(
//                           position: _slideOut,
//                           child: _buildIdleScreen(),
//                         ),
//                       ),
//               ),
//             ),

//             // Hover screen
//             Center(
//               child: FadeTransition(
//                 opacity: _fadeIn,
//                 child: SlideTransition(
//                   position: _slideIn,
//                   child: _buildHoverScreen(),
//                 ),
//               ),
//             ),

//             // Home bar
//             Positioned(
//               bottom: 6,
//               left: 0,
//               right: 0,
//               child: Center(
//                 child: Container(
//                   width: 48,
//                   height: 4,
//                   decoration: BoxDecoration(
//                     color: Colors.white24,
//                     borderRadius: BorderRadius.circular(2),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // ─────────────────────────────────────────
//   // Welcome screen
//   // ─────────────────────────────────────────
//   Widget _buildWelcomeScreen() {
//     return FadeTransition(
//       opacity: _welcomeFade,
//       child: ScaleTransition(
//         scale: _welcomeScale,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [

//             AnimatedSwitcher(
//               duration: const Duration(milliseconds: 120),
//               child: Text(
//                 displayedText,
//                 key: ValueKey(displayedText),
//                 style: const TextStyle(
//                   fontFamily: 'monospace',
//                   fontSize: 32,
//                   fontWeight: FontWeight.w600,
//                   color: AppColor.yellowgreen,
//                   letterSpacing: 2,
//                 ),
//               ),
//             ),

//             const SizedBox(height: 12),

//             AnimatedBuilder(
//               animation: _blink,
//               builder: (_, __) {
//                 return Opacity(
//                   opacity: _blink.value,
//                   child: Container(
//                     width: 14,
//                     height: 2,
//                     color: AppColor.yellowgreen,
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
  

//   Widget _buildIdleScreen() {
//   return Stack(
//     key: const ValueKey('lockscreen'),
//     children: [

//       // Wallpaper
//       Positioned.fill(
//         child: Image.asset(
//           'assets/image/phone_profile.png',
//           fit: BoxFit.cover,
//         ),
//       ),

//       // Dark overlay
//       Positioned.fill(
//         child: Container(
//           color: Colors.black.withValues(alpha:0.35),
//         ),
//       ),

//       // Content
//       Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [

//             // Time
//             Text(
//               _currentTime(),
//               style: const TextStyle(
//                 fontFamily: 'monospace',
//                 fontSize: 42,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.white,
//                 letterSpacing: -1,
//               ),
//             ),

//             const SizedBox(height: 4),

//             // Date
//             Text(
//               _currentDate(),
//               style: const TextStyle(
//                 fontFamily: 'monospace',
//                 fontSize: 11,
//                 color: Colors.white70,
//                 letterSpacing: 2,
//               ),
//             ),

//             const SizedBox(height: 20),

//             // Lock icon
//             const Icon(
//               Icons.lock_outline,
//               color: Colors.white54,
//               size: 22,
//             ),

//             const SizedBox(height: 30),

//             // Swipe hint
//             Container(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 14,
//                 vertical: 6,
//               ),
//               decoration: BoxDecoration(
//                 color: Colors.white.withValues(alpha:0.08),
//                 borderRadius: BorderRadius.circular(30),
//                 border: Border.all(
//                   color: Colors.white12,
//                 ),
//               ),
//               child: const Text(
//                 'Hover to unlock',
//                 style: TextStyle(
//                   fontFamily: 'monospace',
//                   fontSize: 10,
//                   color: Colors.white60,
//                   letterSpacing: 1.2,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ],
//   );
// }

//   Widget _buildHoverScreen() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Hello world
//           const Text(
//             'Hello, World!',
//             style: TextStyle(
//               fontFamily: 'monospace',
//               fontSize: 30,
//               fontWeight: FontWeight.bold,
//               color: AppColor.yellowgreen,
//               letterSpacing: 0.5,
//             ),
//           ),
//           const SizedBox(height: 2),
//           Text(
//             '— Reyhan Septri Asta',
//             style: AppFontStyle.smallText,
//             // style: TextStyle(
//             //   fontFamily: 'monospace',
//             //   fontSize: 19,
//             //   color: Colors.white38,
//             // ),
//           ),
//           const SizedBox(height: 12),
//           // Code snippet
//           Container(
//             padding: const EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               color: Colors.white.withValues(alpha: 0.04),
//               borderRadius: BorderRadius.circular(8),
//               border: Border.all(color: Colors.white10),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 _codeText("// ══════════════════", AppColor.grey2),
//                 _codeText("// Reyhan Septri Asta", AppColor.grey2),
//                 _codeText("// Flutter Mobile Developer · 3 Years", AppColor.grey2),
//                 _codeText("// Currently @ CKL Cargo", AppColor.grey2),
//                 _codeText("// ══════════════════", AppColor.grey2),
//                 _codeText("// I build intuitive mobile experiences", AppColor.grey2),
//                 _codeText("// using Flutter. Passionate about clean", AppColor.grey2),
//                 _codeText("// architecture, smooth UX, and code", AppColor.grey2),
//                 _codeText("// that scales.", AppColor.grey2),
//                 _codeText("// ══════════════════", AppColor.grey2),
//                 SizedBox(height: context.height*0.02,),
//                 _codeLine('void', ' main() {', null),
//                 _codeLine(null, '  runApp(', null),
//                 _codeLine(null, '    ', 'MyApp()'),
//                 _codeLine(null, '  );', null),
//                 Row(
//                   children: [
//                     _codeText('}', null),
//                     // Blinking cursor
//                     AnimatedBuilder(
//                       animation: _blink,
//                       builder: (_, __) => Opacity(
//                         opacity: _blink.value,
//                         child: Container(
//                           width: 6,
//                           height: 12,
//                           margin: const EdgeInsets.only(left: 2),
//                           color: AppColor.yellowgreen,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _codeLine(String? keyword, String? normal, String? highlight) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 2),
//       child: Row(
//         children: [
//           if (keyword != null)
//             Text(keyword,
//                 style: const TextStyle(
//                     fontFamily: 'monospace',
//                     fontSize: 13,
//                     color: Color(0xFFc792ea))),
//           if (normal != null)
//             Text(normal,
//                 style: const TextStyle(
//                     fontFamily: 'monospace',
//                     fontSize: 13,
//                     color: Colors.white54)),
//           if (highlight != null)
//             Text(highlight,
//                 style: const TextStyle(
//                     fontFamily: 'monospace',
//                     fontSize: 13,
//                     color: AppColor.yellowgreen)),
//         ],
//       ),
//     );
//   }

//    Widget _codeText(String text, Color? color) {
//     return Text(
//       text,
//       style: TextStyle(
//         fontFamily: 'monospace',
//         fontSize: 13,
//         color: color ?? Colors.white54,
//       ),
//     );
//   }
// String _currentTime() {
//     final now = DateTime.now();
//     return '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';
//   }

//   String _currentDate() {
//     const days = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];
//     const months = ['JAN','FEB','MAR','APR','MAY','JUN','JUL','AUG','SEP','OCT','NOV','DEC'];
//     final now = DateTime.now();
//     return '${days[now.weekday - 1]}, ${months[now.month - 1]} ${now.day}';
//   }
// }




