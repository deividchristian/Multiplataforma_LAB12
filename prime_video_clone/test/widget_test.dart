import 'package:flutter_test/flutter_test.dart';
import 'package:prime_video_clone/main.dart'; 

void main() {
  testWidgets('Carga inicial de Prime Video Clone', (WidgetTester tester) async {
    await tester.pumpWidget(const PrimeVideoClone());

  
    expect(find.text('prime video'), findsWidgets);
  });
}