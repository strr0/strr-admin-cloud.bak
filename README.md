## strr-admin-cloud

### 项目介绍
- strr-admin-common 通用模块：基础CRUD封装及工具类
- strr-admin-generator 代码生成器 
- strr-admin-config-service 配置中心
- strr-admin-eureka-service 注册中心
- strr-admin-auth-service 授权服务器
- strr-admin-gateway-service 网关
- strr-admin-service 用户权限管理模块
- strr-admin-feign-service feign使用
- strr-admin-demo 示例

### 使用
1. 拉取代码
```
git clone https://github.com/strr0/strr-admin-cloud
```
2. 代码发布本地仓库
```
mvn deploy
```
3. 运行strr-admin-service模块的schema.sql文件
4. 新建maven项目引入依赖
```
pom.xml
...
    <properties>
        <maven.compiler.source>17</maven.compiler.source>
        <maven.compiler.target>17</maven.compiler.target>
        <spring-boot.version>3.0.0</spring-boot.version>
        <spring-cloud.version>2022.0.0</spring-cloud.version>
    </properties>

    <dependencyManagement>
        <dependencies>
            <dependency>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-dependencies</artifactId>
                <version>${spring-boot.version}</version>
                <type>pom</type>
                <scope>import</scope>
            </dependency>

            <dependency>
                <groupId>org.springframework.cloud</groupId>
                <artifactId>spring-cloud-dependencies</artifactId>
                <version>${spring-cloud.version}</version>
                <type>pom</type>
                <scope>import</scope>
            </dependency>
        </dependencies>
    </dependencyManagement>
...
```
5. 新建子maven模块配置中心
```
pom.xml
...
    <dependencies>
        <dependency>
            <groupId>com.strr</groupId>
            <artifactId>strr-admin-config-service</artifactId>
            <version>2.0-SNAPSHOT</version>
        </dependency>
    </dependencies>
...
```
```
application.yml 非必要

server:
  port: 8888
spring:
  profiles:
    active: native
  cloud:
    config:
      server:
        encrypt:
          enabled: false
        native:
          search-locations: classpath:config
encrypt:
  key: secret
```
```
@SpringBootApplication
@EnableConfigServer
public class ConfigServerApplication {
    public static void main(String[] args) {
        SpringApplication.run(ConfigServerApplication.class, args);
    }
}
```
6. 新建子maven模块注册中心
```
pom.xml
...
    <dependencies>
        <dependency>
            <groupId>com.strr</groupId>
            <artifactId>strr-admin-eureka-service</artifactId>
            <version>2.0-SNAPSHOT</version>
        </dependency>
    </dependencies>
...
```
```
application.yml 非必要

server:
  port: 8761
eureka:
  client:
    # eureka注册
    register-with-eureka: false
    # 本地缓存
    fetch-registry: false
  server:
    # 等待时间
    wait-time-in-ms-when-sync-empty: 5
```
```
@SpringBootApplication
@EnableEurekaServer
public class EurekaServerApplication {
    public static void main(String[] args) {
        SpringApplication.run(EurekaServerApplication.class, args);
    }
}
```
7. 新建maven子模块授权中心
```
pom.xml
...
    <dependencies>
        <dependency>
            <groupId>com.strr</groupId>
            <artifactId>strr-admin-auth-service</artifactId>
            <version>2.0-SNAPSHOT</version>
        </dependency>
    </dependencies>
...
```
```
application.yml 非必要

spring:
  application:
    name: authservice
  profiles:
    active: default
  config:
    import: optional:configserver:http://localhost:8888
encrypt:
  key: secret
```
```
@SpringBootApplication
public class AuthorizationServerApplication {
    public static void main(String[] args) {
        SpringApplication.run(AuthorizationServerApplication.class, args);
    }
}
```
8. 新建maven子模块网关
```
pom.xml
...
    <dependencies>
        <dependency>
            <groupId>com.strr</groupId>
            <artifactId>strr-admin-gateway-service</artifactId>
            <version>2.0-SNAPSHOT</version>
        </dependency>
    </dependencies>
...
```
```
application.yml
server:
  port: 8000
spring:
  application:
    name: gatewayservice
  cloud:
    gateway:
      discovery:
        locator:
          enabled: true
          lower-case-service-id: true
      default-filters:
        - TokenRelay
  security:
    oauth2:
      client:
        registration:
          gateway-client:
            provider: spring
            client-id: STRR_CLIENT
            client-secret: STRR_SECRET
            client-authentication-method: client_secret_basic
            authorization-grant-type: authorization_code
            redirect-uri: '{baseUrl}/login/oauth2/code/{registrationId}'
            scope: openid, web
            client-name: Spring
        provider:
          spring:
            issuer-uri: http://localhost:9000
eureka:
  instance:
    prefer-ip-address: true
  client:
    register-with-eureka: true
    fetch-registry: true
    service-url:
      defaultZone: http://localhost:8761/eureka
# web
url:
  web: http://127.0.0.1:8080  ### 根据实际前端跳转地址修改
```
```
@SpringBootApplication
public class GatewayServerApplication {
    public static void main(String[] args) {
        SpringApplication.run(GatewayServerApplication.class, args);
    }
}
```
8. 新建maven子模块用户权限管理
```
pom.xml
...
    <dependencies>
        <dependency>
            <groupId>com.strr</groupId>
            <artifactId>strr-admin-service</artifactId>
            <version>2.0-SNAPSHOT</version>
        </dependency>
    </dependencies>
...
```
```
application.yml 非必要

spring:
  application:
    name: adminservice
  profiles:
    active: default
  config:
    import: optional:configserver:http://localhost:8888
encrypt:
  key: secret
```
```
@SpringBootApplication
public class AdminServerApplication {
    public static void main(String[] args) {
        SpringApplication.run(AdminServerApplication.class, args);
    }
}
```
9. 服务间接口调用参考strr-admin-feign-service