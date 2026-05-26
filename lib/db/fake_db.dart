import 'package:aula_913/domain/Propriedade.dart';

class FakeDatabase {
  static List listaPropriedades = [
    Propriedade(
      urlImagem:
          'https://afar.brightspotcdn.com/dims4/default/5e0f8f5/2147483647/strip/true/crop/5760x3056+0+0/resize/1440x764!/quality/90/?url=https%3A%2F%2Fk3-prod-afar-media.s3.us-west-2.amazonaws.com%2Fbrightspot%2F0e%2Fe0%2F2d5cbb2139b753c565850eda5611%2Foriginal-amsterdam-the-netherlands-canals-copy.jpg',
      local: 'Harligen, Netherlands',
      host: '18-23 Dec',
      dates: 'Professional Host',
      total: '\$1,065 total',
    ),
    Propriedade(
      urlImagem:
          'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/01/28/d5/c9/natural-pools-4-km-from.jpg',
      local: 'Maragogi, Brazil',
      host: 'Professional Host',
      dates: '10-23 Dec',
      total: '\$2,065 total',
    ),
    Propriedade(
      urlImagem:
          'https://www.topensandoemviajar.com/wp-content/uploads/2023/08/melhores-dicas-fazer-fortaleza-ceara.jpg',
      local: 'Fortaleza, Brazil',
      host: 'Professional Host',
      dates: '01-12 Jun',
      total: '\$1,200 total',
    ),
    Propriedade(
      urlImagem:
          'https://www.melhoresdestinos.com.br/wp-content/uploads/2019/02/passagens-aereas-paris-capa2019-02.jpg',
      local: 'Paris, FRA',
      host: 'Professional Host',
      dates: '01-12 Jun',
      total: '\$1,200 total',
    ),
  ];
}
