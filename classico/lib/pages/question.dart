// import 'package:flutter/material.dart';
//
// class QuestionnairePage extends StatefulWidget {
//   const QuestionnairePage({Key? key}) : super(key: key);
//
//   @override
//   State<QuestionnairePage> createState() => _QuestionnairePageState();
// }
//
// class _QuestionnairePageState extends State<QuestionnairePage> {
//   final List<Questionnaire> questionnaires = [];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blueAccent,
//         title: const Text('Questionnaire'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: questionnaires.length,
//               itemBuilder: (context, index) => QuestionnaireCard(
//                 questionnaire: questionnaires[index],
//                 onFilterSelected: (filter) => _handleFilterSelected(context, filter),
//                 onDelete: () => setState(() => questionnaires.removeAt(index)),
//               ),
//             ),
//           ),
//           FloatingActionButton.extended(
//             onPressed: () => setState(() => questionnaires.add(Questionnaire(title: 'New Questionnaire'))),
//             tooltip: 'Add Questionnaire',
//             label: const Text('Add Questionnaire'),
//             icon: const Icon(Icons.add),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _handleFilterSelected(BuildContext context, String? filter) {
//     // Your filter handling logic here
//     if (filter != null) {
//       print("Filter selected: $filter");
//       // Update state or perform actions based on the selected filter
//     }
//   }
// }
//
// class Questionnaire {
//   String title;
//
//   Questionnaire({required this.title});
// }
//
// class QuestionnaireCard extends StatelessWidget {
//   final Questionnaire questionnaire;
//   final ValueChanged<String?> onFilterSelected;
//   final VoidCallback onDelete;
//
//   const QuestionnaireCard({
//     Key? key,
//     required this.questionnaire,
//     required this.onFilterSelected,
//     required this.onDelete,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.all(8.0),
//       child: Row(
//         children: [
//           const Icon(Icons.question_answer),
//           const SizedBox(width: 8.0),
//           Text(questionnaire.title),
//           Spacer(),
//           DropdownButton<String>(
//             value: 'Age', // Initial value
//             items: const [
//               DropdownMenuItem(
//                 value: 'Age',
//                 child: Text('Age'),
//               ),
//               DropdownMenuItem(
//                 value: 'Place',
//                 child: Text('Place'),
//               ),
//             ],
//             onChanged: onFilterSelected,
//           ),
//           IconButton(
//             icon: const Icon(Icons.delete),
//             onPressed: onDelete,
//           ),
//         ],
//       ),
//     );
//   }
// }
//



import 'package:flutter/material.dart';

void main() {
  runApp(const Question());
}

class Question extends StatelessWidget {
  const Question({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Questionnaire',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyPage(title: 'Flutter Questionnaire'),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyPage> {
  final List<Questionnaire> questionnaires = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: questionnaires.length,
        itemBuilder: (context, index) => QuestionnaireCard(
          questionnaire: questionnaires[index],
          onFilterSelected: _handleFilterSelected(questionnaires[index]), // Wrap onFilterSelected in null-safe callback
          onDelete: () => setState(() => questionnaires.removeAt(index)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => questionnaires.add(Questionnaire())),
        tooltip: 'Add Questionnaire',
        child: const Icon(Icons.add),
      ),
    );
  }

  // Helper function to create a null-safe callback
  ValueChanged<String?> _handleFilterSelected(Questionnaire questionnaire) {
    return (filter) => setState(() => questionnaire.filter);
    // return filter;
  }
}

class Questionnaire {
  String title = 'Questionnaire';
  String filter = 'Age';

  Questionnaire();
}

class QuestionnaireCard extends StatefulWidget {
  final Questionnaire questionnaire;
  final ValueChanged<String?> onFilterSelected;
  final VoidCallback onDelete;

  const QuestionnaireCard({
    Key? key,
    required this.questionnaire,
    required this.onFilterSelected,
    required this.onDelete,
  }) : super(key: key);

  @override
  State<QuestionnaireCard> createState() => _QuestionnaireCardState();
}

class _QuestionnaireCardState extends State<QuestionnaireCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Icon(Icons.question_answer),
          const SizedBox(width: 8.0),
          Text(widget.questionnaire.title),
          Spacer(),
          DropdownButton<String>(
            value: widget.questionnaire.filter,
            items: const [
              DropdownMenuItem(
                value: 'Age',
                child: Text('Age'),
              ),
              DropdownMenuItem(
                value: 'Place',
                child: Text('Place'),
              ),
            ],
            onChanged: widget.onFilterSelected, // Use the null-safe callback
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: widget.onDelete,
          ),
        ],
      ),
    );
  }
}
