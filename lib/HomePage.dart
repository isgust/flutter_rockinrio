import 'package:flutter/material.dart';
import 'package:flutter_rockinrio/atracao_page.dart';
import 'package:flutter_rockinrio/lista_atracoes.dart';
import 'package:flutter_rockinrio/LoginPage.dart';
import 'package:flutter_rockinrio/AboutPage.dart';
import 'package:flutter_rockinrio/ChatPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Atracao> _listaFavoritos = [];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Atrações',
          style: TextStyle(
            color: Color.fromARGB(255, 250, 250, 250),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromARGB(219, 0, 0, 0),
        actions: [
          Image.asset(
            'assets/images/logo.png',
            height: 50,
          )
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          _buildListView(),
          LoginPage(), // Página de Login
          ChatPage(),   // Página de Chat
          AboutPage(), // Página "Sobre"
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.login),
            label: 'Login',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      itemCount: listaAtracoes.length,
      itemBuilder: (context, index) {
        final isFavorito = _listaFavoritos.contains(listaAtracoes[index]);
        return ListTile(
          title: Text(listaAtracoes[index].nome),
          subtitle: Wrap(
            spacing: 8,
            runSpacing: 4,
            children: listaAtracoes[index]
                .tags
                .map((tag) => Chip(label: Text('#$tag')))
                .toList(),
          ),
          leading: CircleAvatar(
            child: Text('${listaAtracoes[index].nome[0]}'),
          ),
          trailing: IconButton(
            onPressed: () {
              setState(() {
                if (isFavorito) {
                  _listaFavoritos.remove(listaAtracoes[index]);
                } else {
                  _listaFavoritos.add(listaAtracoes[index]);
                }
              });
            },
            icon: Icon(
              isFavorito ? Icons.favorite : Icons.favorite_border,
              color: isFavorito ? Colors.red : null,
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AtracaoPage(atracao: listaAtracoes[index]),
              ),
            );
          },
        );
      },
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}