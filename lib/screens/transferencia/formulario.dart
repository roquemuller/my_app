import 'package:flutter/material.dart';
import 'package:my_app/components/editor.dart';
import 'package:my_app/models/transferencia.dart';

const _tituloAppBar ='Criando Transferência';
const _rotuloCampoNumeroConta = 'Número da conta';
const _dicaCampoNumeroConta = '0000';
const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '0.00';
const _textoBotaoConfirmar = 'Confirmar';


class FormularioTranferenciaState extends State<FormularioTransferencia> {
  late final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();

  late final TextEditingController _controladorCampoValor =
      TextEditingController();

  void _criaTransferencia(BuildContext context) {
    final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double? valor = double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      debugPrint('Criando transferência');
      debugPrint('$transferenciaCriada');
      Navigator.pop(context, transferenciaCriada);
    }
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
              controlador: _controladorCampoNumeroConta,
              rotulo: _rotuloCampoNumeroConta,
              dica: _dicaCampoNumeroConta,
              icone: IconData(0),
            ),
            Editor(
              controlador: _controladorCampoValor,
              rotulo: _rotuloCampoValor,
              dica: _dicaCampoValor,
              icone: Icons.monetization_on,
            ),
            RaisedButton(
              child: Text(_textoBotaoConfirmar),
              onPressed: () => _criaTransferencia(context),
            ),
          ],
        ),
      ),
    );
  }
}

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTranferenciaState();
  }
}
