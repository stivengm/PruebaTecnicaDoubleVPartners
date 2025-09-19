import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_doublevpartners/core/blocs/register/register_bloc.dart';

class FormRegisterStep1 extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const FormRegisterStep1({super.key, required this.formKey});

  @override
  State<FormRegisterStep1> createState() => _FormRegisterStep1State();
}

class _FormRegisterStep1State extends State<FormRegisterStep1> {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController apellidoController = TextEditingController();
  final TextEditingController fechaNacimientoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Datos personales", style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 30.0),
          TextFormField(
            controller: nombreController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "El nombre es obligatorio";
              }
              if (value.trim().length < 2) {
                return "Debe tener al menos 2 caracteres";
              }
              return null;
            },
            onSaved: (value) {
              context.read<RegisterBloc>().add(
                SavedForm1(nombre: value)
              );
            },
            decoration: InputDecoration(
              labelText: 'Nombre',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),

          const SizedBox(height: 15.0),
          TextFormField(
            controller: apellidoController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "El apellido es obligatorio";
              }
              if (value.trim().length < 2) {
                return "Debe tener al menos 2 caracteres";
              }
              return null;
            },
            onSaved: (value) {
              context.read<RegisterBloc>().add(
                SavedForm1(apellido: value)
              );
            },
            decoration: InputDecoration(
              labelText: 'Apellido',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          const SizedBox(height: 15.0),
          TextFormField(
            controller: fechaNacimientoController,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.datetime,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "La fecha de nacimiento es obligatoria";
              }
              
              return null;
            },
            onSaved: (value) {
              context.read<RegisterBloc>().add(
                SavedForm1(fechaDeNacimiento: value)
              );
            },
            decoration: InputDecoration(
              labelText: 'Fecha de nacimiento (dd/mm/aaaa)',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          const SizedBox(height: 15.0),
        ],
      )
    );
  }
}