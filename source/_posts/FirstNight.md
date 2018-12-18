---
title: Spring boot 接入redis
date: 2018年3月27日11:04:17
tags: [Java,Spring Boot,Redis]
categories: [Java,Spring,Spring Boot]
toc: true
---
#### 1、使用properties或yml文件配置
        这种方式最简单，只需要引入spring-boot-starter-data-redis包，并且写好properties配置文件，那么依赖中的RedisAutoConfiguration类就会自动加载配置文件，这种方式提供了两种bean：RedisTemplate和StringRedisTemplate两种
   ###### （1）、 pom.xml依赖
        <dependency>
        		<groupId>org.springframework.boot</groupId>
        		<artifactId>spring-boot-starter-data-redis</artifactId>
    	</dependency>
   ###### （2）、application.properties配置文件
        Spring.redis.host=localhost       //数据库ip
        spring.redis.port=6379     //端口
        #后面的可以不配置使用默认配置即可
        # 连接超时时间 单位 ms（毫秒）
        spring.redis.timeout=3000
        
        # 连接池中的最大空闲连接，默认值也是8。
        spring.redis.pool.max-idle=8
        #连接池中的最小空闲连接，默认值也是0。
        spring.redis.pool.min-idle=0
        # 如果赋值为-1，则表示不限制；如果pool已经分配了maxActive个jedis实例，则此时pool的状态为exhausted(耗尽)。
        spring.redis.pool.max-active=8
        # 等待可用连接的最大时间，单位毫秒，默认值为-1，表示永不超时。如果超过等待时间，则直接抛出JedisConnectionException
        spring.redis.pool.max-wait=-1