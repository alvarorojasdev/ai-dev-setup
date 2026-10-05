---
name: guardar-aprendizaje
description: Convierte lo aprendido en una sesión en una guía reutilizable en ~/Projects/dev/notas/guias. Usar cuando el usuario dice "guarda esto", "documenta lo que aprendimos", "haz una guía de esto" o al cerrar un trabajo con lecciones que sirven a futuro.
---

# guardar-aprendizaje

1. Extrae solo **conocimiento**, no la crónica: qué hacer, por qué (el mecanismo) y cómo verificarlo. Las trampas van con su causa ("falla porque…").
2. Antes de escribir, busca en `~/Projects/dev/notas/guias/` si ya hay una guía del tema: si existe, propón dónde integrarlo en vez de crear otra. Si algo contradice lo que ya está escrito, muéstrame las dos versiones y pregunta cuál vale.
3. Nada de datos personales, claves, nombres de terceros ni datos de una empresa.
4. Formato de las guías existentes: título, "En simple" al inicio de cada sección, y "[sin verificar]" donde corresponda.
5. Muéstrame el texto completo y espera mi OK antes de guardar. Después agrega una línea al log con `tools/log.sh guia "<qué se guardó>"` dentro de `~/Projects/dev/notas`.
