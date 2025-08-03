# Proyecto-SSIMCE

[README.md](https://github.com/user-attachments/files/21566596/README.md)
# SSIMCE - Sistema de Inventario Móvil

## 📱 Descripción
SSIMCE es una aplicación móvil Android para gestión de inventario integrada con MySQL. Permite gestionar entradas, salidas, envíos, irregularidades y catálogo de productos con comunicación en tiempo real con el servidor.

## 🚀 Funcionalidades Principales

### ✅ Módulos Completamente Funcionales

#### 📦 **Entradas**
- **PDA Entregas a Clientes** - Registro de entregas con irregularidades
- **PDA Surtido Tiendas** - Gestión de surtido con evidencia
- **PDA Loteo Jabas** - Loteo con códigos de barras Code 128
- **PDA Ropa** - Gestión de ropa con códigos específicos
- **Scanner personalizado** - Lectura automática de códigos con descripción inteligente

#### 📤 **Salidas**
- **PDA Salidas** - Control de salidas con validación de stock
- **Stock automático** - Visualización en tiempo real del inventario disponible
- **Validación de stock** - Previene salidas sin stock disponible
- **Limpieza automática** - Limpia stock después de guardar

#### 📋 **Envíos**
- **MRB (Mercancía Recibida)** - Registro con evidencia fotográfica/video
- **CT (Carga de Transporte)** - Gestión de carga con evidencia
- **Sincronización automática** - Datos enviados al servidor en tiempo real

#### ⚠️ **Irregularidades**
- **Registro local** - Almacenamiento en Room Database
- **Sincronización manual** - Envío al servidor cuando hay conexión
- **Evidencia multimedia** - Fotos y videos con Base64
- **Filtros y búsqueda** - Gestión eficiente de irregularidades

#### 👥 **Usuarios**
- **CRUD completo** - Crear, leer, actualizar, eliminar usuarios
- **Roles y permisos** - Admin, Supervisor, Rampero, Operador
- **Interfaz mejorada** - Diseño optimizado para cámara frontal
- **Texto azul** - Mejor visibilidad en listas

#### 📚 **Catálogo de Productos**
- **CRUD completo** - Gestión de productos sin imágenes
- **Búsqueda automática** - Auto-completado al presionar Enter
- **Selección de lista** - Carga automática de datos
- **Texto azul** - Mejor visibilidad en listas
- **Funcionalidad simplificada** - Sin opción de imagen para evitar errores

#### 📄 **Guía de Transporte**
- **Registro de datos** - Captura de información de guías
- **Sincronización con servidor** - Datos enviados a tabla `guia`
- **Parsing inteligente** - Extracción de datos de observaciones

## 🛠️ Tecnologías Utilizadas

### 📱 **Android (Kotlin)**
- **Volley** - Comunicación HTTP con el servidor
- **Room Database** - Almacenamiento local para irregularidades
- **ML Kit** - Escaneo de códigos de barras
- **FileProvider** - Acceso seguro a archivos
- **Base64** - Codificación de imágenes

### 🗄️ **Base de Datos**
- **MySQL** - Servidor de base de datos
- **PHP** - API REST para comunicación
- **JSON** - Formato de intercambio de datos

### 🔐 **Seguridad**
- **API Key** - Autenticación en todos los endpoints
- **Roles de usuario** - Control de acceso por perfil
- **Validación de datos** - Verificación en cliente y servidor

## 📊 Estructura de Base de Datos

### Tablas Principales
- `entradas` - Registro de entradas de inventario
- `salidas` - Registro de salidas de inventario
- `irregularidades` - Gestión de irregularidades con evidencia
- `catalogo_productos` - Catálogo de productos
- `usuarios` - Gestión de usuarios y roles
- `guia` - Datos de guías de transporte
- `v_stock_disponible` - Vista para cálculo de stock

## 🔧 Configuración del Servidor

### 📁 Estructura de Archivos PHP
```
htdocs/ssimce/
├── upload_imagen.php          # Subida de imágenes (deshabilitado)
├── guardar_producto.php       # CRUD productos
├── modificar_producto.php     # Modificar productos
├── eliminar_producto.php      # Eliminar productos
├── obtener_productos.php      # Obtener lista productos
├── buscar_producto.php        # Buscar producto por SKU
├── guardar_usuario.php        # CRUD usuarios
├── modificar_usuario.php      # Modificar usuarios
├── eliminar_usuario.php       # Eliminar usuarios
├── obtener_usuarios.php       # Obtener lista usuarios
├── guardar_entrada_*.php      # Entradas por tipo
├── guardar_salida.php         # Salidas de inventario
├── sincronizar_irregularidades.php # Sincronización
├── insertar_datos_guia.php    # Datos de guías
└── calcular_stock.php         # Cálculo de stock
```

### ⚙️ Configuración PHP
- **post_max_size**: 40M
- **upload_max_filesize**: 40M
- **memory_limit**: 512M
- **max_execution_time**: 120s

## 📱 Características de la App

### 🎨 **Interfaz de Usuario**
- **Diseño moderno** - Interfaz limpia y profesional
- **Colores consistentes** - Azul corporativo (#0965AE)
- **Texto azul** - Mejor visibilidad en listas
- **Responsive** - Adaptado para diferentes tamaños de pantalla

### 🔍 **Funcionalidades Avanzadas**
- **Scanner optimizado** - Sin delays, respuesta inmediata
- **Validación en tiempo real** - Stock disponible automático
- **Búsqueda inteligente** - Auto-completado de productos
- **Gestión de errores** - Mensajes claros y específicos

### 📊 **Reportes y Datos**
- **Stock en tiempo real** - Cálculo automático de inventario
- **Historial completo** - Registro de todas las operaciones
- **Evidencia multimedia** - Fotos y videos en irregularidades
- **Sincronización** - Datos actualizados automáticamente

## 🚀 Instalación y Configuración

### 📋 Requisitos Previos
- Android Studio
- XAMPP con PHP 8.2+
- MySQL 5.7+
- Dispositivo Android 6.0+

### ⚙️ Configuración del Servidor
1. **Copiar archivos PHP** a `htdocs/ssimce/`
2. **Configurar base de datos** MySQL
3. **Ejecutar scripts SQL** para crear tablas
4. **Verificar permisos** de escritura en directorios

### 📱 Configuración de la App
1. **Compilar proyecto** con Android Studio
2. **Instalar APK** en dispositivo
3. **Configurar IP del servidor** en constantes
4. **Probar conectividad** con el servidor

## 🔄 Estado Actual del Proyecto

### ✅ **Completado (100%)**
- ✅ Todas las actividades PDA funcionales
- ✅ CRUD completo de usuarios y productos
- ✅ Sistema de irregularidades con evidencia
- ✅ Gestión de envíos MRB/CT
- ✅ Control de salidas con validación de stock
- ✅ Scanner optimizado sin delays
- ✅ Interfaz mejorada con texto azul
- ✅ Sincronización con servidor MySQL
- ✅ Eliminación de funcionalidad de imágenes problemática

### 🎯 **Optimizaciones Aplicadas**
- ✅ Eliminación de opción de imagen en Catálogo de Productos
- ✅ Mejora de visibilidad con texto azul en listas
- ✅ Optimización del scanner para respuesta inmediata
- ✅ Simplificación de interfaz para mejor UX
- ✅ Corrección de errores de compilación

## 📞 Soporte

Para soporte técnico o reportar problemas:
- **Email**: soporte@ssimce.com
- **Documentación**: Ver archivos README específicos por módulo

---

**Versión**: 2.0.0  
**Última actualización**: Diciembre 2024  
**Estado**: ✅ Completamente funcional 
