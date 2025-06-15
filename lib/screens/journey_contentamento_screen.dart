
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class JourneyContentamentoScreen extends StatefulWidget {
  const JourneyContentamentoScreen({super.key});

  @override
  State<JourneyContentamentoScreen> createState() => _JourneyContentamentoScreenState();
}

class _JourneyContentamentoScreenState extends State<JourneyContentamentoScreen> {
  double nivelContentamento = 5;
  final TextEditingController registroController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Diário de Contentamento',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TableCalendar(
              focusedDay: DateTime.now(),
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.amber,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.white24,
                  shape: BoxShape.circle,
                ),
                defaultTextStyle: TextStyle(color: Colors.white),
                weekendTextStyle: TextStyle(color: Colors.white70),
              ),
              headerVisible: false,
              daysOfWeekVisible: false,
              onDaySelected: (selectedDay, focusedDay) {
                // ação futura
              },
            ),
            const SizedBox(height: 24),
            const Text(
              'O contentamento é um dom precioso. Reflita: o que trouxe paz, alegria ou gratidão ao seu dia?',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Nível de Contentamento:',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            Slider(
              value: nivelContentamento,
              min: 1,
              max: 10,
              divisions: 9,
              label: nivelContentamento.round().toString(),
              activeColor: Colors.amber,
              onChanged: (value) {
                setState(() {
                  nivelContentamento = value;
                });
              },
            ),
            const SizedBox(height: 16),
            const Text(
              'Registro de Hoje:',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: registroController,
              minLines: 5,
              maxLines: null,
              expands: false,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Escreva aqui...',
                hintStyle: const TextStyle(color: Colors.white38),
                filled: true,
                fillColor: const Color(0xFF1A1A1A),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.white24),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Contentamento registrado com sucesso!')),
                  );
                  registroController.clear();
                  setState(() {
                    nivelContentamento = 5;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD2A679),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text(
                  'Salvar Registro',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF2B1D0E)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
