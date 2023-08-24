package com.kopo.hanaglobal.hana_global;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@MapperScan(value = {"com.kopo.hanaglobal.hana_global.web.repository"})
@SpringBootApplication
public class HanaGlobalApplication extends SpringBootServletInitializer{

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(HanaGlobalApplication.class);
	}

	public static void main(String[] args) {
		SpringApplication.run(HanaGlobalApplication.class, args);
	}

}