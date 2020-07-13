enum Gender {
  MALE, FEMALE
}

class Perfume {

  String name;
  String brand;
  String description;
  Gender gender;
  double price;
  double discount;
  List<String> images;
  bool favorite;

  Perfume(this.name, this.brand, this.description, this.gender, this.price, this.discount, this.images, this.favorite);

}

List<Perfume> getPerfumeList(){
  return <Perfume>[
    Perfume(
      "The One",
      "Dolce & Gabbana", 
      "Eau De Toilette 100ml Spray",
      Gender.MALE,
      75.50,
      0,
      [
        "assets/images/the_one_0.png",
        "assets/images/the_one_1.png",
      ],
      false,
    ),
    Perfume(
      "Olympéa",
      "Paco Rabanne", 
      "Eau De Parfum 80ml Spray",
      Gender.MALE,
      69.00,
      0,
      [
        "assets/images/olympea_0.png",
      ],
      false,
    ),
    Perfume(
      "1 Million For Men",
      "Paco Rabanne", 
      "Eau De Toilette 200ml Spray",
      Gender.MALE,
      80.00,
      10,
      [
        "assets/images/one_million_for_men_0.png",
        "assets/images/one_million_for_men_1.png",
      ],
      false,
    ),
    Perfume(
      "Alien",
      "Mugler", 
      "Eau De Parfum 60ml Refillable Spray",
      Gender.FEMALE,
      77.50,
      0,
      [
        "assets/images/alien_0.png",
        "assets/images/alien_1.png",
      ],
      false,
    ),
    Perfume(
      "Le Male",
      "Jean Paul Gaultier", 
      "Eau De Toilette 125ml Spray",
      Gender.MALE,
      60.00,
      30,
      [
        "assets/images/le_male_0.png",
      ],
      false,
    ),
    Perfume(
      "Invictus",
      "Paco Rabanne", 
      "Eau De Toilette 150ml Spray",
      Gender.MALE,
      72.00,
      0,
      [
        "assets/images/invictus_0.png",
        "assets/images/invictus_1.png",
      ],
      false,
    ),
    Perfume(
      "Miss Dior",
      "Dior", 
      "Eau De Parfum 50ml Spray",
      Gender.FEMALE,
      77.50,
      0,
      [
        "assets/images/miss_dior_0.png",
        "assets/images/miss_dior_1.png",
        "assets/images/miss_dior_2.png",
      ],
      false,
    ),
    Perfume(
      "Premiere",
      "Gucci", 
      "Eau De Toilette 100ml Spray",
      Gender.MALE,
      73.50,
      20,
      [
        "assets/images/gucci_0.png",
        "assets/images/gucci_1.png",
      ],
      false,
    ),
    Perfume(
      "N°5",
      "Channel", 
      "Eau De Toilette 60ml Spray",
      Gender.FEMALE,
      74.50,
      10,
      [
        "assets/images/number_5_0.png",
        "assets/images/number_5_1.png",
      ],
      false,
    ),
    Perfume(
      "Acqua Di Gio",
      "Armani", 
      "Acqua di Gio Profumo 125ml EDP",
      Gender.MALE,
      92.50,
      0,
      [
        "assets/images/acqua_de_gio_0.png",
        "assets/images/acqua_de_gio_1.png",
      ],
      false,
    ),
    Perfume(
      "J'Adore",
      "Dior", 
      "Eau De Parfum 50ml Spray",
      Gender.FEMALE,
      77.50,
      10,
      [
        "assets/images/j_adore_0.png",
        "assets/images/j_adore_1.png",
        "assets/images/j_adore_2.png",
      ],
      false,
    ),
    Perfume(
      "Coco",
      "Channel", 
      "Eau De Parfum 50ml Spray",
      Gender.FEMALE,
      42.50,
      40,
      [
        "assets/images/coco_0.png",
        "assets/images/coco_1.png",
        "assets/images/coco_2.png",
      ],
      false,
    ),
    Perfume(
      "Amouage",
      "Lyric", 
      "Eau De Parfum 100ml Spray",
      Gender.FEMALE,
      87.00,
      0,
      [
        "assets/images/amouage_0.png",
      ],
      false,
    ),
    Perfume(
      "Donna",
      "Valentino", 
      "Eau De Parfum 50ml Spray",
      Gender.FEMALE,
      62.00,
      0,
      [
        "assets/images/valentino_0.png",
      ],
      false,
    ),
    Perfume(
      "La Vie Est Belle",
      "Lancome", 
      "Eau De Parfum 100ml Spray",
      Gender.FEMALE,
      96.50,
      10,
      [
        "assets/images/la_vie_est_belle_0.png",
      ],
      false,
    ),
    Perfume(
      "Angel",
      "Thierry Mugler", 
      "Eau De Parfum 100ml Spray",
      Gender.MALE,
      116.50,
      10,
      [
        "assets/images/angel_0.png",
        "assets/images/angel_1.png",
      ],
      false,
    ),
  ];
}

class Filter {

  String name;
  bool selected;

  Filter(this.name, this.selected);

}

List<Filter> getFilterList(){
  return <Filter>[
    Filter(
      "FLORAL",
      false,
    ),
    Filter(
      "WARM & SPICY",
      false,
    ),
    Filter(
      "ORIENTAL",
      false,
    ),
    Filter(
      "WOODY",
      false,
    ),
    Filter(
      "FRESH",
      false,
    ),
    Filter(
      "MAN",
      false,
    ),
    Filter(
      "WOMAN",
      false,
    ),
  ];
}