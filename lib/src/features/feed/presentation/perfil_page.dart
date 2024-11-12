import 'dart:ui'; // Import necessário para o BackdropFilter
import 'package:flutter/material.dart';
import 'feed_page.dart';
import 'ministerios_page.dart';

class PerfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Background azul no topo
          Container(
            height: 200,
            decoration: const BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24.0),
                bottomRight: Radius.circular(24.0),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Column(
              children: [
                // Imagem de perfil e botão "Editar Perfil"
                Center(
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                            'https://avatar.iran.liara.run/public'), // Substitua com a URL da imagem do perfil
                      ),
                      const SizedBox(height: 8),
                      TextButton(
                        onPressed: () {
                          // Ação para editar perfil
                        },
                        child: const Text(
                          'Thiago Barros Gomes',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),

                // Container com os campos de informações pessoais com efeito de vidro
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                        child: Container(
                          padding: const EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(94, 146, 146, 146)
                                .withOpacity(0.3), // aqui foi a transparencia
                            borderRadius: BorderRadius.circular(16.0),
                            border: Border.all(
                              color: const Color.fromARGB(255, 216, 216, 216)
                                  .withOpacity(0.2),
                              width: 1.5,
                            ),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                _buildTextField(
                                    label: 'Nome', value: 'Thiago Barros'),
                                _buildTextField(
                                    label: 'Email', value: 'thiago@gmail.com'),
                                _buildTextField(
                                    label: 'Data de Nascimento',
                                    value: '16/16/1950'),
                                _buildTextField(
                                    label: 'Telefone', value: '1999825698'),
                                _buildTextField(
                                    label: 'CEP', value: '13600-000'),
                                _buildTextField(
                                    label: 'Endereço', value: 'Rua Tiradentes'),
                                _buildTextField(label: 'Número', value: '100'),
                                _buildTextField(
                                    label: 'Bairro', value: 'Centro'),
                                _buildTextField(
                                    label: 'Cidade', value: 'Araras'),
                                _buildTextField(
                                    label: 'Estado', value: 'São Paulo'),
                                const SizedBox(height: 16),
                                // Botão Editar
                                Center(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Ação para salvar mudanças
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blueAccent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 32.0, vertical: 12.0),
                                      child: Text(
                                        'Salvar Alterações',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // Espaçamento adicional entre o conteúdo e a BottomNavigationBar
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.language),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Ministérios',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: 2,
        selectedItemColor: Colors.blue,
        onTap: (index) => _onBottomNavTapped(context, index),
      ),
    );
  }
}

Widget _buildTextField({required String label, required String value}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 4),
        TextFormField(
          initialValue: value,
          readOnly: true,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    ),
  );
}

void _onBottomNavTapped(BuildContext context, int index) {
  if (index == 0) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const FeedPage()),
    );
  } else if (index == 1) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MinisteriosPage()),
    );
  }
}
