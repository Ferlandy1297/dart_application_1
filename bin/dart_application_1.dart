// Clase que representa a un empleado con su ID y nombre
class Empleado {
  int id;
  String nombre;

  Empleado(this.id, this.nombre);
}

// Clase Nodo que representa cada empleado en el árbol
class Nodo {
  Empleado empleado;
  Nodo? izquierda; // Referencia al subordinado izquierdo
  Nodo? derecha; // Referencia al subordinado derecho

  Nodo(this.empleado);
}

// Clase ArbolBinario que maneja la estructura del árbol
class ArbolBinario {
  Nodo? raiz; // Nodo raíz del árbol (Director General)

  // Método para insertar un nuevo empleado en el árbol
  void insertar(int id, String nombre) {
    Empleado nuevoEmpleado = Empleado(id, nombre);
    if (raiz == null) {
      raiz = Nodo(nuevoEmpleado);
    } else {
      _insertarRecursivo(raiz, nuevoEmpleado);
    }
  }

  void _insertarRecursivo(Nodo? nodo, Empleado empleado) {
    if (nodo == null) return;

    if (empleado.id < nodo.empleado.id) {
      // Insertar en el lado izquierdo si es menor
      if (nodo.izquierda == null) {
        nodo.izquierda = Nodo(empleado);
      } else {
        _insertarRecursivo(nodo.izquierda, empleado);
      }
    } else {
      // Insertar en el lado derecho si es mayor
      if (nodo.derecha == null) {
        nodo.derecha = Nodo(empleado);
      } else {
        _insertarRecursivo(nodo.derecha, empleado);
      }
    }
  }

  // Recorrido en Preorden (Raíz - Izquierda - Derecha)
  void preorden(Nodo? nodo) {
    if (nodo != null) {
      print("${nodo.empleado.id}: ${nodo.empleado.nombre}");
      preorden(nodo.izquierda);
      preorden(nodo.derecha);
    }
  }

  // Recorrido en Inorden (Izquierda - Raíz - Derecha)
  void inorden(Nodo? nodo) {
    if (nodo != null) {
      inorden(nodo.izquierda);
      print("${nodo.empleado.id}: ${nodo.empleado.nombre}");
      inorden(nodo.derecha);
    }
  }

  // Recorrido en Postorden (Izquierda - Derecha - Raíz)
  void postorden(Nodo? nodo) {
    if (nodo != null) {
      postorden(nodo.izquierda);
      postorden(nodo.derecha);
      print("${nodo.empleado.id}: ${nodo.empleado.nombre}");
    }
  }
}

// Función principal para probar el Árbol Binario
void main() {
  ArbolBinario empresa = ArbolBinario();

  // Insertando los empleados en el árbol
  empresa.insertar(50, "Director General");
  empresa.insertar(30, "Gerente de Finanzas");
  empresa.insertar(70, "Gerente de Tecnología");
  empresa.insertar(20, "Supervisor de Contabilidad");
  empresa.insertar(40, "Supervisor de Recursos Humanos");
  empresa.insertar(60, "Líder de Desarrollo");
  empresa.insertar(80, "Líder de Infraestructura");

  print("Recorrido Preorden:");
  empresa.preorden(empresa.raiz);

  print("\nRecorrido Inorden:");
  empresa.inorden(empresa.raiz);

  print("\nRecorrido Postorden:");
  empresa.postorden(empresa.raiz);
}
