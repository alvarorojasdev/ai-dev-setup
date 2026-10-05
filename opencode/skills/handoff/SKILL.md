---
name: handoff
description: Generar un mensaje o resumen NO técnico listo para reenviar a producto, a un cliente, o a alguien que no es de tecnología. Activar cuando el usuario pide "dame un mensaje para producto", "armame algo para pasarle a X", "un mensaje no técnico", "resumen para reenviar", "mensaje corto para mandar/copiar", "pasalo a un txt", "qué le digo a", o pide un handoff/.txt con lo encontrado en una investigación. NO activar si el user pide un análisis técnico para él mismo o un mensaje de commit/MR (eso es /commit).
---

# handoff

Genera un mensaje listo para que el usuario lo **copie y reenvíe** a alguien (producto, un cliente, un compañero no-técnico) o lo guarde como `.txt` de handoff. El objetivo es que salga bien **a la primera**, sin las iteraciones de "sacá esto / más corto / sin tecnicismos".

## Paso 1 — Confirmar destinatario y largo ANTES de redactar

Antes de escribir una sola línea, confirmar en UNA pregunta compacta (no un interrogatorio):

- **¿Para quién es?** (producto / cliente / compañero / jefe / otro Claude) — el tono y el nivel de detalle dependen de esto, y adivinarlo sale mal (caso real: "el texto no es para betty").
- **¿Qué largo?** (ultra-corto de 3-4 líneas / medio / completo). Default si no contesta: ultra-corto.
- **Formato**: inline (default) o archivo `.txt` — esto sí se infiere sin preguntar: si el user dice "txt", "en un archivo", o "para pasar a otra conversación", escribir un `.txt` en el cwd.

**Excepción**: si el pedido ya trae destinatario Y largo ("mensaje corto para producto"), no preguntar nada y arrancar. Destinatario "traído" = nombrado en el pedido actual, no deducido de la conversación. Ante deducción → preguntar igual.

## Paso 2 — Reglas de contenido (DURAS, no negociables)

**Formato de texto** (de [[feedback_forwardable_messages]]):
- **Texto plano.** SIN blockquotes (`>`), SIN code blocks (` ``` `), SIN adornos markdown que se copien visualmente feo al pegar en WhatsApp/email/Slack.
- Separar versiones alternativas con `---` o títulos cortos ("Más corto:" / "Más completo:") está OK.

**Qué incluir y qué NO** (de [[feedback_handoff_no_extras]]):
- Incluir SOLO los datos encontrados / lo que el user pidió comunicar.
- **NO agregar**: recomendaciones, "puntos para producto", "acciones sugeridas", "qué habría que hacer", extrapolaciones a otros casos, "qué tan común es esto", métricas hipotéticas, ni hipótesis/deducciones sin un dato concreto detrás.
- Si el user quiere recomendaciones, las va a pedir en otro paso.

**Ni agregar ni recortar por cuenta propia:**
- Lo que el user mencionó como hallazgo VA en el mensaje — no dropear contenido para acortar sin avisar (caso real: "sacaste cosas que no te dije"). Si el largo pedido obliga a dejar algo afuera, cerrarlo con una línea aparte (que NO es parte del mensaje reenviable): "Quedó afuera: X, Y — avisame si lo sumo".

**Si ya hubo un handoff antes en esta misma conversación:**
- Default = SOLO lo nuevo desde el último mensaje enviado (el destinatario ya leyó lo anterior; caso real: "omite lo que ya dijimos en el primer txt"). Avisarlo: "va solo lo nuevo; si querés el resumen completo, avisame".

**Registro y tono:**
- **No técnico**: sin nombres de archivos, funciones, colecciones, stack traces ni jerga de código. Explicar en términos de negocio/producto/usuario.
- **Sin promesas de fecha** de arreglo ("les confirmamos cuando esté listo", "lo arreglamos mañana") salvo que el user lo pida explícitamente.
- **Español neutro** (es para terceros), no rioplatense.

## Paso 3 — Estructura por defecto

1. **Qué pasó** — 1-2 líneas, en lenguaje de negocio.
2. **Detalle / casos** — si hay varios casos o datos (montos, propiedades, fechas), una **tabla simple en texto** o lista corta.
3. **Estado** (opcional) — qué se está mirando/haciendo, SIN prometer fecha.

Mantenerlo **corto por defecto**. Si tiene sentido, ofrecer al final una versión "más corta" y una "más completa" para que el user elija.

## Paso 4 — Entregar e iterar

- Mostrar el mensaje en texto plano (o confirmar la ruta del `.txt` creado).
- El user va a iterar ("más corto", "sacá lo del X", "agregá Y"). Aplicar el cambio puntual sin reescribir todo de cero.

## Casos edge

- **El user pega evidencia técnica cruda** (logs, stacktrace, query) y pide "esto para producto": traducir a lenguaje de negocio, NO pegar lo técnico.
- **Pide `.txt` para otra sesión de Claude** (handoff entre conversaciones): ahí SÍ puede ser más técnico y completo (el destinatario es otro Claude, no un humano no-dev). Es handoff a otro Claude SOLO si el user menciona "otra conversación/sesión/Claude/contexto". En cualquier otro caso de .txt, asumir humano no-técnico.
- **Mensaje en respuesta a uno recibido**: si el user pega el mensaje del otro, responder en el mismo registro y largo (corto si el otro fue corto).
