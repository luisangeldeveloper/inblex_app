import 'package:flutter/material.dart';

import 'package:inblex_app/helpers/calendar_modific.dart';
import 'package:inblex_app/models/project_user_response.dart';

import 'package:inblex_app/widgets/custom_radial_progress.dart';


class ListTitleProjectUser extends StatelessWidget {
  final ProjectResponse project;
  final Color color;

  const ListTitleProjectUser({
    @required this.project,
    @required this.color
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        width: double.infinity,
        height: 100.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey[400],
                blurRadius: 10.0,
                spreadRadius: 1.0,
                offset: Offset(1.0, 5.0))
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 7.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0)),
                  color: this.color),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin:
                          EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
                      alignment: Alignment.centerLeft,
                      child: Text('${this.project.nombre}',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w600)),
                    ),

                    Container(
                        margin:
                            EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
                        child: Text('${ dateModific(context, this.project.fechaEstimada) }',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[500]))),

                    // SizedBox(height: 25.0),
                  ],
                ),
              ),
            ),
            _statusProject(this.project.estado),
            Container(
              margin: EdgeInsets.only(left: 10.0, right: 10.0),
              width: 70.0,
              height: 70.0,
              child: CustomRadialProgress(
                porcent: this.project.progresoTotal.toDouble(), 
                color: Colors.green[600]
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        final id = this.project.id;
        Navigator.pushNamed(context, 'details', arguments: id);
      },
    );
  }

  Widget _statusProject( int status ) {

    String statusProject = '';
    Color color;
    Color textColor = Colors.grey[100];

    if (status == 0) {
      statusProject = 'En pausa';
      color = Colors.yellow;
      textColor = Colors.black;
    } else if (status == 1) {
      statusProject = 'En desarrollo';
      color = Colors.blue;
    } else if (status == 2) {
      statusProject = 'Terminado';
      color = Colors.green[500];
    } else if (status == 3) {
      statusProject = 'Cancelado';
      color = Colors.red[600];
    } else {
      statusProject = 'Comunicate pronto';
      color = Colors.red[700];
    }

    return Container(
      margin: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
      padding: EdgeInsets.only(right: 10.0, left: 10.0, top: 2.0, bottom: 2.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: color,
      ),
      child: Text(statusProject,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: 13.0,
              fontWeight: FontWeight.w400,
              color: textColor)));

  }
}

