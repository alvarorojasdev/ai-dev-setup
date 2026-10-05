#!/bin/bash
# Lanza el MCP de Chrome con un Node >= 22.12 explícito (el MCP lo exige y el Node por defecto de nvm puede ser más viejo).
# Ajusta NODE_DIR a tu instalación: `ls ~/.nvm/versions/node/` y elige una versión >= 22.12.
NODE_DIR="${NODE_DIR:-$HOME/.nvm/versions/node/v24.15.0}"
ENTRY="$NODE_DIR/lib/node_modules/chrome-devtools-mcp/build/src/bin/chrome-devtools-mcp.js"
exec "$NODE_DIR/bin/node" "$ENTRY" --autoConnect "$@"
