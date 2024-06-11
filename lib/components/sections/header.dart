import 'package:estilizacao_componentes/data/bank_http.dart';
import 'package:estilizacao_componentes/data/bank_inherited.dart';
import 'package:estilizacao_componentes/themes/theme_colors.dart';
import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  const Header({required this.api, Key? key}) : super(key: key);
  final Future<String> api;

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {});
      },
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: ThemeColors.headerGradient),
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                    child: Text(
                      'DuBank',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: ThemeColors.primaryColor,
                          ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text.rich(
                        TextSpan(
                          text: '\$',
                          children: <TextSpan>[
                            TextSpan(
                                text: BankInherited.of(context)
                                    .values
                                    .available
                                    .toString(),
                                style: Theme.of(context).textTheme.bodyLarge)
                          ],
                        ),
                      ),
                      const Text('Available balance'),
                    ],
                  ),
                  FutureBuilder(
                      future: widget.api,
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                            return CircularProgressIndicator();
                            break;
                          case ConnectionState.waiting:
                            return CircularProgressIndicator();
                            break;
                          case ConnectionState.active:
                            // TODO: Handle this case.
                            break;
                          case ConnectionState.done:
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text.rich(
                                  TextSpan(
                                    text: 'R\$',
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: snapshot.data.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge)
                                    ],
                                  ),
                                ),
                                const Text('Dolar to Real'),
                              ],
                            );
                            break;
                        }
                        return Text('Erro na API');
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
