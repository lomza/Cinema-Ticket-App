import 'package:barcode_flutter/barcode_flutter.dart';
import 'package:cinema_ticket_app/datalayer/TicketData.dart';
import 'package:cinema_ticket_app/styles/colors.dart';
import 'package:cinema_ticket_app/styles/text_style.dart';
import 'package:cinema_ticket_app/widgets/CircleClipper.dart';
import 'package:cinema_ticket_app/widgets/CircleSide.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CinemaTicket extends StatelessWidget {
  final TicketData ticketData;
  final double circleRadius = 28.0;
  final double padding = 12.0;
  final double borderRadius = 6.0;

  CinemaTicket({this.ticketData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 220.0,
          child: LayoutBuilder(builder: (context, constraints) {
            return IntrinsicHeight(
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 5,
                      child: ClipPath(
                        clipper: CircleClipper(radius: circleRadius),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: padding, horizontal: padding),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(borderRadius),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [kColorBeigeStart, kColorBeigeEnd],
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                ticketData.number,
                                style: kNumberSmallTextStyle,
                              ),
                              Text(
                                'TICKET',
                                style: GoogleFonts.amiri(
                                  textStyle: kTicketTextStyle,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    '★',
                                    style: kCinemaStarTextStyle,
                                  ),
                                  Text(
                                    'CINEMA',
                                    style: kCinemaTextStyle,
                                  ),
                                  Text(
                                    '★',
                                    style: kCinemaStarTextStyle,
                                  ),
                                ],
                              ),
                              Text(
                                'Row ${ticketData.row} Seat ${ticketData.seat}',
                                style: kPlaceTextStyle,
                              ),
                              Text(
                                'Date ${ticketData.formattedDate} Time ${ticketData.formattedTime}',
                                style: kDateTextStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(borderRadius),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: DottedLine(
                          direction: Axis.vertical,
                          lineLength: constraints.maxHeight,
                          lineThickness: 2.0,
                          dashLength: 4.0,
                          dashColor: Colors.transparent,
                          dashRadius: 0.0,
                          dashGapLength: 4.0,
                          dashGapColor: kColorPinkStart,
                          dashGapRadius: 0.0,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: ClipPath(
                        clipper: CircleClipper(
                            radius: circleRadius, side: CircleSide.right),
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: Container(
                            padding: EdgeInsets.all(padding),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(borderRadius),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [kColorPinkStart, kColorPinkEnd],
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  ticketData.number,
                                  style: kNumberBigTextStyle,
                                ),
                                BarCodeImage(
                                  padding: EdgeInsets.only(top: 8.0),
                                  params: Code93BarCodeParams(
                                    ticketData.number,
                                    lineWidth: 1.5,
                                    barHeight: 56.0,
                                    withText: false,
                                  ),
                                  onError: (error) {
                                    print('barcode error: $error');
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
            );
          }),
        ),
      ),
    );
  }
}
