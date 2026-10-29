import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// Importación relativa directa para evitar problemas con el nombre del paquete
import '../lib/main.dart';

void main() {
  testWidgets('Carga inicial del Generador de Memes de Gatos', (
    WidgetTester tester,
  ) async {
    // Renderiza la aplicación de los memes
    await tester.pumpWidget(const CatMemeApp());

    // Verifica que el título principal aparece en la AppBar
    expect(find.text('Generador de Memes de Gatos'), findsOneWidget);

    // Verifica que el botón y la etiqueta del campo de texto aparecen en pantalla
    expect(find.text('Generar Meme'), findsOneWidget);
    expect(find.text('Escribe tu frase'), findsOneWidget);
  });
}
