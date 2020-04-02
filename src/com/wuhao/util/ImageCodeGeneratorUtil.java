package com.wuhao.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.geom.AffineTransform;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;

import javax.imageio.ImageIO;

/**
 * 验证码生成工具类
 */
public class ImageCodeGeneratorUtil {
	//验证码
	public static final String VERTIFICATION_CODE ="0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";

	/**
	 * 生成验证码
	 * @param size 位数
	 * @param sourceCode 随机数字字母
	 * @return
	 */
	public static String generateCode(int size,String sourceCode) {
		 Random random = new Random(System.currentTimeMillis());
		 char[] codes= new char[size];
		 for(int i=0;i<size;i++) {
			 codes[i]=sourceCode.charAt(random.nextInt(sourceCode.length()-1));
		 }
		 return String.valueOf(codes);
		
	}

	/**
	 * 生成验证图片
	 * @param os 输出流
	 * @param vertifyCode 验证码
	 * @param width 宽度
	 * @param height 高度
	 */
	public static void generateCodeImage(OutputStream os,String vertifyCode,int width,int height) {
		 	int verifySize = vertifyCode.length();
	        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
	        // 获取图形上下文
	        Graphics g = image.getGraphics();
	        // 生成随机类
	        Random random = new Random();
	        // 设定背景色
	        g.setColor(getRandColor(230, 255));
	        g.fillRect(0, 0, width, height);
	        // 设定字体
	        g.setFont(new Font("Arial", Font.CENTER_BASELINE | Font.ITALIC, 23));
	        // 产生0条干扰线，
	        g.drawLine(0, 0, 0, 0);
	        // 取随机产生的认证码(4位数字)
	        String sRand = "";
	        for (int i = 0; i < verifySize; i++) {
	            
	            // 将认证码显示到图象中
	            g.setColor(getRandColor(100, 150));// 调用函数出来的颜色相同，可能是因为种子太接近，所以只能直接生成
	            g.drawString(String.valueOf(vertifyCode.charAt(i)), i * (width/verifySize) +5, 30);
	        }
	        //画干扰线
	        for(int i=0;i<(random.nextInt(50)+5);i++){  
	                g.setColor(new Color(random.nextInt(255)+1,random.nextInt(255)+1,random.nextInt(255)+1));  
	                g.drawLine(random.nextInt(width),random.nextInt(height),random.nextInt(width)+5,random.nextInt(height)+5);  
	        }   
	        // 图象生效
	        g.dispose();
	        // 输出图象到页面
	        try {
				ImageIO.write(image, "JPEG", os);
			} catch (IOException e) {
				e.printStackTrace();
			}
	}

//	public static void main(String[] args) {
//		System.out.println(generateCode(15, VERTIFICATION_CODE));
//	}

	/**
	 * 任意色生成
	 * @param fc
	 * @param bc
	 * @return
	 */
	 private static Color getRandColor(int fc, int bc) {
	     Random random = new Random();
		 if (fc > 255)
	            fc = 255;
	        if (bc > 255)
	            bc = 255;
	        int r = fc + random.nextInt(bc - fc);
	        int g = fc + random.nextInt(bc - fc);
	        int b = fc + random.nextInt(bc - fc);
	        return new Color(r, g, b);
	    }
}
