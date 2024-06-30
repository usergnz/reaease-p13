import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  // Function to launch URL
  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      var LaunchMode;
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Membuat AppBar transparan
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 1, // Menghilangkan bayangan AppBar
        title: const Text(
          "PROFIL AGAN",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white, // Mengubah warna teks menjadi putih
          ),
        ),
      ),
      body: Stack(
        children: [
          // Latar belakang gradien
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromARGB(255, 111, 252, 89), Color.fromARGB(255, 220, 240, 65)], // Gradien warna biru
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Isi halaman
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 60), // Ruang untuk AppBar transparan
                // Gambar Profil
                const CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage("assets/images/aku-poto.jpg"), // Path to your profile picture
                  backgroundColor: Colors.white, // Warna latar belakang jika gambar tidak dimuat
                ),
                const SizedBox(height: 20),
                
                // Nama
                Text(
                  "Danih Jian Hidayat (AGAN)",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Warna teks menjadi putih
                    shadows: [
                      Shadow(
                        offset: Offset(2, 2),
                        blurRadius: 3,
                        color: Colors.black26,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                
                // Info Pendidikan
                const Text(
                  "Monitoring WIFI UBERNET\nFOUNDER",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white70, // Warna teks lebih terang
                  ),
                ),
                const SizedBox(height: 20),
                
                // Info Kontak
                Card(
                  color: Colors.white.withOpacity(0.85),
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () => _launchURL('tel:+6282317400606'),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.phone, size: 20, color: Colors.blue),
                              SizedBox(width: 10),
                              Text(
                                "+6282317400606",
                                style: TextStyle(fontSize: 16, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        InkWell(
                          onTap: () => _launchURL('mailto:2106171@itg.ac.id'),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.mail, size: 20, color: Colors.red),
                              SizedBox(width: 10),
                              Text(
                                "2106171@itg.ac.id",
                                style: TextStyle(fontSize: 16, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.location_on, size: 20, color: Colors.green),
                            SizedBox(width: 10),
                            Text(
                              "Taraju, Garut",
                              style: TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                
                // Copyright
                const SizedBox(height: 20),
                const Text(
                  "itg.ac.id © 2024",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  launchUrl(Uri uri, {required mode}) {}
  
  canLaunchUrl(Uri uri) {}
}