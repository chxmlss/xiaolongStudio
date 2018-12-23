package com.beeyt.util;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;
import javax.imageio.ImageIO;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

public class ZXingBackGroundUtils {
	private static final int QRCOLOR = 0xFF000000; // 默认是黑色
	private static final int BGWHITE = 0xFFFFFFFF; // 背景颜色

	private static final int WIDTH = 250; // 二维码宽
	private static final int HEIGHT = 250; // 二维码高
	// 用于设置QR二维码参数
	private static Map<EncodeHintType, Object> hints = new HashMap<EncodeHintType, Object>() {
		private static final long serialVersionUID = 1L;
		{
			put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.H);// 设置QR二维码的纠错级别（H为最高级别）具体级别信息
			put(EncodeHintType.CHARACTER_SET, "utf-8");// 设置编码方式
			put(EncodeHintType.MARGIN, 0);
		}

	};

	/***
	 * * 二维码嵌套背景图的方法
	 * @param outputStream   二维码输出位置
	 * @param bgFile     背景图
	 * @param text   二维码内容
	 * @param xx           二维码x坐标
	 * @param yy           二维码y坐标
	 */
	public static void drawLogoQRCode(OutputStream outputStream, String text) {
		try {
			MultiFormatWriter multiFormatWriter = new MultiFormatWriter();
			// 参数顺序分别为：编码内容，编码类型，生成图片宽度，生成图片高度，设置参数
			BitMatrix bm = multiFormatWriter.encode(text, BarcodeFormat.QR_CODE, WIDTH, HEIGHT, hints);
			BufferedImage image = new BufferedImage(WIDTH, HEIGHT, BufferedImage.TYPE_INT_RGB);
			InputStream bgFile = ZXingBackGroundUtils.class.getClassLoader().getResourceAsStream("background.jpg");
			BufferedImage ground = ImageIO.read(bgFile);
			// 开始利用二维码数据创建Bitmap图片，分别设为黑（0xFFFFFFFF）白（0xFF000000）两色
			for (int x = 0; x < WIDTH; x++) {
				for (int y = 0; y < HEIGHT; y++) {
					image.setRGB(x, y, bm.get(x, y) ? QRCOLOR : BGWHITE);
				}
			}
			image.flush();
			
			Graphics2D g = ground.createGraphics();
			String xx="500";
			String yy="128";
			float fx = Float.parseFloat(xx);
			float fy = Float.parseFloat(yy);
			int x_i = (int) fx;
			int y_i = (int) fy;
			g.drawImage(image, x_i, y_i, image.getWidth(), image.getHeight(), null);
			g.dispose();
			ImageIO.write(ground, "png", outputStream);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
