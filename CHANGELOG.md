# Changelog

## 2026-10-30

- Replaced all 46 Space Mono style calls with primary Poppins across home, projects, blog, formalities and cursor. Startup preload and offline-font validation now target Poppins.
- Reverted the phone shape picker and tab preference at the user's request; restored the original default phone frame with hover content and fullscreen. Removed feature-specific state/storage files and tests.
- Restored the phone's original idle/hover content at the user's request and removed the app launcher. Added fullscreen-only Default/Duo/Flip frame selection, synchronized to the minimized widget and retained through tab sessionStorage. Added selection, session-model and hover regression coverage.
- Turned the home phone screen into a scrollable project app launcher using the shared ProjectCatalog. Each tile opens its matching project detail and supports Back; phone frame, wallpaper, status bar, Hero transition and fullscreen control remain.
- Revamped home About Me with the supplied “I build things that make life easier.” headline and Understand/Create/Evolve principles. Desktop pairs the retained phone on the left with copy on the right; compact layout stays stacked.
- Removed the loader's synthetic minimum wait; the first Flutter frame now triggers a 120 ms fade and records a browser performance mark.
- Bundled six startup font variants with licenses, preloaded hero fonts, and added renderer/font CDN preconnections.
- Deferred blog/project detail route code with failed-download retry. GitHub Pages builds use O4 and the shared FVM SDK pin.
- Added loader timing, deferred-page loading/retry and offline startup-font regression checks.
- Established `.agent/` project context, architecture, file index, decisions and initial task checkpoint from repository inspection.
- Recorded pre-existing application changes and source-level validation concerns. Application functionality was not modified; runtime checks were not run for this documentation-only task.
