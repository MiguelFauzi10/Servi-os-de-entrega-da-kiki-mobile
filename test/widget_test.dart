import 'package:flutter_test/flutter_test.dart';
import 'package:kikis_delivery_mobile/main.dart';

void main() {
  testWidgets('Aplicativo inicia corretamente', (WidgetTester tester) async {
    await tester.pumpWidget(const MeuApp());

    expect(find.text('Serviços de Entrega da Kiki'), findsOneWidget);
  });
}