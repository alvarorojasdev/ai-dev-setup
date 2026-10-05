---
paths:
  - "**/*.{ts,tsx,js,jsx,py}"
---

# Ordenar antes de cambiar (Kent Beck, Tidy First?, adaptado)

Un commit ordena (estructura) o cambia lo que hace el código (comportamiento): nunca las dos cosas.

**Default: no ordenar.** Manda feedback_minimal_changes. Solo se ordena si hace ESTE cambio
más fácil o más seguro de revisar, y es chico (minutos, pocas líneas; más de ~1 hora = perdí el mínimo).
- Lo que no ayuda a este cambio → "Observación (fuera de scope)" en el plan. No se toca.
- Lo que sí ayuda → paso propio en el plan, anunciado y con OK.

**Cómo:**
1. Commit `refactor(scope): …` solo con el orden. Los tests existentes pasan sin tocarlos.
2. Commit `fix|feat(scope): …` con el cambio real, que queda solo y visible.
- Mismo MR, 2 commits: el de orden y el del cambio real. El MR se titula con el commit del cambio real.
  commit del cambio real; el de orden se nombra en la descripción.
- Repo sin tests (todos salvo backend, agent-frontent y models): solo orden seguro por sí mismo
  (borrar código que un grep confirma sin uso, renombrar algo local) o nada.
- MR dual main+dev: no ordenar (dev puede estar muy atrás y el cherry-pick choca).
- Si quedó mezclado: propongo rehacerlo, orden primero. Con OK, nunca descartando trabajo sin preguntar.

**Cuenta como ordenar:** salir temprano de una función, borrar código muerto, renombrar para que se
entienda, nombre a un número mágico, extraer una función chica, juntar una variable con su primer uso.
**No:** comentarios explicativos (choca con feedback_code_comments), reformatear o reordenar
archivos enteros (el hook de Prettier está apagado a propósito), mover archivos o imports sin necesidad.
