---
description: Review senior de los cambios actuales (working tree + staged) con tono crítico, sin editar nada
agent: revisor
subtask: true
---
Diff actual:
!`git diff`
!`git diff --staged`

Haz un review senior, crítico y concreto, sin editar archivos. Para cada hallazgo: archivo y línea, qué puede fallar (escenario concreto de entrada → salida incorrecta), gravedad, y la corrección mínima. Cubre bugs, casos borde, seguridad, cambios de contrato hacia otros consumidores y simplificaciones. Ordena de mayor a menor gravedad y termina con una lista corta de lo que verificarías a mano antes de mergear. Si no hay nada grave, dilo en una línea.
