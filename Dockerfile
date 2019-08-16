# =========================
# BUILD
# =========================
FROM tomcat:7-jdk8 AS build

WORKDIR /app

COPY . .

RUN find WEB-INF/classes -name "*.java" > sources.txt \
    && javac \
       -encoding UTF-8 \
       -cp "WEB-INF/lib/*:/usr/local/tomcat/lib/*" \
       -d WEB-INF/classes \
       @sources.txt


# =========================
# RUNTIME
# =========================
FROM tomcat:7-jre8

RUN rm -rf /usr/local/tomcat/webapps/ROOT

COPY --from=build /app /usr/local/tomcat/webapps/ROOT

EXPOSE 8080

CMD ["catalina.sh", "run"]