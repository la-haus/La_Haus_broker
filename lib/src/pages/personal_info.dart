import 'package:flutter/material.dart';
import 'package:login_bloc_pattern/src/bloc/bloc_provider.dart';
import 'package:login_bloc_pattern/src/bloc/profile_bloc.dart';

class PersonalPage extends StatefulWidget {
  @override
  _PersonalPageState createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  final buttonColor = Color.fromRGBO(0, 208, 174, 1.0);
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Información personal',
          style: TextStyle(
              fontSize: 20.0,
              color: Color.fromRGBO(103, 103, 103, 1.0),
              fontWeight: FontWeight.bold
              ),
        ),
        elevation: 0.0,
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          _personalInfo(context), // Contenido central
        ],
      ),
    );
  }


  Widget _personalInfo(BuildContext context) {
    final bloc = BlocProvider.profile(context); // ESTO HAY QUE CAMBIARLO ???
    final sizeScreen = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SizedBox(height: 20.0),
            CircleAvatar( // esto puede ser un floatingactionbutton
              // backgroundImage: ,
              radius: 40.0,
              child: Text('MP',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 30.0)),
              backgroundColor: Color.fromRGBO(255, 174, 0, 1.0),
            ),
            SizedBox(height: 20.0),
            Container(
              width: sizeScreen.width * 0.80,
              child: Column(
                children: [
                  // SizedBox(height: 50),
                  _modifyFirstName(bloc),
                  SizedBox(height: 10),
                  _modifyLastName(bloc),
                  SizedBox(height: 10),
                  _modifyEmail(bloc),
                  SizedBox(height: 10),
                  _modifyCity(bloc),
                  SizedBox(height: 10),
                  _modifyCellphone(bloc),
                  SizedBox(height: 10),
                  _modifyId(bloc),
                ],
              ),
            ),
            SizedBox(height: 30.0),
            RaisedButton(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 10.0),
                child: Text(
                  'Guardar Cambios',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              onPressed: () {
                // lógica para sobreescribir y guardar la información 
                Navigator.of(context).pushNamed('profile');
              },
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              elevation: 0.0,
              color: Color.fromRGBO(0, 208, 175, 1.0),
              textColor: Colors.white,
            ),
            SizedBox(height: 30.0)
          ],
        ),
      ),
    );
  }




  Widget _modifyFirstName(ProfileBloc bloc) {
    return StreamBuilder(
      stream: bloc.firstNameStream,
      builder: (context, snapshot) {
        return Container(
          child: TextField(
            decoration: InputDecoration(
              // icon: Icon(Icons.perm_identity, color: buttonColor),
              labelText: 'Nombres',
              hintText: 'Miguel', // Aquí se va a leer los datos previos
              errorText: snapshot.error,
            ),
            onChanged: (value) => bloc.changeFirstName(value),
          ),
        );
      },
    );
  }

  Widget _modifyLastName(ProfileBloc bloc) {
    return StreamBuilder(
      stream: bloc.lastNameStream,
      builder: (context, snapshot) {
        return Container(
          child: TextField(
            decoration: InputDecoration(
              // icon: Icon(Icons.perm_identity, color: buttonColor),
              labelText: 'Apellidos',
              hintText: 'Palacios', // Aquí se va a leer los datos previos
              errorText: snapshot.error,
            ),
            onChanged: (value) => bloc.changeLastName(value),
          ),
        );
      },
    );
  }

  Widget _modifyEmail(ProfileBloc bloc) {
    return StreamBuilder(
        stream: bloc.emailStream,
        builder: (context, snapshot) {
          return Container(
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                // icon: Icon(Icons.alternate_email, color: buttonColor),
                labelText: 'Correo',
                hintText: '1234@gmail.com', // Aquí se va a leer los datos previos
                errorText: snapshot.error,
              ),
              onChanged: (value) => bloc.changeEmail(value),
            ),
          );
        });
  }

  Widget _modifyCity(ProfileBloc bloc) {
    return StreamBuilder(
        stream: bloc.cityStream,
        builder: (context, snapshot) {
          return Container(
            child: TextField(
              decoration: InputDecoration(
                // icon: Icon(Icons.alternate_email, color: buttonColor),
                labelText: 'Ciudad',
                hintText: 'Medellín', // Aquí se va a leer los datos previos
                errorText: snapshot.error,
              ),
              onChanged: (value) => bloc.changeEmail(value),
            ),
          );
        });
  }

  Widget _modifyCellphone(ProfileBloc bloc) {
    return StreamBuilder(
        stream: bloc.phoneStream,
        builder: (context, snapshot) {
          return Container(
            child: TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                // icon: Icon(Icons.alternate_email, color: buttonColor),
                labelText: 'Celular',
                hintText: '+573055608598', // Aquí se va a leer los datos previos
                errorText: snapshot.error,
              ),
              onChanged: (value) => bloc.changeEmail(value),
            ),
          );
        });
  }

  Widget _modifyId(ProfileBloc bloc) {
    return StreamBuilder(
        stream: bloc.idStream,
        builder: (context, snapshot) {
          return Container(
            child: TextField(
              decoration: InputDecoration(
                // icon: Icon(Icons.alternate_email, color: buttonColor),
                labelText: 'Cédula',
                hintText: '', // Aquí se va a leer los datos previos
                errorText: snapshot.error,
              ),
              onChanged: (value) => bloc.changeEmail(value),
            ),
          );
        });
  }
}
