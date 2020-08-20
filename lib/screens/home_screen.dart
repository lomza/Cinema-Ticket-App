import 'package:cinema_ticket_app/datalayer/TicketData.dart';
import 'package:cinema_ticket_app/widgets/cinema_ticket_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cinema Ticket App'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 36.0, horizontal: 8.0),
        child: CinemaTicket(
          ticketData: TicketData(
            number: 'A 23456543',
            row: 'C',
            seat: 25,
            dateTime: DateTime.now(),
          ),
        ),
      ),
    );
  }
}
