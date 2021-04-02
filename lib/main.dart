import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Navigator',
    //home: PrimeiraTela(),

    //ROTAS DE NAVEGAÇÃO
    initialRoute: '/tela1',
    routes: {
      '/tela1': (context) => PrimeiraTela(),
      '/tela2': (context) => SegundaTela(),
      '/tela3': (context) => TerceiraTela(),
      '/tela4': (context) => QuartaTela(),
    },
  ));
}

//
// Troca de Dados
// Classe auxiliar para troca de dados entre as telas
//
class Mensagem {
  final String titulo;
  final String conteudo;
  Mensagem(this.titulo, this.conteudo);
}

//
// PRIMEIRA TELA
//
class PrimeiraTela extends StatefulWidget {
  @override
  _PrimeiraTelaState createState() => _PrimeiraTelaState();
}

class _PrimeiraTelaState extends State<PrimeiraTela> {
  var _txtTitulo = TextEditingController();
  var _txtConteudo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Primeira Tela')),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(children: [
          TextField(
            controller: _txtTitulo,
            decoration: InputDecoration(
                labelText: 'Título', border: OutlineInputBorder()),
          ),
          SizedBox(height: 20),
          TextField(
            controller: _txtConteudo,
            keyboardType: TextInputType.multiline,
            maxLines: 10,
            decoration: InputDecoration(
                labelText: 'Conteúdo',
                border: OutlineInputBorder(),
                alignLabelWithHint: true),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            child: Text('Próximo'),
            onPressed: () {
              /*
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SegundaTela()
                  )
                );
              */

              setState(() {

                var msg = Mensagem(
                  _txtTitulo.text, _txtConteudo.text
                );

                Navigator.pushNamed(context, '/tela2',
                    arguments: msg);
              });

            },
          ),
        ]),
      ),
    );
  }
}

//
// SEGUNDA TELA
//
class SegundaTela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //Recuperar os dados enviados
    final Mensagem msg = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Segunda Tela'),

        //desabilitar o botão de voltar no AppBar
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        width: double.infinity,
        child: Column(children: [

          Text('Título', style:TextStyle(fontSize: 18, fontStyle: FontStyle.italic)),  
          Text(msg.titulo, style:TextStyle(fontSize: 24)),  
          SizedBox(height: 20),

          Text('Conteúdo', style:TextStyle(fontSize: 18, fontStyle: FontStyle.italic)),  
          Text(msg.conteudo, style:TextStyle(fontSize: 24)),  
          SizedBox(height: 20),

          Row(
            children: [
              ElevatedButton(
                child: Text('Anterior'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(width: 20),
              ElevatedButton(
                child: Text('Próximo'),
                onPressed: () {
                  Navigator.pushNamed(context, '/tela3');
                },
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

//
// TERCEIRA TELA
//
class TerceiraTela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terceira Tela'),
        //desabilitar o botão de voltar no AppBar
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(children: [
          Row(
            children: [
              ElevatedButton(
                child: Text('Anterior'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(width: 20),
              ElevatedButton(
                child: Text('Próximo'),
                onPressed: () {
                  Navigator.pushNamed(context, '/tela4');
                },
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

//
// QUARTA TELA
//
class QuartaTela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quarta Tela'),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(children: [
          ElevatedButton(
            child: Text('Anterior'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ]),
      ),
    );
  }
}
