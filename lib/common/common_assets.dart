import 'dart:math';

class FCommonAssets {
  static const dreamShip1 = 'assets/images/dream_ship_1.jpg';
  static const dreamShip2 = 'assets/images/dream_ship_2.jpg';
  static const dreamShip3 = 'assets/images/dream_space_ship1.jpg';
  static const dreamShip4 = 'assets/images/dream_space_ship2.jpg';

  static const pexels1 = 'assets/images/pexels-1.jpg';
  static const pexels2 = 'assets/images/pexels-2.jpg';
  static const pexels3 = 'assets/images/pexels-3.jpg';
  static const pexels4 = 'assets/images/pexels-4.jpg';
  static const pexels5 = 'assets/images/pexels-5.jpg';
  static const pexels6 = 'assets/images/pexels-6.jpg';
  static const pexels7 = 'assets/images/pexels-7.jpg';
  static const pexels8 = 'assets/images/pexels-8.jpg';
  static const pexels9 = 'assets/images/pexels-9.jpg';
  static const pexels10 = 'assets/images/pexels-10.jpg';
  static const pexels11 = 'assets/images/pexels-11.jpg';
  static const pexels12 = 'assets/images/pexels-12.jpg';
  static const pexels13 = 'assets/images/pexels-13.jpg';
  static const pexels14 = 'assets/images/pexels-14.jpg';
  static const pexels15 = 'assets/images/pexels-15.jpg';
  static const pexels16 = 'assets/images/pexels-16.jpg';
  static const pexels17 = 'assets/images/pexels-17.jpg';
  static const pexels18 = 'assets/images/pexels-18.jpg';
  static const pexels19 = 'assets/images/pexels-19.jpg';
  static const pexels20 = 'assets/images/pexels-20.jpg';
  static const pexels21 = 'assets/images/pexels-21.jpg';
  static const pexels22 = 'assets/images/pexels-22.jpg';
  static const pexels23 = 'assets/images/pexels-23.jpg';
  static const pexels24 = 'assets/images/pexels-24.jpg';
  static const pexels25 = 'assets/images/pexels-25.jpg';
  static const pexels26 = 'assets/images/pexels-26.jpg';
  static const pexels27 = 'assets/images/pexels-27.jpg';

  static String randomImageAssets() {
    const images = [
      pexels1,
      pexels2,
      pexels3,
      pexels4,
      pexels5,
      pexels6,
      pexels7,
      pexels8,
      pexels9,
      pexels10,
      pexels11,
      pexels12,
      pexels13,
      pexels14,
      pexels15,
      pexels16,
      pexels17,
      pexels18,
      pexels19,
      pexels20,
      pexels21,
      pexels22,
      pexels23,
      pexels24,
      pexels25,
      pexels26,
      pexels27,
    ];

    Random random = Random();
    final index = random.nextInt(images.length);

    return images[index];
  }
}
