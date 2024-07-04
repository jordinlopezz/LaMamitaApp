class Item {
  String id;
  String nombre;
  double precio;
  String unidad;
  String imagen;
  int cantidad;

  Item({
    required this.id,
    required this.nombre,
    required this.precio,
    required this.unidad,
    required this.imagen,
    required this.cantidad, // Se inicializa en el constructor
  });

  // Constructor que acepta un objeto dinámico y establece los valores
  Item.map(dynamic o)
      : id = o['id'],
        nombre = o['nombre'],
        precio = o['precio'],
        unidad = o['unidad'],
        imagen = o['imagen'],
        cantidad = o['cantidad']; // Se inicializa en el constructor

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map['id'];
    map['nombre'];
    map['precio'];
    map['unidad'];
    map['imagen'];
    map['cantidad'];
    return map;
  }

  // Método toJson para convertir un objeto Item a un mapa JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nombre'] = nombre;
    data['precio'] = precio;
    data['unidad'] = unidad;
    data['imagen'] = imagen;
    data['cantidad'] = cantidad;
    return data;
  }
}
