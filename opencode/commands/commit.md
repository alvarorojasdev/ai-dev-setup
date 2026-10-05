---
description: Propone el mensaje de commit (Conventional Commits, español) a partir del diff staged y espera OK antes de commitear
---
Cambios staged:
!`git diff --staged --stat`
!`git diff --staged`
Rama actual: !`git rev-parse --abbrev-ref HEAD`

Redacta UN mensaje de commit en español neutro con formato `tipo(scope): descripción corta` (feat, fix, chore, refactor, docs, test), scope por el área funcional del producto, y un cuerpo breve que diga qué cambió y por qué. Reglas: nunca agregar firmas de IA ni "Co-Authored-By"; si la rama es main/master/develop, avisa y propone un nombre de rama en vez de commitear; si hay archivos sin stagear, lístalos y pregunta si entran. Muestra el mensaje y pregunta "¿Lo commiteo?". No ejecutes `git commit` ni `git push` sin mi OK explícito en este turno.
