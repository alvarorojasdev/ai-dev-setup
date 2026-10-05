---
paths:
  - "**/*.{ts,tsx,js,jsx,py}"
---

# Tests antes de cambiar código

Antes de modificar, decidir qué tipo de cambio es:

- **Bug o algo nuevo (red/green)**: primero un test que reproduzca el bug o pida lo nuevo, y que **falle**; recién después el cambio, y el test pasa. Si no logro que falle, todavía no entendí el bug.
- **Refactor (mismo comportamiento)**: antes de tocar, correr los tests que cubren esa parte y verlos en **verde**; si no hay, proponer primero un test que fije el comportamiento actual. Después del refactor, esos mismos tests siguen en verde **sin modificarlos**: si hubo que cambiarlos, no fue un refactor.
- Si el repo tiene tests, úsalos. Si no tiene, no armes infraestructura de tests sin OK; di cómo se verificó a mano.
- Un test nuevo es un archivo más en el MR: va anunciado en el plan como parte de la variante mínima, nunca agregado en silencio.
