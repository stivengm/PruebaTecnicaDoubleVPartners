import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:prueba_tecnica_doublevpartners/core/blocs/register/register_bloc.dart';
import 'package:prueba_tecnica_doublevpartners/ui/utils/app_colors.dart';
import 'package:prueba_tecnica_doublevpartners/ui/views/register_view/form_register_step_1.dart';
import 'package:prueba_tecnica_doublevpartners/ui/views/register_view/form_register_step_2.dart';
import 'package:prueba_tecnica_doublevpartners/ui/views/register_view/form_register_step_3.dart';
import 'package:prueba_tecnica_doublevpartners/ui/widgets/primary_button.widget.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final PageController _pageController = PageController();

  double _formOpacity = 1.0;
  double _successOpacity = 0.0;
  bool _showSuccess = false;

  Future<void> _handleFinish() async {
    setState(() => _formOpacity = 0.0);
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      _showSuccess = true;
      _successOpacity = 1.0;
    });

    await Future.delayed(const Duration(seconds: 2));

    setState(() => _successOpacity = 0.0);
    await Future.delayed(const Duration(seconds: 1));

    if (mounted) {
      Navigator.pushReplacementNamed(context, "home_view");
    }
  }

  @override
  Widget build(BuildContext context) {
    final paddingNotch = MediaQuery.of(context).padding;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
            top: paddingNotch.top,
            left: 20.0,
            right: 20.0,
            bottom: paddingNotch.bottom,
          ),
          child: BlocConsumer<RegisterBloc, RegisterState>(
            listener: (context, state) {
              if (state.isCompleted) {
                _handleFinish();
              }

              if (state.validationError != "") {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.validationError),
                    backgroundColor: Colors.red,
                  ),
                );
              }
              
              if (state.currentStep < 3) {
                _pageController.animateToPage(
                  state.currentStep,
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeInOut,
                );
              }
            },
            builder: (context, state) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedOpacity(
                    opacity: _formOpacity,
                    duration: const Duration(seconds: 1),
                    child: Column(
                      children: [
                        Text(
                          "Registro de usuario",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 30.0),
                        LinearPercentIndicator(
                          lineHeight: 16.0,
                          percent: (state.currentStep + 1) / 3,
                          animation: true,
                          animateFromLastPercent: true,
                          animationDuration: 500,
                          backgroundColor: Colors.grey,
                          progressColor: AppColors.primaryColor,
                          barRadius: const Radius.circular(10),
                          curve: Curves.easeInOut,
                        ),
                        const SizedBox(height: 30.0),

                        Expanded(
                          child: PageView(
                            controller: _pageController,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              FormRegisterStep1(formKey: state.formStep1Key),
                              FormRegisterStep2(formKey: state.formStep2Key),
                              Column(
                                children: [
                                  Expanded(
                                    child: FormRegisterStep3(formKey: state.formStep3Key)
                                  ),
                                  state.direcciones.isNotEmpty ? Expanded(
                                    child: ListView.builder(
                                      itemCount: state.direcciones.length,
                                      itemBuilder: (context, index) {
                                        final direccion = state.direcciones[index];
                                        return Card(
                                          child: ListTile(
                                            title: Text(direccion.direccion),
                                            subtitle: Text(
                                              "${direccion.complemento}, ${direccion.departamento}, ${direccion.municipio}",
                                            ),
                                            trailing: Icon(Icons.location_on, color: Colors.green),
                                          ),
                                        );
                                      },
                                    ),
                                  ) : const SizedBox(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Guardar dirección", style: Theme.of(context).textTheme.headlineMedium),
                                      IconButton(
                                        onPressed: () {
                                          if (state.formStep3Key.currentState?.validate() ?? false) {
                                            state.formStep3Key.currentState?.save();

                                            context.read<RegisterBloc>().add(SaveDireccion());
                                          }
                                        },
                                        icon: Icon(
                                          Icons.add
                                        )
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 15.0),
                                ],
                              ),
                            ],
                          ),
                        ),

                        if (state.currentStep > 0)
                          PrimaryButton(
                            text: "Atrás",
                            onPressed: () {
                              context.read<RegisterBloc>().add(PreviousStep());
                            },
                          ),
                        const SizedBox(height: 20.0),
                        PrimaryButton(
                          text: state.currentStep == 2 ? "Finalizar" : "Siguiente",
                          onPressed: () {
                            context.read<RegisterBloc>().add(NextStep());
                          },
                        ),
                      ],
                    ),
                  ),

                  if (_showSuccess)
                    AnimatedOpacity(
                      opacity: _successOpacity,
                      duration: const Duration(seconds: 1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.check_circle,
                              color: Colors.green, size: 100),
                          SizedBox(height: 20),
                          Text(
                            "Usuario registrado",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
