FROM node:18
# ARG NODE_ENV=production
WORKDIR /app
COPY package*.json ./
RUN yarn install --frozen-lockfile
ENV NODE_ENV production
COPY . .
USER node
RUN yarn build
EXPOSE 1337
CMD ["yarn", "start"]
