import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

   


  @override
  State<SettingPage> createState() => _SettingPageState();
}
bool _isConnected = false; // 🔴 default: not connected
class _SettingPageState extends State<SettingPage> {
  final TextEditingController _ipController = TextEditingController();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _SSHport =TextEditingController();
  final TextEditingController _screens =TextEditingController();

  // Async function to save settings
  Future<void> _saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    bool success = false;
    try {
      final results = await Future.wait([
        prefs.setString('lg_ip', _ipController.text),
        prefs.setString('lg_user', _userController.text),
        prefs.setString('lg_pass', _passController.text),
        prefs.setString('lg_port no.', _SSHport.text),
        prefs.setString('lg_screens', _screens.text),
      ]);
      success = results.every((r) => r);
    } catch (_) {
      success = false;
    }
    if (!mounted) return;
    setState(() {
      _isConnected = success; // 🟢 if success, 🔴 if failure
    });
    // Perform async write operations
    await prefs.setString('lg_ip', _ipController.text);
    await prefs.setString('lg_user', _userController.text);
    await prefs.setString('lg_pass', _passController.text);
    await prefs.setString('lg_port no.',_SSHport.text);
    await prefs.setString('lg_screens',_screens.text);

    
    if (!mounted) return;
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Connecting.....")),
    );
  }

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



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("LG Connection"),backgroundColor: Colors.blue,),
      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _ipController, decoration: const InputDecoration(labelText: "IP Address")),
            TextField(controller: _userController, decoration: const InputDecoration(labelText: "Username")),
            TextField(controller: _passController, decoration: const InputDecoration(labelText: "Password"), obscureText: true),
            TextField(controller: _SSHport,decoration: const InputDecoration(labelText: "SSH-PORT(eg:22)"),),
            TextField(controller: _screens,decoration: const InputDecoration(labelText:"No. Of Scrrens(3/5/7..)" ),),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async => await _saveSettings(), // Trigger async save
              child: const Text("Connect to LG"),
              
            ),
          ],
        ),
      ),
    );
  }
}