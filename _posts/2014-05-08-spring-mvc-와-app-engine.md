---
layout: post
title: "Spring MVC와 Google App Engine"
date: 2014-05-08 11:14:00 +0900
categories: blog
tags: Digital Nomad  프로그래밍  하드보일드
---

회사 PaaS 인 cloulu가 서비스를 종료함에 따라 poklog 3의 새로운 안식처가 필요해졌다. [구글 앱엔진 관련글](/blog/2013/07/09/start-app-engine.html)에서도 언급했듯이 차기 PaaS로 구글 앱 엔진을 생각하고 있었고 웹 프레임워크로 Sinatra와 유사한 spark 프레임워크를 생각하고 있었는데, 자료가 많고 대중적이라는 장점때문에 Spring MVC와 Google App Engine 조합을 최종 선택하게 되었다.

Spring MVC
----------
항상 스프링은 복잡하다는 생각을 하고 있었는데, 복잡하기는 하지만 자료가 많고 기본 개념이 깔끔하다. 생각보다 훨씬 만족. 단점이라면 역시 복잡하다는 것인데(\-\_\-),

 * 편의 기능 제공되고 그에 따라 라이브러리의 복잡성이 증가되는것은 당연한 일이지만, 스프링은 복잡해지는 과정이 기존의 단순했던 방법과 연관성이 없어, 중간단계의 복잡성과 편의성을 취하는것이 불가능하다.
 * 이러한 현상은 어노테이션 기능을 통해 편의 기능이 제공되는 Controller에서 특히 두드러지며, 어노테이션을 쓰지 않고 pathParameter처럼 쓰기 위해서는 직접 uri parser를 만들어야 한다.
 * 개인적으로 중간 단계에 [Spring MVC REST](http://spring-mvc-rest.sourceforge.net/introduction.html)가 같은 객체가 Spring 메인버전에 포함되어 있는것이 좋겠다는 생각이 든다.

그래서, 스프링을 사용하는 전략은

 * 없어도 되는것을 추가 하지 않고 최소한의 설정만으로 설정파일을 구성한다.
     * 되도록이면 암묵적으로 사용하는 default 객체를 사용
     * UrlHandler는 BeanNameUrlHandlerMapping 사용
     * View Resolver는 InternalResourceViewResolver 사용
 * Spring framework 소스에 최대한 비지니스 로직을 사용하지 않는다.
     * Spring framework는 Dependency와 생명주기 관리만으로 최소화
     * Controller는 URL parsing/dispatching 에만 집중
     * View는 반응형 Web UI(Foundation)를 적극활용
     * 비지니스 로직과 모델은 스프링과 상관없은 POD로 사용

스프링 자체가 의존성/생명주기 관리가 깔끔하여 위의 전략만으로도 깔끔하게 내 주요 관심사에 집중해서 개발할 수 있었다.

GAE와의 연동
----------
기본적으로 eclipse의 Goole App Engine 개발환경을 사용하여 프로젝트를 만들고 개발하였고, Spring은 외부 라이브러리를 사용하는것처럼 사용하였다. 외부 라이브러리처럼 사용하기 위해 maven은 단순히 dependent-jar를 다운받게 구성였다. poklog v3 자체가 md를 렌더링하기 때문에 maven에 pegdown 라이브러리도 추가 구성하였다.

```xml

<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>
  <groupId>net.poksion</groupId>
  <artifactId>poksion-net-dependencies</artifactId>
  <version>1.0</version>
  <properties>
    <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    <spring.version>3.2.8.RELEASE</spring.version>
  </properties>
  <dependencies>
    <!-- Spring 3 dependencies -->
    <dependency>
      <groupId>org.springframework</groupId>
      <artifactId>spring-core</artifactId>
      <version>${spring.version}</version>
    </dependency>

    <dependency>
      <groupId>org.springframework</groupId>
      <artifactId>spring-web</artifactId>
      <version>${spring.version}</version>
    </dependency>

    <dependency>
      <groupId>org.springframework</groupId>
      <artifactId>spring-webmvc</artifactId>
      <version>${spring.version}</version>
    </dependency>

    <dependency>
      <groupId>org.pegdown</groupId>
      <artifactId>pegdown</artifactId>
      <version>1.4.2</version>
    </dependency>

  </dependencies>
  <build>
    <plugins>
      <plugin>
        <groupId>org.apache.maven.plugins</groupId>
          <artifactId>maven-dependency-plugin</artifactId>
            <version>2.8</version>
            <executions>
              <execution>
                <id>download-dependencies</id>
                  <phase>generate-resources</phase>
                    <goals>
                      <goal>copy-dependencies</goal>
                    </goals>
                    <configuration>
                      <outputDirectory>${basedir}/war/WEB-INF/lib</outputDirectory>
                    </configuration>
              </execution>
            </executions>
      </plugin>
    </plugins>
  </build>
</project>

```

GAE eclipse 플러그인을 사용하기 때문에 debug/test/deploy는 GAE 앱 개발할때와 동일하게 수행하면 된다.

도메인 설정하기
------------
도메인 관리를 해주는 곳에서 cname과 APEX를 지원하면 앱엔진 주소에 내 도메인을 사용할수 있다. [스택오버플로우](http://stackoverflow.com/questions/817809/how-to-use-google-app-engine-with-my-own-domain-not-subdomain)에 자세한 설명이 되어 있는데, 아래와 같다.

```
1. Go to https://console.developers.google.com/project
2. Click on your project
3. On the left click "App Engine"
4. Click "Settings"
```


