// ignore: must_be_immutable, use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:my_app/main.dart';
import 'package:my_app/models/transferencia.dart';
import 'package:my_app/screens/transferencia/formulario.dart';

class ListaTransferencias extends StatefulWidget {
  // ignore: prefer_final_fields
  List<Transferencia> _transferencias = [];

  @override
  State<StatefulWidget> createState() {
    return ListaTranferenciasState();
  }
}

class ListaTranferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transferências"),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = widget._transferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));
          future.then((transferenciaRecebida) {
            Future.delayed(Duration(milliseconds: 100), () {
              debugPrint('chegou no then do future');
              debugPrint('$transferenciaRecebida');
              if (transferenciaRecebida != null) {
                setState(() {
                  widget._transferencias.add(transferenciaRecebida);
                });
              }
            });
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  // ignore: use_key_in_widget_constructors
  const ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}
