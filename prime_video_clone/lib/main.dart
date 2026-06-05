import 'package:flutter/material.dart';

void main() => runApp(const PrimeVideoClone());

class PrimeVideoClone extends StatelessWidget {
  const PrimeVideoClone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prime Video',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        fontFamily: 'CuerpoFont',
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontFamily: 'TituloFont', fontWeight: FontWeight.bold, color: Colors.white),
          labelLarge: TextStyle(fontFamily: 'DetalleFont', fontWeight: FontWeight.bold),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const List<Map<String, String>> peliculas = [
    {'titulo': 'The Backrooms', 'subtitulo': 'Amazon Original', 'img': 'assets/images/pelicula1.jpg'},
    {'titulo': 'Interestelar', 'subtitulo': 'Amazon Original', 'img': 'assets/images/pelicula2.jpg'},
    {'titulo': 'Proyecto fin del mundo', 'subtitulo': 'Amazon Original', 'img': 'assets/images/pelicula3.jpeg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('prime video', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, fontFamily: 'TituloFont')),
        actions: [
          TextButton(onPressed: (){}, child: const Text('Inicio', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
          TextButton(onPressed: (){}, child: const Text('Películas', style: TextStyle(color: Colors.grey))),
          TextButton(onPressed: (){}, child: const Text('Series de TV', style: TextStyle(color: Colors.grey))),
          const SizedBox(width: 20),
          const Icon(Icons.search, color: Colors.white),
          const SizedBox(width: 15),
          const Center(child: Text('ES', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
          const Icon(Icons.arrow_drop_down, color: Colors.white),
          const SizedBox(width: 15),
          const Icon(Icons.account_circle, color: Colors.grey, size: 30),
          const SizedBox(width: 15),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF0073E6), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
              onPressed: () {},
              child: const Text('Suscribirse a Prime', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: ListView(
        children: [
          // 1. SECCIÓN PRINCIPAL (HERO) CON DEGRADADOS PROFESIONALES
          Container(
            height: 650, 
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://image.tmdb.org/t/p/original/7WsyChQLEftFiDOVTGkv3hFpyyt.jpg'),
                fit: BoxFit.cover,
                alignment: Alignment.topRight, 
              ),
            ),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black, Colors.black87, Colors.transparent],
                  stops: [0.0, 0.4, 0.8],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black, Colors.transparent],
                    stops: [0.0, 0.15], 
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: const EdgeInsets.only(left: 50, top: 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Te damos la bienvenida a\nPrime Video', style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 48)),
                    const SizedBox(height: 20),
                    const Text(
                      'Disfruta de títulos Amazon Originals exclusivos, además de películas y\nseries populares por PEN 25.90/mes. Disfruta ahora, cancela cuando\nquieras.', 
                      style: TextStyle(fontSize: 18, height: 1.5)
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: 350,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                        ),
                        onPressed: () {},
                        child: const Text('¿Eres miembro de Prime Video? Inicia sesión', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Padding(
                      padding: EdgeInsets.only(left: 170),
                      child: Text('o', style: TextStyle(fontSize: 16, color: Colors.grey)),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: 350,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                        ),
                        onPressed: () {},
                        child: const Text('Comienza tu prueba gratis*', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text('*Cancela tu prueba cuando quieras.', style: TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
              ),
            ),
          ),

          // 2. SECCIÓN DE CARACTERÍSTICAS
          Container(
            color: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 50),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildFeatureItem(
                  icon: Icons.connected_tv,
                  title: 'Disfruta en cualquier lugar',
                  description: 'Disfruta desde la web o con la app de Prime Video en tu teléfono, tablet o ciertos televisores smart TV en hasta tres dispositivos al mismo tiempo.',
                ),
                _buildFeatureItem(
                  icon: Icons.system_update_alt,
                  title: 'Descarga y disfruta',
                  description: 'Disfruta de contenido sin conexión con la app de Prime Video cuando descargues títulos en tu iPhone, iPad, tablet o dispositivo Android.',
                ),
                _buildFeatureItem(
                  icon: Icons.data_saver_on,
                  title: 'Ahorro de datos',
                  description: 'Controla el uso de datos mientras descargas y ves videos en determinados teléfonos y tablets.',
                ),
              ],
            ),
          ),

          // 3. SECCIÓN DE PELÍCULAS LOCALES (Cartelera Exacta a tu captura)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: Text('Tus Películas Destacadas', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'TituloFont')),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: SizedBox(
              height: 250, // Altura calculada para la imagen + el banner inferior
              child: ListView.builder(
                scrollDirection: Axis.horizontal, 
                itemCount: peliculas.length,
                itemBuilder: (context, index) {
                  final peli = peliculas[index];
                  return Container(
                    width: 320, // Ancho de cada tarjeta
                    margin: const EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      color: const Color(0xFF19222B), // Fondo azul oscuro exacto
                      borderRadius: BorderRadius.circular(8), // Bordes redondeados en las 4 esquinas
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Imagen estilo póster horizontal pegada arriba
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                          child: Image.asset(
                            peli['img']!,
                            height: 170, // Imagen ocupando la mayor parte de la tarjeta
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        // Sección oscura inferior con textos y botón de play
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(peli['titulo']!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                                  const SizedBox(height: 4),
                                  Text(peli['subtitulo']!, style: const TextStyle(color: Color(0xFF00A8E1), fontSize: 13, fontWeight: FontWeight.bold)),
                                ],
                              ),
                              const Icon(Icons.play_circle_fill, color: Colors.white, size: 40),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 60),

          // 4. FOOTER
          Container(
            color: const Color(0xFF19222B),
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Column(
              children: [
                const Text('prime video', style: TextStyle(fontFamily: 'TituloFont', fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(onPressed: (){}, child: const Text('Términos y Aviso de privacidad', style: TextStyle(color: Color(0xFF79B8F3), fontSize: 13))),
                    const SizedBox(width: 20),
                    TextButton(onPressed: (){}, child: const Text('Envíanos tus comentarios', style: TextStyle(color: Color(0xFF79B8F3), fontSize: 13))),
                    const SizedBox(width: 20),
                    TextButton(onPressed: (){}, child: const Text('Ayuda', style: TextStyle(color: Color(0xFF79B8F3), fontSize: 13))),
                  ],
                ),
                const SizedBox(height: 10),
                const Text('© 1996-2026, Amazon.com, Inc. o sus filiales', style: TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFeatureItem({required IconData icon, required String title, required String description}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: const BoxDecoration(
                color: Color(0xFF0F171E),
                shape: BoxShape.circle,
                border: Border.fromBorderSide(BorderSide(color: Color(0xFF00A8E1), width: 3)),
              ),
              child: Icon(icon, size: 60, color: Colors.white),
            ),
            const SizedBox(height: 30),
            Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, fontFamily: 'TituloFont'), textAlign: TextAlign.center),
            const SizedBox(height: 15),
            Text(description, style: const TextStyle(fontSize: 15, height: 1.5, color: Colors.grey), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}