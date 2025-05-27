# tareas

Un nuevo proyecto Flutter.

## Getting Started

Este proyecto es un punto inicial para una aplicación Flutter.

Algunos recursos útiles si estás comenzando con Flutter:

- [Lab: Crea tu primera aplicación en Flutter](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Ejemplos prácticos en Flutter](https://docs.flutter.dev/cookbook)

Para obtener ayuda sobre el desarrollo con Flutter, visita la
[documentación oficial en línea](https://docs.flutter.dev/), que ofrece:

- Tutoriales paso a paso  
- Ejemplos funcionales  
- Guías para desarrollo en dispositivos móviles  
- Referencia completa de la API de Flutter

# Animaciones implementadas en la aplicación de tareas

Esta aplicación integra animaciones para ofrecer una mejor experiencia de usuario:

- **Cambio de color y opacidad al completar tareas**  
  Al marcar una tarea como completada, la tarjeta cambia a un color verde claro y su opacidad disminuye, lo cual indica visualmente que esa tarea ya ha sido realizada.

- **Rotación del ícono de estado de tarea**  
  El ícono que representa el estado de la tarea (completada o no) realiza una rotación de 180° al cambiar su estado, lo que refuerza visualmente la acción realizada.

- **Animación en el botón flotante (FAB)**  
  El botón flotante de la pantalla utiliza un `AnimatedIcon` que alterna entre los íconos de "agregar" y "evento" (calendario) al abrir o cerrar el modal de nueva tarea, brindando un cambio visual que indica el estado del formulario.

Estas animaciones mejoran la interacción general de la app, haciéndola más fluida, clara y atractiva para el usuario.
