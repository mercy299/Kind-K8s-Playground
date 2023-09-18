FROM node:20-alpine3.17 AS build-environment

ENV APP_HOME /opt/app
RUN mkdir ${APP_HOME}
WORKDIR ${APP_HOME}


COPY ["package*.json", "${APP_HOME}"]


RUN npm install

COPY [".", "${APP_HOME}"]

FROM build-environment AS final

# Set working directory for the final stage
WORKDIR ${APP_HOME}

EXPOSE 3000


CMD ["node", "main.js"]