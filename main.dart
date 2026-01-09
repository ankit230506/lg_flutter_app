import 'package:flutter/material.dart';
import 'ssh_service.dart';
void main() {
  runApp(LGApp());
}

class LGApp extends StatelessWidget {
  LGApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Liquid Galaxy Controller',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
   HomePage({super.key});

final lgSSH = LGSSHService(
  host: '192.168.56.101',     // e.g. 192.168.1.10
  username: 'lg',
  password: 'lg',
);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liquid Galaxy Controller'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async{await lgSSH.showLGLogo();},
              child: const Text('Show LG Logo'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Show Pyramid KML'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Fly to Home City'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Clean Logos'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Clean KMLs'),
            ),
          ],
        ),
      ),
    );
  }
}