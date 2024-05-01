import 'package:flutter/material.dart';
import 'package:sneakers_app/pages/QuizPage/screens/profile_page.dart';
import 'package:sneakers_app/pages/QuizPage/screens/quizz_screen.dart';

class QuizCategoryCard extends StatelessWidget {
  final String title;
  final int questionCount;
  final String duration;
  final double rating;
  final VoidCallback onTap;

  const QuizCategoryCard({
    required this.title,
    required this.questionCount,
    required this.duration,
    required this.rating,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.all(10),
        child: ListTile(
          leading: Icon(Icons.question_answer),
          title: Text(title),
          subtitle: Text('$questionCount Questions\n$duration'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.star, color: Colors.amber),
              Text(rating.toString())
            ],
          ),
        ),
      ),
    );
  }
}

class QuizHomeScreen extends StatefulWidget {
  @override
  _QuizHomeScreenState createState() => _QuizHomeScreenState();
}

class _QuizHomeScreenState extends State<QuizHomeScreen> {
  List<String> availableDomains = ['UI/UX Design', 'Graphic Design'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Home'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  "Hello, James",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text("Let's test your knowledge"),
                SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
                SizedBox(height: 16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: availableDomains
                        .map((domain) => CategoryButton(
                              text: domain,
                              onTap: () {
                                // Navigation vers l'interface de quiz
                                navigateToQuizScreen(context);
                              },
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                QuizCategoryCard(
                  title: 'UI/UX Design',
                  questionCount: 10,
                  duration: '1 hour 15 min',
                  rating: 4.8,
                  onTap: () {
                    // Navigation vers l'interface de quiz
                    navigateToQuizScreen(context);
                  },
                ),
                QuizCategoryCard(
                  title: 'Graphic Design',
                  questionCount: 10,
                  duration: '1 hour 15 min',
                  rating: 4.8,
                  onTap: () {
                    // Navigation vers l'interface de quiz
                    navigateToQuizScreen(context);
                  },
                ),
              ],
            ),
          ),
          FloatingActionButton.extended(
            onPressed: () {
              _showAddDomainDialog(context);
            },
            label: Text('Add Domain'),
            icon: Icon(Icons.add),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  void navigateToQuizScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfilePage()),
    );
  }

  void _showAddDomainDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Domain'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
               
                TextField(
                  decoration: InputDecoration(labelText: 'Domain Name'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Add'),
              onPressed: () {
                // Ajoutez ici la logique pour ajouter le domaine
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  CategoryButton({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      child: Text(text),
    );
  }
}

