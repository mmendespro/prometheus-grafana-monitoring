## MONITORING SPRING BOOT WITH PROMETHEUS AND GRAFANA

In a distributed landscape where we are working with microservices, serverless applications, or just event-driven architecture as a whole, observability, which comprises monitoring, logging, tracing, and alerting, is an important architectural concern.

There are a few reasons why we want visibility in our highly distributed systems:

- Issues will occur, even when our best employees have built it.
- Distributed systems generate distributed failures, which can be devastating when we are not prepared in advance.
- Reveal mistakes early, which is great for improvement and learning.
- It keeps us accountable.
- Reduce the mean time to resolution (MTTR).

In this poc I will explain the core concepts of Prometheus and Grafana and set up a demo project, so you can see how to do and implement monitoring in your own applications.

## SETUP SPRING BOOT

To demonstrate how to implement Prometheus and Grafana in your own projects, I will go through the steps to set up a basic Spring Boot application which we monitor by using Docker images of Prometheus and Grafana.

1. Set up a regular Spring Boot application by using Spring Initializr.

2. Add dependency for Actuator:
```shell-script
     <dependency>
         <groupId>org.springframework.boot</groupId>
         <artifactId>spring-boot-starter-actuator</artifactId>
     </dependency>
```
3. Add dependency for Micrometer
```shell-script
     <dependency>
         <groupId>io.micrometer</groupId>
         <artifactId>micrometer-registry-prometheus</artifactId>
         <version>1.5.5</version>
     </dependency>
```
4. Expose our needed Prometheus endpoint in the application.yaml file
```shell-script
management:
  endpoints:
    enabled-by-defaults: false
    web:
      exposure:
        include: health,prometheus
  endpoint:
    health:
      enabled: true
      show-details: ALWAYS
    prometheus:
      enabled: true
```
