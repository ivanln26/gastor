import 'package:flutter/widgets.dart';
import 'package:gastor/blocs/gastor_bloc.dart';

class GastorProvider extends InheritedWidget {
  GastorBloc gastorBloc;

  GastorProvider({this.gastorBloc, Widget child}) : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static GastorProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(GastorProvider);
}
