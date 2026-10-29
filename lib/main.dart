import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(home: CatMemeApp(), debugShowCheckedModeBanner: false),
  );
}

class CatMemeApp extends StatefulWidget {
  const CatMemeApp({super.key});

  @override
  State<CatMemeApp> createState() => _CatMemeAppState();
}

class _CatMemeAppState extends State<CatMemeApp> {
  final TextEditingController _controller = TextEditingController();
  String _imageUrl = 'https://cataas.com/cat';

  void _generateMeme() {
    final text = _controller.text.trim();
    setState(() {
      if (text.isEmpty) {
        _imageUrl =
            'https://cataas.com/cat?t=${DateTime.now().millisecondsSinceEpoch}';
      } else {
        _imageUrl =
            'https://cataas.com/cat/says/${Uri.encodeComponent(text)}?fontSize=50&fontColor=white&t=${DateTime.now().millisecondsSinceEpoch}';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Generador de Memes de Gatos')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Escribe tu frase',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _generateMeme,
              child: const Text('Generar Meme'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Image.network(
                _imageUrl,
                fit: BoxFit.contain,
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
                errorBuilder: (context, error, stackTrace) =>
                    const Center(child: Text('Error al cargar la imagen.')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
