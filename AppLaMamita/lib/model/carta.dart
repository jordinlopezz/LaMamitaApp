class Carta {
  final int id;
  final String nombre;
  final double precio;
  final String imagen;
  final String descripcion;

  Carta({
    required this.id,
    required this.nombre,
    required this.precio,
    required this.imagen,
    required this.descripcion,
  });

  @override
  String toString() {
    return 'Carta{id: $id, nombre: $nombre, precio: $precio, imagen: $imagen, descripcion: $descripcion}';
  }
}

final List<Carta> comidas = [
  Carta(
    id: 1,
    nombre: 'Vigoron',
    precio: 70.00,
    imagen: 'assets/img/vigoron.png',
    descripcion: 'Delicioso plato típico con yuca y chicharrón.',
  ),
  Carta(
    id: 2,
    nombre: 'Quesillo',
    precio: 50.00,
    imagen: 'assets/img/quesillo.webp',
    descripcion: 'Tortilla con queso, crema y cebolla encurtida.',
  ),
  Carta(
    id: 3,
    nombre: 'Carne Asada',
    precio: 100.00,
    imagen: 'assets/img/carneasada.jpg',
    descripcion: 'Sabrosa carne asada servida con guarniciones.',
  ),
  Carta(
    id: 4,
    nombre: 'Enchilada',
    precio: 60.00,
    imagen: 'assets/img/enchilada.jpg',
    descripcion: 'Tortilla frita rellena de carne y cubierta con ensalada.',
  ),
];

final List<Carta> bebidas = [
  Carta(
    id: 5,
    nombre: 'Cacao',
    precio: 30.00,
    imagen: 'assets/img/cacao.jpg',
    descripcion: 'Refresco tradicional de cacao.',
  ),
  Carta(
    id: 6,
    nombre: 'Pinolillo',
    precio: 25.00,
    imagen: 'assets/img/pinolillo.jpg',
    descripcion: 'Bebida a base de maíz y cacao.',
  ),
  Carta(
    id: 7,
    nombre: 'Chicha de Maíz',
    precio: 20.00,
    imagen: 'assets/img/chicha_de_maiz.jpg',
    descripcion: 'Bebida fermentada de maíz.',
  ),
  Carta(
    id: 8,
    nombre: 'Tiste',
    precio: 25.00,
    imagen: 'assets/img/tiste.jpg',
    descripcion: 'Bebida a base de maíz tostado y cacao.',
  ),
];

final List<Carta> postres = [
  Carta(
    id: 9,
    nombre: 'Tres Leches',
    precio: 40.00,
    imagen: 'assets/img/tres_leches.jpg',
    descripcion: 'Pastel esponjoso bañado en tres tipos de leche.',
  ),
  Carta(
    id: 10,
    nombre: 'Pio Quinto',
    precio: 35.00,
    imagen: 'assets/img/pio_quinto.png',
    descripcion: 'Postre con ron, natilla y canela.',
  ),
  Carta(
    id: 11,
    nombre: 'Arroz con Leche',
    precio: 30.00,
    imagen: 'assets/img/arroz_con_leche.jpg',
    descripcion: 'Delicioso postre de arroz cocido en leche y canela.',
  ),
  Carta(
    id: 12,
    nombre: 'Buñuelos',
    precio: 25.00,
    imagen: 'assets/img/bunuelos.png',
    descripcion: 'Bolas de masa fritas bañadas en miel de caña.',
  ),
];
