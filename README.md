# Devfolio

Portofolio Reyhan Septri Asta yang dibuat dengan Flutter Web.

## Menjalankan secara lokal

```sh
flutter pub get
flutter run -d chrome
```

## GitHub Pages

Workflow [Deploy Flutter Web](.github/workflows/deploy-pages.yml) membangun aplikasi dari branch `main` dan menerbitkan isi `build/web` ke [GitHub Pages](https://reyhansep3.github.io/devfolio/).

Di pengaturan repository, buka **Settings → Pages → Build and deployment** lalu pilih **GitHub Actions** sebagai sumber. Setelah perubahan ini masuk ke `main`, workflow akan berjalan otomatis. Workflow juga dapat dijalankan lewat tab **Actions**.
