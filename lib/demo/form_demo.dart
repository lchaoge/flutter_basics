import 'package:flutter/material.dart';

class FormDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FormDemo'),
        elevation: 0.0,
      ),
        body: Theme(
            data: Theme.of(context).copyWith(
              primaryColor: Colors.black,
            ),
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RegisterForm(),
                ],
              ),
            )));
  }
}

class TextFieldDemo extends StatefulWidget {
  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  final textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    textEditingController.text = "hi";
    textEditingController.addListener(() {
      debugPrint('input:${textEditingController.text}');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      // onChanged: (value) {
      //   debugPrint('input:$value');
      // },
      onSubmitted: (value) {
        debugPrint('submit:$value');
      },
      decoration: InputDecoration(
          icon: Icon(Icons.subject),
          labelText: 'Title',
          hintText: 'Enter the post title',
          // border: InputBorder.none,
          // border: OutlineInputBorder()
          filled: true,
          fillColor: Colors.amberAccent),
    );
  }
}

class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).accentColor,
    );
  }
}

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final registerFormKey = GlobalKey<FormState>();

  String username, password;
  bool autovalidate = false;

  void _submitRegisterForm() {
    if (registerFormKey.currentState.validate()) {
      registerFormKey.currentState.save();

      debugPrint('username:$username');
      debugPrint('password:$password');

      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('registering...'),
        )
      );

    } else {
      setState(() {
        autovalidate = true;
      });
    }
  }

  String _validateUsername(value) {
    if (value.isEmpty) {
      return 'username is required';
    }
    return null;
  }

  String _validatePassword(value) {
    if (value.isEmpty) {
      return 'password is required';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: 'username',
              helperText: '',
            ),
            onSaved: (value) {
              username = value;
            },
            validator: _validateUsername,
            autovalidate: autovalidate,
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'password',
              helperText: '',
            ),
            onSaved: (value) {
              password = value;
            },
            validator: _validatePassword,
            autovalidate: autovalidate,
          ),
          Container(
            width: double.infinity,
            child: RaisedButton(
                color: Theme.of(context).accentColor,
                child: Text('Register', style: TextStyle(color: Colors.white)),
                elevation: 0.0,
                onPressed: _submitRegisterForm),
          )
        ],
      ),
    );
  }
}
