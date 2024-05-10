import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => RockInRio(),
    ),
  );
}


class RockInRio extends StatelessWidget {
  const RockInRio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rock in Rio',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Atrações'),
      ),
      body: ListView.builder(
        itemCount: listaAtracoes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(listaAtracoes[index].nome),
            subtitle: Wrap(spacing: 8, 
            runSpacing: 4,
            children: listaAtracoes[index]
            .tags.map((tag) => Chip(label: Text('#$tag')))
            .toList(),
            ),
            leading: CircleAvatar(child: Text('${listaAtracoes[index]}'),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite)
            ),
          );
        },
      ),
    );
  }
}


class Atracao {
  final String nome;
  final int dia;
  final List<String> tags;

  const Atracao(this.nome, this.dia, this.tags);
}

const listaAtracoes = [
  Atracao("Iron Maiden", 2, ["Espetáculo", "Fãs", "Novo Álbum"]),
  Atracao("Alok", 3, ["Influente", "Top", "Show"]),
  Atracao("Justin Bieber", 4, ["Top Charts", "Hits", "Príncipe do Pop"]),
  Atracao("Guns N' Roses", 8, ["Sucesso", "Espetáculo", "Fãs"]),
  Atracao("Capital Inicial", 9, ["2019", "Novo Álbum", "Fãs"]),
  Atracao("Green Day", 9, ["Espetáculo", "Fãs", "Novo Álbum"]),
  Atracao("Coldplay", 10, ["Espetáculo", "Fãs", "Novo Álbum"]),
  Atracao("Ivete Sangalo", 10, ["Espetáculo", "Fãs", "Novo Álbum"]),
  Atracao("Racionais MC's", 3, ["Rap", "Cultura", "Fãs"]),
  Atracao("Zimbra", 8, ["Indie", "Alternativo", "Fãs"]),
  Atracao("Ariana Grande", 6, ["Pop", "Hits", "Mulheres"]),
  Atracao("Foo Fighters", 7, ["Rock", "Alternativo", "Energia"]),
  Atracao("Lady Gaga", 5, ["Pop", "Ícone", "Performática"]),
  Atracao("Rihanna", 4, ["R&B", "Moda", "Sucesso"]),
  Atracao("Maroon 5", 11, ["Pop", "Hits", "Estádio"]),
];

