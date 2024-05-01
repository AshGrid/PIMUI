import 'package:flutter/material.dart';
import 'package:sneakers_app/pages/QuizPage/screens/quizz_screen.dart';



class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 154, 208, 240),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  color: Color.fromARGB(255, 44, 122, 181),
                ),
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: Color.fromARGB(255, 255, 255, 255),
                            backgroundImage: NetworkImage('https://i.imgur.com/DoOD71Z.png'),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Dianne Russell',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 22,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Indonesia',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InfoWidget(
                            textOne: 'Questions',
                            textTwo: ' 0/10',
                            colorOne: Color.fromARGB(255, 18, 96, 155),
                            colorTwo: Color.fromARGB(255, 18, 96, 155),
                            icon: Icons.question_answer,
                          ),
                          InfoWidget(
                            textOne: 'Ranking',
                            textTwo: ' 1',
                            colorOne: Color.fromARGB(255, 18, 96, 155),
                            colorTwo: Color.fromARGB(255, 18, 96, 155),
                            icon: Icons.emoji_events,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.lightBlue.shade400,
                ),
                child: Column(
                  children: [
                    Text(
                      'Domain of Quiz',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Quizzes()),
                        );
                      },
                      child: Text('Start Quiz'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 16, 123, 199),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Text(
                          'Recent Match',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      RowWidget(
                        text: 'Win',
                        textNew: 'Javascript',
                        color: Colors.green,
                      ),
                      RowWidget(
                        text: 'Los',
                        textNew: 'Javascript',
                        color: Colors.red,
                      ),
                      RowWidget(
                        text: 'Win',
                        textNew: 'Javascript',
                        color: Colors.green,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RowWidget extends StatelessWidget {
  final String text;
  final String textNew;
  final Color color;

  const RowWidget({
    Key? key,
    required this.text,
    required this.textNew,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        CircleAvatar(
          radius: 10,
          backgroundColor: Colors.amber.shade100,
          backgroundImage: NetworkImage('https://i.imgur.com/DoOD71Z.png'),
        ),
        Text(
          'vs',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
        ),
        CircleAvatar(
          radius: 10,
          backgroundColor: Colors.deepPurpleAccent.shade100,
          backgroundImage: NetworkImage('https://i.imgur.com/DoOD71Z.png'),
        ),
        Text(
          textNew,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
        ),
        SizedBox(
          width: 25,
        ),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: color,
            borderRadius: BorderRadius.circular(25),
          ),
          height: 20,
          width: 50,
          child: Center(
            child: Text(
              '+QP 25',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class InfoWidget extends StatelessWidget {
  final String textOne;
  final String? textTwo;
  final Color colorOne;
  final Color colorTwo;
  final IconData? icon; // Ajout de l'icône

  const InfoWidget({
    Key? key,
    required this.textOne,
    this.textTwo,
    required this.colorOne,
    required this.colorTwo,
    this.icon, // Ajout de l'icône
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Color.fromARGB(255, 34, 78, 164),
        gradient: LinearGradient(colors: [colorOne, colorTwo]),
        borderRadius: BorderRadius.circular(20),
      ),
      height: 40,
      width: 150,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) // Affichage de l'icône si fournie
              Icon(
                icon,
                color: Colors.white,
              ),
            SizedBox(width: 5),
            RichText(
              text: TextSpan(
                text: textOne,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
                children: [
                  if (textTwo != null)
                    TextSpan(
                      text: textTwo,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 27, 29, 30),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
