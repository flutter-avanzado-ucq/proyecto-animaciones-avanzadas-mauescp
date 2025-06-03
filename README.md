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
  Al marcar una tarea como completada, la tarjeta cambia a un color morado y su opacidad disminuye, lo cual indica visualmente que esa tarea ya ha sido realizada.

- **Rotación del ícono de estado de tarea**  
  El ícono que representa el estado de la tarea (completada o no) realiza una rotación de 180° al cambiar su estado, lo que refuerza visualmente la acción realizada.

- **Animación en el botón flotante (FAB)**  
  El botón flotante de la pantalla utiliza un `AnimatedIcon` que alterna entre los íconos de "agregar" y "evento" (calendario) al abrir o cerrar el modal de nueva tarea, brindando un cambio visual que indica el estado del formulario.

- **Animaciones de entrada de tareas**  
  Cada nueva tarea aparece con una animación de deslizamiento y desvanecimiento, creando una transición suave cuando se agregan elementos a la lista.

- **Funcionalidad de deslizar para eliminar**  
  Las tareas pueden eliminarse deslizándolas de derecha a izquierda, revelando un fondo rojo con un ícono de papelera que indica visualmente la acción de eliminar. Esta interacción proporciona una forma intuitiva y rápida de eliminar tareas sin necesidad de presionar botones adicionales.

- **Cambio de colores según el estado**  
  Las tareas nuevas se muestran con un fondo naranja, mientras que las tareas completadas cambian a un color morado, facilitando la identificación visual del estado de cada tarea.

Estas animaciones y gestos mejoran la interacción general de la app, haciéndola más fluida, clara y atractiva para el usuario, además de proporcionar retroalimentación visual inmediata sobre las acciones realizadas.