import 'package:dartssh2/dartssh2.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LGService {
  // Simple method to send command to LG
  Future<bool> sendCommand(String command) async {
    try {
      // Get saved settings
      final prefs = await SharedPreferences.getInstance();
      String ip = prefs.getString('lg_ip') ?? '';
      String user = prefs.getString('lg_user') ?? 'lg';
      String pass = prefs.getString('lg_pass') ?? 'lg';
      int port = int.parse(prefs.getString('lg_port') ?? '22');

      // Check if IP is set
      if (ip.isEmpty) {
        print('No IP address configured');
        return false;
      }

      // Connect to LG via SSH
      final socket = await SSHSocket.connect(ip, port);
      final client = SSHClient(
        socket,
        username: user,
        onPasswordRequest: () => pass,
      );

      // Run the command
      await client.run(command);

      // Close connection
      client.close();

      return true;
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }
}