import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_doublevpartners/core/blocs/register/register_bloc.dart';
import 'package:prueba_tecnica_doublevpartners/ui/utils/app_styles.dart';
import 'package:prueba_tecnica_doublevpartners/ui/widgets/rich_text_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: AppStyles.defaultPadding,
        child: BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Información ingresada y guardada:",
                  style: Theme.of(
                    context,
                  ).textTheme.headlineSmall!.copyWith(fontSize: 19.0),
                ),
                const SizedBox(height: 10.0),
                RichTextWidget(title: "Nombre", text: state.nombre),
                RichTextWidget(title: "Apellido", text: state.apellido),
                RichTextWidget(title: "Fecha de Nacimiento", text: state.fechaDeNacimiento),
                RichTextWidget(title: "Número de teléfono", text: state.telefono),
                RichTextWidget(title: "Número de celular", text: state.celular),

                const SizedBox(height: 30.0),
                Text(
                  "Direcciones:",
                  style: Theme.of(
                    context,
                  ).textTheme.headlineSmall!.copyWith(fontSize: 19.0),
                ),
                const SizedBox(height: 10.0),

                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.direcciones.length,
                  itemBuilder: (context, index) {
                    final direccion = state.direcciones[index];
                    return Card(
                      child: ListTile(
                        title: Text(direccion.direccion),
                        subtitle: Text(
                          "${direccion.complemento}, ${direccion.departamento}, ${direccion.municipio}",
                        ),
                        trailing: const Icon(Icons.location_on, color: Colors.green),
                      ),
                    );
                  },
                ),

              ],
            );
          },
        ),
      ),
    );
  }
}
