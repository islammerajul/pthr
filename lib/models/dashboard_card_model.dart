class Models {
  String? name;
  String? phn;

  Models(this.name, this.phn);

  static List<Models> modelItem() {
    return [
      Models("Total attendence", "20"),
      Models("Total absence", "2"),
      Models("Pending request", "0003"),
      Models("", "0004")
    ];
  }
}
