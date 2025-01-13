import 'package:fitapp/models/exercise.dart';
import 'package:fitapp/models/category.dart';
import 'package:flutter/material.dart';

List<Category> dummyCategories = [
  Category(
    id: 'c1',
    title: 'Cardio',
    color: Colors.red[900]!, // Rojo oscuro
  ),
  Category(
    id: 'c2',
    title: 'Fuerza',
    color: Colors.blue[800]!, // Azul oscuro
  ),
  Category(
    id: 'c3',
    title: 'Flexibilidad',
    color: Colors.green[600]!, // Verde
  ),
  Category(
    id: 'c4',
    title: 'Equilibrio',
    color: Colors.orange[700]!, // Naranja
  ),
  Category(
    id: 'c5',
    title: 'HIIT',
    color: Colors.purple[800]!, // Púrpura
  ),
  Category(
    id: 'c6',
    title: 'Funcional',
    color: Colors.teal[600]!, // Verde azulado
  ),
  Category(
    id: 'c7',
    title: 'Pilates',
    color: Colors.pink[400]!, // Rosa
  ),
];

const dummyExercises = [
  Exercise(
    id: 'e1',
    categories: ['c1'],
    title: 'Correr',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a8/Flickr_cc_runner_wisconsin_u.jpg/1200px-Flickr_cc_runner_wisconsin_u.jpg',
    description:
        'Correr es una excelente forma de mejorar tu resistencia cardiovascular.',
    repetitions: 'N/A', // No aplicable para cardio
    sets: 'N/A', // No aplicable para cardio
    duration: 30, // Duración en minutos
    complexity: Complexity.easy,
    isBeginnerFriendly: true,
    isNoEquipmentNeeded: true,
    isHighIntensity: true,
    isLowImpact: false,
  ),
  Exercise(
    id: 'e2',
    categories: ['c2'],
    title: 'Flexiones',
    imageUrl:
        'https://static.wixstatic.com/media/19144d_7fe147b316c546959efe970c4a2c2e94~mv2.jpg/v1/fill/w_980,h_686,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/19144d_7fe147b316c546959efe970c4a2c2e94~mv2.jpg',
    description:
        'Las flexiones son un ejercicio básico para fortalecer el pecho y los brazos.',
    repetitions: '10-15',
    sets: '3',
    duration: 15,
    complexity: Complexity.medium,
    isBeginnerFriendly: false,
    isNoEquipmentNeeded: true,
    isHighIntensity: false,
    isLowImpact: false,
  ),
  Exercise(
    id: 'e3',
    categories: ['c3'],
    title: 'Estiramientos de Cadera',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQStBHFxVUh8dfAIA-KPu_7ioR9X-fTZOT0Hw&s',
    description:
        'Los estiramientos de cadera ayudan a mejorar la flexibilidad y prevenir lesiones.',
    repetitions: 'N/A', // No aplicable para estiramientos
    sets: 'N/A', // No aplicable para estiramientos
    duration: 10,
    complexity: Complexity.easy,
    isBeginnerFriendly: true,
    isNoEquipmentNeeded: true,
    isHighIntensity: false,
    isLowImpact: true,
  ),
  Exercise(
    id: 'e4',
    categories: ['c4'],
    title: 'Yoga en Pie',
    imageUrl:
        'https://www.haceryogaencasa.com/wp-content/uploads/Secuencia-de-pie-posturas-de-yoga-basicas.jpg',
    description:
        'El yoga en pie mejora el equilibrio y la concentración mientras tonifica los músculos.',
    repetitions: 'N/A', // No aplicable para yoga
    sets: 'N/A', // No aplicable para yoga
    duration: 20,
    complexity: Complexity.medium,
    isBeginnerFriendly: true,
    isNoEquipmentNeeded: true,
    isHighIntensity: false,
    isLowImpact: true,
  ),
  Exercise(
    id: 'e5',
    categories: ['c5'],
    title: 'Burpees',
    imageUrl:
        'https://s1.abcstatics.com/media/bienestar/2019/08/01/Burpees-infografia-1-k0vH-U3028395032930xD-510x460@abc.jpg',
    description:
        'Un ejercicio de cuerpo completo que mejora la resistencia y quema calorías rápidamente.',
    repetitions: '10-12',
    sets: '3-4',
    duration: 20,
    complexity: Complexity.hard,
    isBeginnerFriendly: false,
    isNoEquipmentNeeded: true,
    isHighIntensity: true,
    isLowImpact: false,
  ),
  Exercise(
    id: 'e6',
    categories: ['c6'],
    title: 'Sentadillas con Peso Corporal',
    imageUrl:
        'https://eresfitness.com/wp-content/uploads/11971105-Squat-m_Thighs_max.webp',
    description:
        'Las sentadillas son fundamentales para fortalecer las piernas y glúteos.',
    repetitions: '12-15',
    sets: '3-4',
    duration: 15,
    complexity: Complexity.easy,
    isBeginnerFriendly: true,
    isNoEquipmentNeeded: true,
    isHighIntensity: false,
    isLowImpact: true,
  ),
  Exercise(
    id: 'e7',
    categories: ['c7'],
    title: 'Roll Up en Pilates',
    imageUrl:
        'https://corebody.ca/wp-content/uploads/2022/06/pilates-roll-up.jpg',
    description:
        'Un ejercicio clásico de Pilates que mejora la flexibilidad de la columna.',
    repetitions: '8-10',
    sets: '3-4',
    duration: 15,
    complexity: Complexity.medium,
    isBeginnerFriendly: true,
    isNoEquipmentNeeded: true,
    isHighIntensity: false,
    isLowImpact: true,
  ),
  Exercise(
    id: 'e8',
    categories: ['c1'],
    title: 'Saltar la Cuerda',
    imageUrl:
        'https://media.istockphoto.com/id/926239494/es/vector/cuerda-de-saltar-ejercicio-vector-conjunto-de-caracteres.jpg?s=612x612&w=0&k=20&c=BPcE5eIQaNbp3L358r2Ji2paSKlsbaq1gAGdqiDGArI=',
    description:
        'Un excelente ejercicio cardiovascular que también mejora la coordinación.',
    repetitions: 'N/A', // No aplicable para cardio
    sets: 'N/A', // No aplicable para cardio
    duration: 20,
    complexity: Complexity.easy,
    isBeginnerFriendly: true,
    isNoEquipmentNeeded: false,
    isHighIntensity: true,
    isLowImpact: false,
  ),
  Exercise(
    id: 'e9',
    categories: ['c2'],
    title: 'Levantamiento de Pesas',
    imageUrl:
        'https://media.istockphoto.com/id/1203011520/es/vector/levantador-de-pesas-levanta-gran-campana-silueta-vectorial-aislada-dibujo-de-tinta.jpg?s=612x612&w=0&k=20&c=Lq92sy7NYYuFiZdc57rR5Sgbv06M63iuSbubnX-4xCU=',
    description: 'Un ejercicio fundamental para aumentar la fuerza muscular.',
    repetitions: '8-12',
    sets: '3-4',
    duration: 30,
    complexity: Complexity.hard,
    isBeginnerFriendly: false,
    isNoEquipmentNeeded: false,
    isHighIntensity: true,
    isLowImpact: false,
  ),
  Exercise(
    id: 'e10',
    categories: ['c3'],
    title: 'Estiramiento del Cuadriceps',
    imageUrl:
        'https://media.istockphoto.com/id/1154569404/es/vector/diagrama-de-ejercicio-sobre-el-estiramiento-del-cu%C3%A1driceps-mientras-est%C3%A1-de-pie.jpg?s=612x612&w=0&k=20&c=_xwnGKNJK2LLsbVFPwZVjNi7b2uERqsoFrpSdaAJFTI=',
    description:
        'Un estiramiento esencial para mantener la flexibilidad en las piernas.',
    repetitions: 'N/A', // No aplicable para estiramientos
    sets: 'N/A', // No aplicable para estiramientos
    duration: 5,
    complexity: Complexity.easy,
    isBeginnerFriendly: true,
    isNoEquipmentNeeded: true,
    isHighIntensity: false,
    isLowImpact: true,
  ),
];
