# Sistema de Gestión de Transporte Público

Este es un proyecto Flutter que implementa un sistema de gestión de transporte público con diferentes funcionalidades.

## Características

El sistema incluye las siguientes funcionalidades:

### 1. Calcular Tarifa de Viaje
- Permite calcular la tarifa según la distancia del viaje
- Aplica descuentos según el tipo de pasajero:
  - Regular: sin descuento
  - Estudiante: 25% de descuento
  - Adulto Mayor: 50% de descuento
  - Persona con Discapacidad: 100% de descuento (gratuito)
- Tarifa base: $1.50
- Costo adicional por km: $0.30

### 2. Calcular Distancia de Ruta
- Calcula la distancia total de una ruta usando la fórmula: Distancia = Velocidad × Tiempo
- Requiere velocidad promedio (km/h) y tiempo de viaje (horas)

### 3. Calcular Costo por Pasajero
- Divide el costo total del viaje entre el número de pasajeros
- Útil para calcular viajes compartidos o charter

### 4. Programar Horarios de Bus
- Calcula el número total de buses necesarios para una ruta
- Basado en el intervalo entre buses y las horas de operación
- Muestra el tiempo del último bus

## Tecnologías Utilizadas

- **Flutter**: Framework de desarrollo
- **go_router**: Sistema de navegación entre pantallas
- **Material Design 3**: Interfaz de usuario

## Estructura del Proyecto

```
lib/
├── main.dart                      # Punto de entrada de la aplicación
├── app_router.dart                # Configuración de rutas
└── pages/
    ├── transport_home_page.dart       # Página principal
    ├── fare_calculator_page.dart      # Calculadora de tarifas
    ├── route_distance_page.dart       # Calculadora de distancias
    ├── passenger_cost_page.dart       # Costo por pasajero
    └── schedule_planner_page.dart     # Planificador de horarios
```

## Cómo Ejecutar

1. Asegúrate de tener Flutter instalado
2. Navega al directorio del proyecto
3. Ejecuta `flutter pub get` para instalar dependencias
4. Ejecuta `flutter run` para iniciar la aplicación

## Autor

Proyecto de ejemplo - Sistema de Gestión de Transporte Público
