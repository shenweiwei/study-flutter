import 'package:flutter/material.dart';

class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final PreferredSizeWidget bottom;
  final Widget leading;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return new TopAppBarPage(
        title: this.title, leading: this.leading, actions: this.actions);
  }

  TopAppBar.create({this.bottom, this.title, this.leading, this.actions});

  // TODO: implement preferredSize
  @override
  Size get preferredSize => new Size.fromHeight(
      kToolbarHeight + (bottom?.preferredSize?.height ?? 0.0));
}

class TopAppBarPage extends StatefulWidget {
  final String title;
  final Widget leading;
  final List<Widget> actions;

  TopAppBarPage({this.title, this.leading, this.actions});

  @override
  _TopAppBarState createState() => new _TopAppBarState(
      title: this.title, leading: this.leading, actions: this.actions);
}

class _TopAppBarState extends State<TopAppBarPage> {
  final String title;
  final Widget leading;
  final List<Widget> actions;
  _TopAppBarState({this.title, this.leading, this.actions});

  @override
  Widget build(BuildContext context) {
    return TopAppBarDisplay(
        title: this.title, leading: this.leading, actions: this.actions);
  }
}

class TopAppBarDisplay extends StatelessWidget {
  final String title;
  final Widget leading;
  final List<Widget> actions;
  TopAppBarDisplay({this.title, this.leading, this.actions});

  @override
  Widget build(BuildContext context) {
    return new AppBar(
      // Here we take the value from the MyHomePage object that was created by
      // the App.build method, and use it to set our appbar title.
      leading: this.leading,
      title: new Center(child: new Text(this.title)),
      actions: this.actions == null ? [] : this.actions,
    );
  }
}

class AppBarLeading extends StatelessWidget {
  final VoidCallback onPressed;
  AppBarLeading(this.onPressed);

  @override
  Widget build(BuildContext context) {
    return new IconButton(
      icon: new Icon(Icons.menu),
      tooltip: 'Navigation menu',
      onPressed: this.onPressed,
    );
  }
}

class AppBarAction extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData iconData;
  final String tooltip;

  @override
  Widget build(BuildContext context) {
    return new IconButton(
      icon: new Icon(this.iconData),
      tooltip: this.tooltip,
      onPressed: this.onPressed,
    );
  }

  AppBarAction.icon({@required this.onPressed, this.iconData, this.tooltip});
}
