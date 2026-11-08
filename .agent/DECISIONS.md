# Decisions

## 2026-10-30 — Initial memory baseline

- Keep engineering memory in `.agent/`; no existing agent instructions or equivalent architecture/task memory were found in the inspected repository or ancestor instruction paths.
- Retain README as the human-facing setup guide. Reuse root `CHANGELOG.md` for meaningful change history instead of creating a second changelog.
- Describe current source including pre-existing changes, with provenance recorded in `CURRENT_TASK.md`. No application, dependency, test, hosting or SDK changes are authorized by the initial-analysis task.
- Preserve the widget-led architecture and existing catalog/JSON patterns for future work unless a concrete task warrants change. Declared packages do not establish that an integration is implemented.

## 2026-10-30 — Initial startup optimization

- Dismiss the loader on actual first frame, retaining its visual design and a short fade. Do not replace actual readiness with an arbitrary one-second timeout or count synthetic progress as a speed measurement.
- Bundle exact startup font variants from the installed `google_fonts` metadata, verifying SHA-256/length and preserving OFL licenses. Existing GoogleFonts calls automatically detect these assets, preserving typography.
- Defer only detail route code and preserve existing route/data interfaces. Retry handles chunk download failures; initial shells were not rewritten.
- GitHub Pages now uses `O4` and the tested `.fvmrc` SDK. Reading `.fvmrc` via `flutter-version-file` is supported by the [action's official documentation](https://github.com/subosito/flutter-action).
- Sub-second cold startup remains unproven without browser/network measurements. A first-frame performance mark is available; do not infer runtime timing from compilation success or single-file curl timings.

## 2026-10-30 — Phone frame selection

Superseded: user subsequently cancelled this feature. Picker, alternate shapes, controller, session adapters and feature tests were removed; the original default/hover/fullscreen widget is restored.

- Restore idle/hover content and remove the app launcher following the user's correction. Keep fullscreen and Hero behavior.
- Use sessionStorage with a shared ValueNotifier for tab-lifetime shape selection, including refresh, rather than shared_preferences/localStorage. Native/storage-disabled environments retain the current in-memory choice.
- Interpret the user's “iPhone Duo” as a conceptual two-screen shape; Samsung Flip is shown open with a hinge crease. Frame rendering reuses the original content at a fixed logical resolution to avoid overflow in small minimized variants. No new packages or fetched assets.
