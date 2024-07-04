import 'package:flutter/material.dart';
import 'package:flutter_restaurante_1/model/item.dart';

class Carrito extends ChangeNotifier {
  final Map<String, Item> _items = {};

  Map<String, Item> get items {
    return {..._items};
  }

  int get numeroItems {
    return _items.length;
  }

  double get subTotal {
    var total = 0.0;
    _items.forEach((key, item) {
      total += item.precio * item.cantidad;
    });
    return total;
  }

  double get impuesto {
    return subTotal * 0.15;
  }

  double get total {
    return subTotal + impuesto;
  }

  int get totalItems {
    var count = 0;
    _items.forEach((key, item) {
      count += item.cantidad;
    });
    return count;
  }

  void agregarItem(
    String productoId,
    String nombre,
    double precio,
    String unidad,
    String imagen,
    int cantidad,
  ) {
    if (_items.containsKey(productoId)) {
      _items.update(
        productoId,
        (old) => Item(
          id: old.id,
          nombre: old.nombre,
          precio: old.precio,
          unidad: old.unidad,
          imagen: old.imagen,
          cantidad: old.cantidad + cantidad,
        ),
      );
    } else {
      _items.putIfAbsent(
        productoId,
        () => Item(
          id: productoId,
          nombre: nombre,
          precio: precio,
          unidad: unidad,
          imagen: imagen,
          cantidad: cantidad,
        ),
      );
    }
    notifyListeners();
  }

  void removerItem(String productoId) {
    if (_items.containsKey(productoId)) {
      if (_items[productoId]!.cantidad > 1) {
        _items.update(
          productoId,
          (old) => Item(
            id: old.id,
            nombre: old.nombre,
            precio: old.precio,
            unidad: old.unidad,
            imagen: old.imagen,
            cantidad: old.cantidad - 1,
          ),
        );
      } else {
        _items.remove(productoId);
      }
      notifyListeners();
    }
  }
}
