# Important file index

| Location | Responsibility / relationships |
| --- | --- |
| `lib/main.dart` | Entry point, theme, GoRouter, blog detail loading, cursor wrapper. |
| `lib/view/pages/home/home_page.dart` | Section scaffold and responsive shell selection. |
| `lib/view/responsive_layout.dart` | Layout builders and breakpoint helpers; helper mismatch noted in project context. |
| `lib/view/layouts/{desktop,tablet,mobile}/` | Section composition, scrolling and device navigation. |
| `lib/view/navigation_bar.dart` | Shared desktop/tablet navigation and resume actions. |
| `lib/view/resume_actions.dart` | Single shared RESUME button (renamed full-CV action calling seeCv). |
| `lib/view/deferred_page.dart` | Stable deferred route loading, pending state and failed-download retry. |
| `lib/view/cv_download{,_web,_stub}.dart` | Conditional PDF preview implementations. |
| `lib/view/portfolio_cursor.dart` | Custom cursor wrapping routed content. |
| `lib/view/pages/home/sections/` | Hero, about/skills, project showcase, contact and older blog sections. |
| `lib/view/pages/home/widgets/home_intro_sections.dart` | Shared home intro/portrait/phone composition. |
| `lib/view/pages/home/widgets/phone_widget.dart` | Original idle/hover phone demo, default frame, fullscreen and Hero. |
| `lib/view/pages/projects/project_data.dart` | ProjectShowcaseData and ProjectCatalog, shared by lists/details. |
| `lib/view/pages/projects/project_screen.dart` | Current project archive and cards. |
| `lib/view/pages/projects/project_detail_page.dart` | Project content and external destination actions. |
| `lib/view/pages/blog/{blog_data,blog_page,detail_blog}.dart` | JSON loading/deduplication, archive and article UI. |
| `lib/view/pages/formalities/sections/` | About/stories, skills, education, experience and motivation sections. |
| `lib/data/datasource/experience_local_datasource.dart` | Bundled experience JSON loader. |
| `lib/data/datasource/model/experience_model.dart` | Experience serialization/copy model. |
| `lib/data/skills_model.dart` | Skill content/model definitions. |
| `lib/item/` | Colors, typography, shared items and viewport extension. |
| `lib/core/` | Project link constants and another viewport extension. |
| `lib/animation/` | ScrollReveal, EntranceFader and animated project previews. |
| `assets/{json,image,icons,fonts}/` | Local portfolio content and visuals. |
| `web/index.html` | Flutter bootstrap host, metadata, loading screen and cursor CSS. |
| `web/*Reyhan-Septri-Asta.pdf` | Full CV and resume served as static web files. |
| `scripts/generate_resume.py` | Pre-existing untracked ReportLab resume generator. |
| `test/project_navigation_test.dart` | Project detail return navigation at mobile/desktop sizes. |
| `test/scroll_reveal_test.dart` | Reveal progress survives further scrolling. |
| `test/{deferred_page,startup_fonts}_test.dart` | Deferred route load/retry and bundled startup fonts with network fetching disabled. |
| `scripts/test_web_loader.cjs` | Runs the actual inline loader with a deterministic clock; fast/slow first-frame regression checks. |
| `test/{resume_navigation,phone_widget_fullscreen}_test.dart` | Pre-existing untracked responsive action/fullscreen navigation tests. |
| `test/widget_test.dart` | Stale starter counter test. |
| `pubspec.yaml`, `pubspec.lock` | Dart constraints, packages, Flutter assets/font declarations and resolved dependencies. |
| `.fvmrc`, `README.md` | Local SDK pin and development/deployment instructions. |
| `.github/workflows/deploy-pages.yml`, `netlify.toml` | Separate GitHub Pages and Netlify web build/hosting configurations. |
| `android/`, `ios/`, `macos/`, `linux/`, `windows/` | Native runner scaffolds/configuration; not validated in initial analysis. |
