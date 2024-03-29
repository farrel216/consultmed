import 'package:consultmed1/chat_dokter_page.dart';
import 'package:flutter/material.dart';

// class DetailDokterPage extends StatefulWidget {
//   static const routeName = '/dokter/detail';
//   const DetailDokterPage({Key? key, required this.id}) : super(key: key);

//   final String id;

//   @override
//   State<DetailDokterPage> createState() => _DetailDokterPageState();
// }

// class _DetailDokterPageState extends State<DetailDokterPage> {
//   @override
//   Future<Dokter?> fetchTagihanDetails(String? token) async {
//     try {
//       late Tagihan? tagihan;

//       var url = Uri.parse("${ApiEndpoint.baseUrl}/tagihan/${widget.kode}");

//       var response = await http.get(url, headers: {
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//         'Authorization': 'Bearer $token',
//       });

//       TagihanDetailResponse tagihanDetailResponse =
//           tagihanDetailResponseFromJson(response.body);

//       if (response.statusCode == 200 &&
//           tagihanDetailResponse.status == "success") {
//         tagihan = tagihanFromJson(json.encode(tagihanDetailResponse.data));
//       } else {
//         tagihan = null;
//       }

//       return tagihan;
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }

//   TextEditingController kodeController = TextEditingController();
class DetailDokterPage extends StatelessWidget {
  // Informasi ini sebaiknya berasal dari objek Dokter atau parameter yang dilewatkan
  final String name;
  final String specialty;
  final String imagePath;
  final int rating;
  final int patientCount;
  final int experienceYears;
  final String about;

  DetailDokterPage({
    Key? key,
    required this.name,
    required this.specialty,
    required this.imagePath,
    required this.rating,
    required this.patientCount,
    required this.experienceYears,
    required this.about,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Image.asset(
            imagePath, // Ganti dengan imagePath yang sesuai
            fit: BoxFit.cover,
            height: 200, // Sesuaikan dengan desain Anda
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  specialty,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildInfoText('Pasien', patientCount.toString()),
                    _buildInfoText('Pengalaman', '$experienceYears thn'),
                    _buildInfoText('Rating', rating.toString()),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  'Tentang',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  about,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatDokterPage()),
                    );
                    // Aksi ketika tombol Chat Dokter ditekan
                  },
                  child: Text('Chat Dokter'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoText(String title, String value) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
