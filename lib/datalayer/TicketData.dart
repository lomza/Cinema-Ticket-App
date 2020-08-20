import 'package:intl/intl.dart';

class TicketData {
  final String number;
  final String row;
  final int seat;
  final DateTime dateTime;

  String get formattedDate => DateFormat('dd/MM/yy').format(dateTime);

  String get formattedTime => DateFormat('kk:mm').format(dateTime);

  TicketData({this.number, this.row, this.seat, this.dateTime});
}
