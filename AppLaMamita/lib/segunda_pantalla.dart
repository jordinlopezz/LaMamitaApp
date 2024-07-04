import 'package:flutter/material.dart';
import 'package:flutter_restaurante_1/carrito/carrito.dart';
import 'package:flutter_restaurante_1/model/carta.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final carrito = Provider.of<Carrito>(context);
    final double drawerWidth = MediaQuery.of(context).size.width * 0.75;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('La Mamita'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Comidas'),
              Tab(text: 'Bebidas'),
              Tab(text: 'Postres'),
            ],
          ),
          actions: [
            Stack(
              children: [
                IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.pushNamed(context, '/carrito');
                  },
                ),
                if (carrito.totalItems >
                    0) // Mostrar contador solo si hay elementos en el carrito
                  Positioned(
                    right: 8,
                    top: 8,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 218, 89, 89),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 10,
                        minHeight: 10,
                      ),
                      child: Text(
                        '${carrito.totalItems}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 7,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
        drawer: Drawer(
          elevation: 0,
          child: SafeArea(
            child: SingleChildScrollView(
              child: SizedBox(
                width: drawerWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 100,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(163, 145, 147, 1),
                        image: DecorationImage(
                          image: AssetImage("assets/background.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'La Mamita',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ),
                      ),
                    ),
                    const UserAccountsDrawerHeader(
                      accountName: Text('Jordin Lopez'),
                      accountEmail: Text('jordinalexanderlopezperez@gmail.com'),
                      currentAccountPicture: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/img/profile_image.png'),
                      ),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(163, 145, 147, 1),
                      ),
                      margin: EdgeInsets.zero,
                    ),
                    ListTile(
                      leading: const Icon(Icons.home),
                      title: const Text('Inicio'),
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/');
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.restaurant_menu),
                      title: const Text('Menú'),
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/menu');
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.shopping_cart),
                      title: const Text('Carrito'),
                      onTap: () {
                        Navigator.pushNamed(context, '/carrito');
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.info),
                      title: const Text('Nosotros'),
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/nosotros');
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      leading: const Icon(Icons.logout),
                      title: const Text('Cerrar sesión'),
                      onTap: () {
                        // Manejar la opción de cerrar sesión
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TabBarView(
            children: <Widget>[
              _buildGridView(context, carrito, comidas),
              _buildGridView(context, carrito, bebidas),
              _buildGridView(context, carrito, postres),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGridView(
      BuildContext context, Carrito carrito, List<Carta> lista) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height -
              kToolbarHeight -
              24, // Ajustar según sea necesario
          child: GridView.builder(
            itemCount: lista.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.6, // Ajusta según sea necesario
            ),
            itemBuilder: (context, index) {
              final item = lista[index];
              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  side: const BorderSide(color: Colors.grey, width: 1.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: AspectRatio(
                        aspectRatio: 1.5,
                        child: Image.asset(
                          item.imagen,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.nombre,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item.descripcion,
                            style: const TextStyle(fontSize: 14),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'C\$${item.precio.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {
                              carrito.agregarItem(
                                item.id.toString(),
                                item.nombre,
                                item.precio,
                                '',
                                item.imagen,
                                1,
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Añadido al carrito'),
                                ),
                              );
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(
                                  const Color.fromARGB(255, 0, 0, 0)),
                            ),
                            child: const Text(
                              'Añadir al carrito',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
