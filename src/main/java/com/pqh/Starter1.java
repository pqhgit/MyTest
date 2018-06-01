package com.pqh;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(value = "com.pqh.mapper")
public class Starter1 {
	public static void main(String[] args) {
		SpringApplication.run(Starter1.class, args);
	}
}
