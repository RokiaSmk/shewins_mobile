enum FoodCategory {
  cereal,
  rootAndTuber,
  legume,
  fruit,
  protein,
  dairy,
  beverage,
  sweet,
  localDish,
  fastFood,
  other;

  String get apiValue {
    switch (this) {
      case FoodCategory.cereal:
        return "CEREAL";
      case FoodCategory.rootAndTuber:
        return "ROOT_AND_TUBER";
      case FoodCategory.legume:
        return "LEGUME";
      case FoodCategory.fruit:
        return "FRUIT";
      case FoodCategory.protein:
        return "PROTEIN";
      case FoodCategory.dairy:
        return "DAIRY";
      case FoodCategory.beverage:
        return "BEVERAGE";
      case FoodCategory.sweet:
        return "SWEET";
      case FoodCategory.localDish:
        return "LOCAL_DISH";
      case FoodCategory.fastFood:
        return "FAST_FOOD";
      case FoodCategory.other:
        return "OTHER";
    }
  }

  static FoodCategory fromJson(String value) {
    return FoodCategory.values.firstWhere(
      (e) => e.apiValue == value,
    );
  }

  String get label {
    switch (this) {
      case FoodCategory.cereal:
        return "Céréales";
      case FoodCategory.rootAndTuber:
        return "Racines & tubercules";
      case FoodCategory.legume:
        return "Légumineuses";
      case FoodCategory.fruit:
        return "Fruits";
      case FoodCategory.protein:
        return "Protéines";
      case FoodCategory.dairy:
        return "Produits laitiers";
      case FoodCategory.beverage:
        return "Boissons";
      case FoodCategory.sweet:
        return "Sucreries";
      case FoodCategory.localDish:
        return "Plats locaux";
      case FoodCategory.fastFood:
        return "Fast-food";
      case FoodCategory.other:
        return "Autres";
    }
  }
}