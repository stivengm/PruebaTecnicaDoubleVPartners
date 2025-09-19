import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_doublevpartners/core/blocs/register/register_bloc.dart';

class FormRegisterStep3 extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const FormRegisterStep3({super.key, required this.formKey});

  @override
  State<FormRegisterStep3> createState() => _FormRegisterStep3State();
}

class _FormRegisterStep3State extends State<FormRegisterStep3> {
  final TextEditingController direccionController = TextEditingController();
  final TextEditingController complementoController = TextEditingController();
  final TextEditingController departamentoController = TextEditingController();
  final TextEditingController municipioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: widget.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Datos de ubicación",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 30.0),
      
            TextFormField(
              textInputAction: TextInputAction.next,
              controller: direccionController,
              keyboardType: TextInputType.text,
              autocorrect: false,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "La dirección es obligatoria";
                }
                if (value.length < 5) {
                  return "La dirección debe tener al menos 5 caracteres";
                }
                return null;
              },
              onSaved: (value) {
                context.read<RegisterBloc>().add(
                  SavedForm3(direccion: value)
                );

                direccionController.clear(); 
              },
              decoration: InputDecoration(
                labelText: 'Dirección',
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 15.0),
      
            TextFormField(
              textInputAction: TextInputAction.next,
              controller: complementoController,
              keyboardType: TextInputType.text,
              autocorrect: false,
              decoration: InputDecoration(
                labelText: 'Complemento de dirección',
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onSaved: (value) {
                context.read<RegisterBloc>().add(
                  SavedForm3(complemento: value)
                );

                complementoController.clear(); 
              },
            ),
            const SizedBox(height: 15.0),
      
            TextFormField(
              textInputAction: TextInputAction.next,
              controller: departamentoController,
              keyboardType: TextInputType.text,
              autocorrect: false,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "El departamento es obligatorio";
                }
                return null;
              },
              onSaved: (value) {
                context.read<RegisterBloc>().add(
                  SavedForm3(departamento: value)
                );

                departamentoController.clear();
              },
              decoration: InputDecoration(
                labelText: 'Departamento',
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 15.0),
      
            TextFormField(
              textInputAction: TextInputAction.done,
              controller: municipioController,
              keyboardType: TextInputType.text,
              autocorrect: false,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "El municipio es obligatorio";
                }
                return null;
              },
              onSaved: (value) {
                context.read<RegisterBloc>().add(
                  SavedForm3(municipio: value)
                );
                
                municipioController.clear(); 
              },
              decoration: InputDecoration(
                labelText: 'Municipio',
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
