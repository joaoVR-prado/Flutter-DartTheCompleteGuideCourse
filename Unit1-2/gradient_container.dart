import 'package:flutter/material.dart';
import 'package:flutter_app_testing/dice_roller.dart';

//sizedbox = outro jeito de criar um padding. Cria uma box vazia apenas para dar o espaco

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

// Widget para a Tela roxa e texto
class GradientContainer extends StatelessWidget{
  const GradientContainer(this.color1, this.color2, {super.key});

  final List<int>color1;
  final List<int>color2;

  @override
  Widget build(context){
    return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
              Color.fromARGB(color1[0], color1[1], color1[2], color1[3]), 
              Color.fromARGB(color2[0], color2[1], color2[2], color2[3]) 
              ],
              begin: startAlignment,
              end: endAlignment
            ),
          ),
          child: const Center(
            child: DiceRoller(),
          ),
    );
  }
}