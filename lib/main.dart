import 'package:spotify_login/HomePage.dart';
import 'package:spotify_sdk/spotify_sdk.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spotify Login',
      home: SpotifyLoginScreen(),
    );
  }
}

class SpotifyLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spotify Login'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _loginToSpotify(context); //Pasar el contexto aquí
          },
          child: Text('Login with Spotify'),
        ),
      ),
    );
  }

  Future<void> _loginToSpotify(BuildContext context) async {
    String clientId = '6c83e4fddc0e4e46bb66d6defcae149e';
    String redirectUrl = 'spotify_login://main';

    try {
      await SpotifySdk.connectToSpotifyRemote(
        clientId: clientId,
        redirectUrl: redirectUrl,
        // Resto de los parámetros opcionales
      );
      // Acciones después de iniciar sesión correctamente
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } catch (e) {
      // Manejo de errores
      print('Error al iniciar sesión en Spotify: $e');
    }
  }
}
