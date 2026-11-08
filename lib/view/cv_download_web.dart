import 'package:web/web.dart' as web;

const _cvAssetPath = 'CV-Reyhan-Septri-Asta.pdf';
const _resumeAssetPath = 'Resume-Reyhan-Septri-Asta.pdf';

void seeCv() {
  final url = Uri.parse(web.document.baseURI).resolve(_cvAssetPath);
  final link = web.HTMLAnchorElement()
    ..href = url.toString()
    ..target = '_blank'
    ..rel = 'noopener noreferrer';

  link.click();
}

void seeResume() {
  final url = Uri.parse(web.document.baseURI).resolve(_resumeAssetPath);
  final link = web.HTMLAnchorElement()
    ..href = url.toString()
    ..target = '_blank'
    ..rel = 'noopener noreferrer';

  link.click();
}
