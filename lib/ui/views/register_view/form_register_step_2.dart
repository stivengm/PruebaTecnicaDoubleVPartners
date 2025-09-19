import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_doublevpartners/core/blocs/register/register_bloc.dart';

class FormRegisterStep2 extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const FormRegisterStep2({super.key, required this.formKey});

  @override
  State<FormRegisterStep2> createState() => _FormRegisterStep2State();
}

class _FormRegisterStep2State extends State<FormRegisterStep2> {
  final TextEditingController telefonoController = TextEditingController();
  final TextEditingController celularController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Datos de contacto",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 30.0),

          TextFormField(
            textInputAction: TextInputAction.next,
            controller: telefonoController,
            keyboardType: TextInputType.phone,
            autocorrect: false,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "El teléfono es obligatorio";
              }
              if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                return "Solo se permiten números";
              }
              if (value.length < 7) {
                return "El teléfono debe tener al menos 7 dígitos";
              }
              return null;
            },
            onSaved: (value) {
              context.read<RegisterBloc>().add(
                SavedForm2(telefono: value)
              );
            },
            decoration: InputDecoration(
              labelText: 'Teléfono',
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          const SizedBox(height: 15.0),

          TextFormField(
            textInputAction: TextInputAction.done,
            controller: celularController,
            keyboardType: TextInputType.phone,
            autocorrect: false,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "El celular es obligatorio";
              }
              if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                return "Solo se permiten números";
              }
              if (value.length != 10) {
                return "El celular debe tener 10 dígitos";
              }
              return null;
            },
            onSaved: (value) {
              context.read<RegisterBloc>().add(
                SavedForm2(celular: value)
              );
            },
            decoration: InputDecoration(
              labelText: 'Celular',
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
