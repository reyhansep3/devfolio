# Architecture

## Startup and navigation

`lib/main.dart` creates a module-level GoRouter and cached blog-loading future. `main()` enables URL reflection for imperative navigation and runs `MyApp`. `MaterialApp.router` applies the shared theme and wraps routed content in `PortfolioCursor`.

Routes: `/` home; `/home` redirects to `/`; `/formalities`, `/project`, `/blog` select sections of `Homepage`; `/project/:slug` looks up `ProjectCatalog`; `/blog/:id` waits for bundled blog data. Missing detail records show a return action. Unknown routes render the home section. Trailing slashes are normalized. The pre-existing working tree adds `/phone-preview` with a fade transition and Hero animation.

Project/blog detail libraries now use Dart deferred imports in main. `DeferredPage` caches the load future across rebuilds, shows a loading scaffold, and offers retry for a failed chunk download. Existing list pages and responsive shells are still part of the entry bundle.

`Homepage` selects desktop/tablet/mobile shells through `Responsivelayout`. Shells compose sections and navigation; desktop/tablet use scroll controllers and footer-triggered bottom-to-top navigation effects. Mobile uses an app bar and drawer. These shells contain related implementations rather than a single centralized page composition.

## State and data flow

- State is primarily local widget state, animation controllers, scroll controllers, and futures/FutureBuilder. No repository/service/controller backend layer or DI container was found in `lib/`.
- `ProjectCatalog.projects` stores typed `ProjectShowcaseData`, including preview widgets, links, images and detail content. Lists and detail routes share this catalog.
- `loadBlogs()` reads `assets/json/blog.json`, accepts a list or a `blog` wrapper, and deduplicates by title/subtitle/sections. Main routing caches its future; the current blog page also loads through this helper. Older dimension-specific dashboards contain their own JSON-loading implementations; verify actual call sites before editing them.
- `ExperienceLocalDatasource.getExperience()` loads bundled `experience.json` and maps records to `ExperienceModel`; this is local data access.
- No HTTP API client or backend integration was found. External destinations use `url_launcher`; contact actions include mail/social links. Portfolio text describing backend skills is not an implementation dependency.

## Shared presentation and platform boundaries

- `item/app_colors.dart` and `item/app_fonts.dart` define shared styling; `animation/` contains reusable scroll reveal/entrance and project previews.
- `ScrollReveal` reveals once as content approaches the viewport and honors disabled animations; it avoids continuously mapping animation progress to scroll offset.
- Home hero copy/phone composition lives in `home_intro_sections.dart`. `phone_widget.dart` shows the original idle clock/notification and code revealed on hover. The project app launcher and subsequent shape-picker/session-storage feature were both reverted at the user's request. Only the original default frame remains; wallpaper, Hero and fullscreen page are retained. No phone preference or tab state is read or written.
- `ResumeActions` shares a single filled RESUME button across desktop/tablet/mobile navigation. It is the former FULL CV action renamed and still calls `seeCv`; the separate resume button was removed. `cv_download.dart` conditionally exports web versus unsupported native implementations using `dart.library.html`. Web actions resolve PDF URLs against `document.baseURI` and open a new tab.
- `core/media_query.dart` and `item/media_query.dart` both define the same named viewport extension. Preserve import boundaries until a dedicated cleanup is authorized.

These notes describe inspected source, including uncommitted work; they do not establish runtime or deployment compatibility.
