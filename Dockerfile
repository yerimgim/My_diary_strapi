FROM node:18

WORKDIR /app

COPY package.json yarn.lock ./

# root 사용자로 의존성 설치
RUN yarn install --frozen-lockfile

COPY . .

# 비root 사용자 추가 및 권한 설정
RUN adduser -D nonrootuser && \
    chown -R nonrootuser:nonrootuser /app

# 필요한 디렉토리 미리 생성 및 권한 부여
RUN mkdir -p /app/.strapi && \
    chown -R nonrootuser:nonrootuser /app/.strapi

USER nonrootuser

# Strapi 빌드
RUN yarn build --debug

EXPOSE 1337
CMD ["yarn", "start"]
