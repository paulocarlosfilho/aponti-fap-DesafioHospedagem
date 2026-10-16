FROM node:20-alpine

WORKDIR /app

# Copia os manifestos do npm
COPY package*.json ./

# Instala as dependências de forma limpa
RUN npm install

# Copia o código-fonte do backend
COPY . .

# Compila o projeto TypeScript para JavaScript (gerando a pasta dist)
RUN npm run build

# Expõe a porta usada pela API
EXPOSE 3000

# Executa as migrações do banco e inicia a aplicação
CMD ["node", "dist/server.js"]