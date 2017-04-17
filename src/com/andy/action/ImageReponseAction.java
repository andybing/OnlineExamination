package com.andy.action;


import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Map;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.imageio.stream.ImageOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class ImageReponseAction extends ActionSupport implements SessionAware{
	private Map<String,Object> session;
	private ByteArrayInputStream inputStream;
	private String code;
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public ByteArrayInputStream getInputStream() {
		return inputStream;
	}
	public void setInputStream(ByteArrayInputStream inputStream) {
		this.inputStream = inputStream;
	}
	public Map<String, Object> getSession() {
		return session;
	}
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	public BufferedImage createImage(){
		int width = 80, height = 20;
		// 建立指定宽、高BufferedImage对象
		BufferedImage image = new BufferedImage(width, height,
				BufferedImage.TYPE_INT_RGB);

		Graphics g = image.getGraphics();

		// 生成随机类
		Random random = new Random();

		g.fillRect(0, 0, width, height);
		// 设置字体
		g.setFont(new Font("Times New Roman", Font.ITALIC, 18));
		String sRand = "";
		for (int i = 0; i < 4; i++) {
			String rand = String.valueOf(random.nextInt(10));
			sRand += rand;
			// 设置随机颜色
			g.setColor(new Color(20 + random.nextInt(110), 20 + random
					.nextInt(110), 20 + random.nextInt(110)));
			// 绘制
			g.drawString(rand, 20 * i + 6, 16);
		}
		code = sRand;
	//	System.out.println(sRand+" "+code);
		g.dispose();
		return image;
	}
	public ByteArrayInputStream convertImageToStream(BufferedImage image) throws IOException{
		ByteArrayInputStream inputStream = null;
		ByteArrayOutputStream bos = new ByteArrayOutputStream();
		ImageOutputStream imOut = ImageIO.createImageOutputStream(bos);
		ImageIO.write(image, "jpg", imOut);
		inputStream = new ByteArrayInputStream(bos.toByteArray());
		return inputStream;
		
	}
	@Override
	public String execute() throws Exception {
		inputStream = convertImageToStream(createImage());
		session.put("code_session", code);
		return SUCCESS;
	}
}
