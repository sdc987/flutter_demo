import 'package:demo202/blocs/painting_bloc.dart';
import 'package:demo202/models/painting.dart';
import 'package:demo202/pages/details/widgets/no_record_page.dart';
import 'package:demo202/pages/details/widgets/sliver_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    Key key,
    this.showMenu,
  }) : super(key: key);
  final Function showMenu;
  @override
  Widget build(BuildContext context) {
    return Consumer<PaintingBloc>(
      builder: (_, bloc, child) {
        return StreamBuilder<Painting>(
          stream: bloc.painting,
          builder: (context, snapshot) {
            if (snapshot.hasError)
              return Center(
                child: Text('Error'),
              );

            if (!snapshot.hasData)
              return NoRecordPage(
                showMenu: showMenu,
              );

            var painting = snapshot.data;

            return SliverPage(painting: painting, showMenu: showMenu);
          },
        );
      },
    );
  }
}
