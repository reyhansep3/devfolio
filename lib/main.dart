import 'package:flutter/material.dart';
import 'package:flutter_portofolio/view/pages/home/home_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter _router = GoRouter(
  initialLocation: '/',
  redirect: (context, state) {
    final path = state.uri.path;
    if (path != '/' && path.endsWith('/')) {
      return path.substring(0, path.length - 1);
    }
    return null;
  },
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      name: 'home',
      pageBuilder: (context, state) => const NoTransitionPage(
        child: Homepage(section: 'home'),
      ),
    ),
    GoRoute(
      path: '/home',
      redirect: (context, state) => '/',
    ),
    GoRoute(
      path: '/formalities',
      name: 'formalities',
      pageBuilder: (context, state) => const NoTransitionPage(
        child: Homepage(section: 'formalities'),
      ),
    ),  
    GoRoute(
      path: '/project',
      name: 'project',
      pageBuilder: (context, state) => const NoTransitionPage(
        child: Homepage(section: 'project'),
      ),
    ),
    GoRoute(
      path: '/blog',
      name: 'blog',
      pageBuilder: (context, state) => const NoTransitionPage(
        child: Homepage(section: 'blog'),
      ),
    ),
  ],
  errorBuilder: (context, state) => const Homepage(section: 'home'),
);

void main() {
  runApp(const MyApp());
}

/// Tinggi "design" untuk viewport. Semua widget yang memakai
/// `context.height` / `MediaQuery...height` akan membaca nilai INI,
/// BUKAN tinggi window asli. Akibatnya: saat user me-resize browser
/// SECARA VERTIKAL, layout TIDAK menyesuaikan sama sekali (widget tetap
/// ukurannya). Resize HORIZONTAL tetap responsif (breakpoint + scaling).
///
/// Cara kerja:
///   - Jika window LEBIH PENDEK dari baseline -> tinggi di-lock ke baseline
///     (tidak menyusut, overflow ditangani oleh scroll).
///   - Jika window LEBIH TINGGI dari baseline -> mengikuti tinggi asli
///     (tidak ada "celah" kosong di bawah konten).
/// Kalau mau RESTRICT TOTAL (samsek tidak berubah, termasuk saat membesar),
/// ganti baris `lockedHeight` di bawah jadi konstanta `kDesignViewportHeight`.
const double kDesignViewportHeight = 900.0;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    // Floor: jangan biarkan tinggi turun di bawah baseline saat di-resize vertikal.
    final lockedHeight = mq.size.height < kDesignViewportHeight
        ? kDesignViewportHeight
        : mq.size.height;
    // Untuk RESTRICT TOTAL (vertikal sama sekali tidak berubah), pakai:
    // final lockedHeight = kDesignViewportHeight;
    return MediaQuery(
      data: mq.copyWith(size: Size(mq.size.width, lockedHeight)),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routerConfig: _router,
      ),
    );
  }
}