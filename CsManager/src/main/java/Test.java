import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

import javax.imageio.ImageIO;

import org.apache.commons.io.FileUtils;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.beeyt.action.FileAction;

public class Test {
	public static void main(String[] args) throws Exception, IOException {
//		String path = "D:\\a.png";
//		File file = new File("D:\\二维码.jpg");
//		System.out.println("存放图片文件的路径:" + path);
//		// 转存文件到指定的路径
//		// InputStream is = this.getClass().getResourceAsStream("hecheng.png");
//		// File bgFile = new File("src/main/resources/hecheng.png");
//		InputStream bgFile = FileAction.class.getClassLoader().getResourceAsStream("hecheng_new.png");
//		File targetFile = new File(path);
//		FileUtils.copyInputStreamToFile(new FileInputStream(file), targetFile);
//
//		BufferedImage image1 = ImageIO.read(bgFile);
//		BufferedImage image2 = ImageIO.read(targetFile);
//		Image scaledImage = image2.getScaledInstance(448, 610, Image.SCALE_SMOOTH);
//		BufferedImage combined = new BufferedImage(image1.getWidth(), image1.getHeight(), BufferedImage.TYPE_INT_RGB);
//
//		// paint both images, preserving the alpha channels
//		Graphics g = combined.getGraphics();
//		g.drawImage(image1, 0, 0, null);
//		g.drawImage(scaledImage, 38, 78, null);
//
//		// Save as new image
//		ImageIO.write(combined, "JPG", new File(path));
		
		String str="[\"1\",\"2\"]";
		
		JSONObject jsonMsg = new JSONObject();
		JSONArray a=jsonMsg.parseArray(str);
		System.out.println(a.get(0));
		System.out.println(a.size());
	}
	
}
