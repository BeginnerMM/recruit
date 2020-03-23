package qdu.java.recruit;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import sun.misc.BASE64Encoder;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

@RunWith(SpringRunner.class)
@SpringBootTest
public class DemoApplicationTests {

	@Test
	public void contextLoads() throws NoSuchAlgorithmException, UnsupportedEncodingException {
		String str = "123456";
		//确定计算方法
		MessageDigest md5 = MessageDigest.getInstance("MD5");
		BASE64Encoder base64en = new BASE64Encoder();

		//加密后的字符串
		String encStr = base64en.encode(md5.digest(str.getBytes("utf-8")));
		System.out.println(encStr);
	}

}
