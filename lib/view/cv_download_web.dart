import 'package:web/web.dart' as web;

const _cvAssetPath = 'CV-Reyhan-Septri-Asta.pdf';

void downloadCv() {
  final url = Uri.parse(web.document.baseURI).resolve(_cvAssetPath);
  final link = web.HTMLAnchorElement()
    ..href = url.toString()
    ..download = 'CV-Reyhan Septri Asta.pdf';

  link.click();
}
