FROM openjdk:22--rc-oracle

LABEL maintainer="zS23020596@estudiantes.uv.mx"

VOLUME /tmp

EXPOSE 8080

ARG JAR_FILE=target/SpringBootSecurityPostgresqlApplication-0.0.1-SNAPSHOT.jar
ADD ${JAR_FILE} antlr-api.jar

# Agregar las variables de entorno para pasar los secretos
ENV SPRING_DATASOURCE_URL=${SPRING_DATASOURCE_URL}
ENV SPRING_DATASOURCE_USERNAME=${SPRING_DATASOURCE_USERNAME}
ENV SPRING_DATASOURCE_PASSWORD=${SPRING_DATASOURCE_PASSWORD}
ENV JWT_SECRET=${JWT_SECRET}

ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/urandom", "-jar", "antlr-api.jar"]

