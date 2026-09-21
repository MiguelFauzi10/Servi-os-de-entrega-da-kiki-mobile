import 'package:url_launcher/url_launcher.dart';

class AvaliacaoService {
  static Future<void> abrirLinkAdoroCinema() async {
    final url = Uri.parse(
      'https://www.adorocinema.com/filmes/filme-40137/criticas/espectadores/',
    );

    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );
    }
  }
}