class Color {
  final id;
  final String quoteColor;
  final String quoteHex;

  Color(this.id, this.quoteColor, this.quoteHex);

  Color.fromJson(Map<String, dynamic> json)
    :id = json['id'],
     quoteColor = json['color_name'],
     quoteHex = json['hex_value'];

}
