import 'package:estilizacao_componentes/components/box_card.dart';
import 'package:estilizacao_componentes/data/bank_http.mocks.dart';
import 'package:estilizacao_componentes/data/bank_inherited.dart';
import 'package:estilizacao_componentes/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  final MockBankHttp httpMock  = MockBankHttp();
  testWidgets('My widget has a text "Spent"', (tester) async {
    when(httpMock.dolarToReal()).thenAnswer((_) async => ('5'));
    await tester.pumpWidget(
      MaterialApp(
        home: BankInherited(
          child: Home(
            api: httpMock.dolarToReal(),
          ),
        ),
      ),
    );
    final spendFinder = find.text('Spent');

    expect(spendFinder, findsOneWidget);
  });
  testWidgets("Finds a LinearProgressIndicator", (tester) async {
    when(httpMock.dolarToReal()).thenAnswer((_) async => ('5'));
    await tester.pumpWidget(MaterialApp(
      home: BankInherited(
        child: Home(
          api: httpMock.dolarToReal(),
        ),
      ),
    ));
    expect(find.byType(LinearProgressIndicator), findsOneWidget);
  });
  testWidgets("Finds a AccountStatus", (tester) async {
    when(httpMock.dolarToReal()).thenAnswer((_) async => ('5'));
    await tester.pumpWidget(MaterialApp(
      home: BankInherited(
        child: Home(
          api: httpMock.dolarToReal(),
        ),
      ),
    ));
    expect(find.byKey(const Key('testKey')), findsOneWidget);
  });
  testWidgets('Find 5 BoxCards', (tester) async {
    when(httpMock.dolarToReal()).thenAnswer((_) async => ('5'));
    await tester.pumpWidget(MaterialApp(
      home: BankInherited(
        child: Home(
          api: httpMock.dolarToReal(),
        ),
      ),
    ));
    expect(find.byWidgetPredicate((widget) {
      if (widget is BoxCard) {
        return true;
      } else {
        return false;
      }
    }), findsNWidgets(5));
  });
  testWidgets('When tap Deposit should upload earned in 10', (tester) async {
    when(httpMock.dolarToReal()).thenAnswer((_) async => ('5'));
    await tester.pumpWidget(MaterialApp(
      home: BankInherited(
        child: Home(
          api: httpMock.dolarToReal(),
        ),
      ),
    ));
    await tester.tap(find.text('Deposit'));
    await tester.tap(find.text('Earned'));
    await tester.pumpAndSettle();
    expect(find.text('\$10.0'), findsOneWidget);
  });

  testWidgets('When tap Deposit should upload Available balance in 10',
      (tester) async {
    when(httpMock.dolarToReal()).thenAnswer((_) async => ('5'));
    await tester.pumpWidget(MaterialApp(
      home: BankInherited(
        child: Home(
          api: httpMock.dolarToReal(),
        ),
      ),
    ));
    await tester.tap(find.text('Deposit'));
    await tester.tap(find.text('Available balance'));
    await tester.pumpAndSettle();
    expect(find.text('\$10.0'), findsOneWidget);
  });
  testWidgets('When tap transfer should upload Spent in 10', (tester) async {
    when(httpMock.dolarToReal()).thenAnswer((_) async => ('5'));
    await tester.pumpWidget(MaterialApp(
      home: BankInherited(
        child: Home(
          api: httpMock.dolarToReal(),
        ),
      ),
    ));
    await tester.tap(find.text('Deposit'));
    await tester.tap(find.text('Transfer'));
    await tester.tap(find.text('Spent'));
    await tester.pumpAndSettle();
    expect(find.text('\$10.0'), findsNWidgets(2));
  });
  // testWidgets('When tap deposit and transfer should upload points in 20',
  //     (tester) async {
  //       when(httpMock.dolarToReal()).thenAnswer((_) async => ('5'));
  //   await tester.pumpWidget(MaterialApp(
  //     home: BankInherited(
  //       child: Home(
  //         api: httpMock.dolarToReal(),
  //       ),
  //     ),
  //   ));
  //   await tester.tap(find.text('Deposit'));
  //   await tester.tap(find.text('Transfer'));
  //   await tester.tap(find.text('Total'));
  //   await tester.pumpAndSettle();
  //   expect(find.text('\$20.0'), findsOneWidget);
  // });
  testWidgets('Testing MockHttp dolarToReal', (tester) async {
    when(httpMock.dolarToReal()).thenAnswer((_) async => ('5'));
    await tester.pumpWidget(MaterialApp(
      home: BankInherited(
        child: Home(
          api: httpMock.dolarToReal(),
        ),
      ),
    ));
    verify(httpMock.dolarToReal()).called(8);
  });
}
