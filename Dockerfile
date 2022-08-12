FROM  openjdk:alpine

RUN apk add maven 

COPY . ./ 

ENV SERVERDIRNAME reviews
ARG service_version
ARG enable_ratings
ARG star_color
ENV SERVICE_VERSION ${service_version:-v1}
ENV ENABLE_RATINGS ${enable_ratings:-false}
ENV STAR_COLOR ${star_color:-black}

RUN mvn liberty:build
CMD ["mvn", "liberty:run"]