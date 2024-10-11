package com.itwill;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
@ServletComponentScan
@SpringBootApplication
public class PineappleProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(PineappleProjectApplication.class, args);
	}

}
