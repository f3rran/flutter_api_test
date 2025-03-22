import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/breed.dart';
import 'breed_detail_screen.dart';

class BreedsScreen extends StatefulWidget {
  @override
  _BreedsScreenState createState() => _BreedsScreenState();
}

class _BreedsScreenState extends State<BreedsScreen> {
  final ApiService apiService = ApiService();
  late Future<List<Breed>> breeds;

  @override
  void initState() {
    super.initState();
    breeds = fetchBreeds();
  }

  Future<List<Breed>> fetchBreeds() async {
    try {
      final data = await apiService.fetchBreeds();
      return data.map((json) => Breed.fromJson(json)).toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dog Breeds')),
      body: FutureBuilder<List<Breed>>(
        future: breeds,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error, color: Colors.red, size: 50),
                  SizedBox(height: 10),
                  Text(
                    "Error: ${snapshot.error}",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        breeds = fetchBreeds(); // Reintentar
                      });
                    },
                    child: Text("Retry"),
                  ),
                ],
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No available data.'));
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final breed = snapshot.data![index];
              return ListTile(
                leading:
                    breed.imageUrl.isNotEmpty
                        ? Image.network(
                          breed.imageUrl,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        )
                        : Icon(Icons.pets),
                title: Text(breed.name),
                subtitle: Text(breed.temperament),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BreedDetailScreen(breed: breed),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
