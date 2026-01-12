import 'package:flutter/material.dart';
import 'con_setting.dart';
import '../connection/lg_service.dart';
import '../connection/lg_command.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late LGService _lgService;

  bool _isConnected = false; // 🔴 default: not connected

  @override
  void initState() {
    super.initState();
    _lgService = LGService();
  }

  Future<void> _execute(String cmd) async {
    final success = await _lgService.sendCommand(cmd);

    setState(() {
      _isConnected = success; // 🟢 if success, 🔴 if failure
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          success ? "Command executed successfully" : "Command failed",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Liquid Galaxy Controller"),
        backgroundColor: Colors.deepOrangeAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SettingPage()),
              );
            },
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),

          // ✅ Connection Status Component
          _connectionStatus(),

          const SizedBox(height: 30),

          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _button("Show Liquid Galaxy Logo", LGCommands.showLogo()),
                  _button("Show 3D KML Pyramid", LGCommands.showPyramid()),
                  _button("Fly to Home City", LGCommands.flyToCity()),
                  _button("Clear Logos", LGCommands.clearLogos()),
                  _button("Clear KMLs", LGCommands.clearKmls()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🔴🟢 Status widget
  Widget _connectionStatus() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.circle,
          color: _isConnected ? Colors.green : Colors.red,
          size: 14,
        ),
        const SizedBox(width: 8),
        Text(
          _isConnected ? "Connected to LG" : "Not Connected",
          style: TextStyle(
            color: _isConnected ? Colors.green : Colors.red,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _button(String title, String cmd) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(260, 48),
        ),
        onPressed: () => _execute(cmd),
        child: Text(title),
      ),
    );
  }
}