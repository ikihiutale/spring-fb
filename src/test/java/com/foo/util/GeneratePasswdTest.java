package com.foo.util;

import org.junit.Test;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class GeneratePasswdTest {

	@Test
	public void generatePasswords() {
		StringBuilder sb = new StringBuilder();
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		sb.append("password - ").append(encoder.encode("password"));
		System.out.println(sb.toString());
	}

}
