# Project context

Baseline inspected: 2026-10-30. Source and Git remain authoritative; inspect status/diffs before reusing these notes.

- Purpose: Reyhan Septri Asta's personal portfolio, primarily Flutter Web. Package: `flutter_portofolio`, version `1.0.0+1`.
- Stack: Dart SDK constraint `>=3.9.0 <4.0.0`; Flutter pinned to `3.44.5` in `.fvmrc` and README. Native platform scaffolds also exist for Android, iOS, macOS, Linux, and Windows; native behavior was not validated.
- Architecture: widget-led presentation, responsive page shells, static project catalog and bundled JSON content. See `ARCHITECTURE.md` and `FILE_INDEX.md`.
- Features: home introduction and phone demo, project archive/details, formalities/about/skills/experience, blog archive/details, contact links, CV/resume actions.
- Important packages: `go_router`, `google_fonts`, `url_launcher`, `web`, `flutter_svg`, animation and visual packages. `shared_preferences` is declared but no usage was found in `lib/`. No app-wide state-management or DI container was found.
- Conventions: package imports, shared colors/fonts, StatefulWidget state and animation controllers, device-specific section implementations. Analyzer includes `flutter_lints`.
- Primary UI font: Poppins. All 46 former Space Mono calls were replaced throughout active UI, including labels, metadata and cursor. Startup preloads Poppins Bold/Regular. Keep future UI typography aligned; the phone's code/clock monospace is a separate existing treatment.
- Assets: images, icons/stack, fonts, JSON in `assets/`; custom `vcr_osd_mono` font. PDFs are static files in `web/`, outside Flutter asset declarations.

## Commands

Use `.fvm/flutter_sdk/bin/flutter` for the pinned SDK (local symlink currently points outside the repository):

```sh
.fvm/flutter_sdk/bin/flutter pub get
.fvm/flutter_sdk/bin/flutter run -d chrome
.fvm/flutter_sdk/bin/flutter analyze
.fvm/flutter_sdk/bin/flutter test test/project_navigation_test.dart test/scroll_reveal_test.dart
.fvm/flutter_sdk/bin/flutter test test/resume_navigation_test.dart test/phone_widget_fullscreen_test.dart
.fvm/flutter_sdk/bin/flutter build web --release --base-href /devfolio/ --dart2js-optimization=O4
node --test scripts/test_web_loader.cjs
```

Commands above are references, not validation results. Initial analysis did not run Flutter commands.

## Deployment and constraints

- GitHub Pages workflow builds on `main` or manual dispatch, with `/devfolio/` base path and `O4`; it now reads the SDK pin from `.fvmrc`. No test/analyze step is configured there.
- `netlify.toml` separately configures a WASM release build, SPA fallback and caching. It sets attachment disposition for the full CV, which may override the current preview action's intent.
- `test/widget_test.dart` still asserts the starter counter behavior, which does not match `MyApp`; this is a source observation, not an executed failure.
- `Responsivelayout.build` selects mobile below 800, tablet 800–1023, desktop from 1024; `isMobile` instead checks <=500. Do not assume these APIs are equivalent.
- Existing application edits were present at initial inspection; see `CURRENT_TASK.md`. Do not attribute them to this analysis or discard them.
- Phone preview uses the original default frame and idle/hover code screens, with fullscreen/Hero navigation. Both the project app launcher and subsequent shape picker/tab persistence were reverted by request.
- Startup optimization: loader fades immediately on `flutter-first-frame` (120 ms transition, no artificial minimum), marks `portfolio-first-frame` for browser measurement, and preconnects renderer/font CDNs. Poppins 400/500/600/700 and Space Mono 400/700 are bundled with OFL licenses; two hero font files are preloaded. Other font families may still fetch remotely. Detail routes use deferred imports with retry handling; initial page shells remain eager.
