import 'package:flutter/material.dart';
import 'package:flutter_application_five/core/extension.dart';
import 'package:flutter_application_five/models/university_model.dart';
import 'package:flutter_application_five/services/university_service.dart';

class FindUniversityScreen extends StatefulWidget {
  const FindUniversityScreen({super.key});

  @override
  State<FindUniversityScreen> createState() => _FindUniversityScreenState();
}

class _FindUniversityScreenState extends State<FindUniversityScreen> {
  final TextEditingController _controller = TextEditingController();
  List<UniversityModel> _allUniversity = [];
  List<UniversityModel> _suitableUniversity = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    loadData();
    _controller.addListener(searchUniversity);
  }

  Future<void> loadData() async {
    try {
      final data = await UniversityServs.getUniversities();
      setState(() {
        _allUniversity = data;
        _suitableUniversity = [];
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _suitableUniversity = [];
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
        ),
      );
    }
  }

  void searchUniversity() {
    final query = _controller.text;
    final result = UniversityServs.search(_allUniversity, query);
    setState(() {
      _suitableUniversity = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'University Finder',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      body: Column(
        children: [
          20.hs,
          Text(
            'This app allows you to find universities by name or country. The database contains thousands of institutions of higher education from all over the world. The data is loaded locally, so the search works quickly and is available anywhere.',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
          20.hs,
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[100],
                hintText: 'Enter the name',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(26),
                    borderSide: BorderSide.none),
              ),
            ),
          ),
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(),
            )
          else if (_suitableUniversity.isEmpty)
            const Center(
              child: Text('Nothing was found'),
            )
          else
            Expanded(
              child: ListView.builder(
                  itemCount: _suitableUniversity.length,
                  itemBuilder: (context, index) {
                    final university = _suitableUniversity[index];
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          university.name.isNotEmpty
                              ? university.name[0].toUpperCase()
                              : '',
                        ),
                      ),
                      title: Text(university.name),
                      subtitle: Text(university.country),
                      trailing: Icon(Icons.arrow_forward),
                      onTap: () => showDetails(university),
                    );
                  }),
            ),
        ],
      ),
    );
  }

  void showDetails(UniversityModel university) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Information about: ${university.name}'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Country: ${university.country}'),
              Text('Domains: ${university.domains.join(', ')}'),
              Text('Web pages: ${university.webPages.join(', ')}'),
              Text('Alpha two code: ${university.alphaTwoCode}'),
              if (university.stateProvince != null)
                Text('State province: ${university.stateProvince}'),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: Navigator.of(context).pop,
            child: Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.removeListener(searchUniversity);
    _controller.dispose();
    super.dispose();
  }
}
