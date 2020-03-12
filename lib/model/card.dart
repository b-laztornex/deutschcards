class CardItem {
  String infinitiv;
  String presens;
  String preteritum;
  String partizip;
  String type;
  String meaning;
  String translation;
  String image;

  CardItem(this.infinitiv, this.presens, this.preteritum, this.partizip, this.type, this.meaning, this.translation, this.image);

  @override
  String toString() {
    return '{ ${this.infinitiv}, ${this.presens} }';
  }
}