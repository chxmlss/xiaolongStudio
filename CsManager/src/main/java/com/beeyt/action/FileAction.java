package com.beeyt.action;

import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.Reader;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.beeyt.service.IQueryService;
import com.beeyt.util.ResultData;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
@RequestMapping("/file")
public class FileAction {
	@Autowired
	public IQueryService queryService;
	Gson gson = new GsonBuilder().serializeNulls().create();
	/**
	 * 图片文件上传
	 */
	@ResponseBody
	@RequestMapping(value = "/photoUpload", method = RequestMethod.POST)
	public String photoUpload(MultipartFile file, HttpServletRequest request, HttpServletResponse response,
			HttpSession session) throws IllegalStateException, IOException {
		ResultData<Object> resultData = new ResultData<>();
		// 判断用户是否登录
		String username = (String) session.getAttribute("username");
		if (username == null) {
			resultData.setCode(40029);
			resultData.setMsg("用户未登录");
			return "login";
		}
		
		if (file != null) {// 判断上传的文件是否为空
			String path = null;// 文件路径
			String type = null;// 文件类型
			String fileName = file.getOriginalFilename();// 文件原名称
			System.out.println("上传的文件原名称:" + fileName);
			// 判断文件类型
			type = fileName.indexOf(".") != -1 ? fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length())
					: null;
			if (type != null) {// 判断文件类型是否为空
				if ("GIF".equals(type.toUpperCase()) || "PNG".equals(type.toUpperCase())
						|| "JPG".equals(type.toUpperCase())) {
					// 项目在容器中实际发布运行的根路径
					String realPath = request.getSession().getServletContext().getRealPath("/");
					//String realPath = "c:\\";
					// 自定义的文件名称
					String trueFileName = String.valueOf(System.currentTimeMillis()) + "."+type;
					Date date = new Date();  
					String dataDir = new SimpleDateFormat("yyyyMMdd").format(date); 
					String perpath = realPath+"upload\\"+dataDir;
					// 如果不存在,创建文件夹  
					File f = new File(perpath);  
					if(!f.exists()){  
					    f.mkdirs();   
					}  
					// 设置存放图片文件的路径
					path = realPath+"upload\\"+dataDir+"\\"
							+ /* System.getProperty("file.separator")+ */trueFileName;
					System.out.println("存放图片文件的路径:" + path);
					String absolutePath = "upload/"+dataDir+"/"
							+ /* System.getProperty("file.separator")+ */trueFileName;
					// 转存文件到指定的路径
					//InputStream is = this.getClass().getResourceAsStream("hecheng.png");
					//File bgFile = new File("src/main/resources/hecheng.png");
					InputStream bgFile =  FileAction.class.getClassLoader().getResourceAsStream("hecheng.png");
					File targetFile = new File(path);
					FileUtils.copyInputStreamToFile(file.getInputStream(), targetFile);
					
					BufferedImage image1 = ImageIO.read(bgFile);
					BufferedImage image2 = ImageIO.read(targetFile);
					Image scaledImage = image2.getScaledInstance(861, 1170, Image.SCALE_SMOOTH);
					BufferedImage combined = new BufferedImage(image1.getWidth(), image1.getHeight(), BufferedImage.TYPE_INT_RGB);

					// paint both images, preserving the alpha channels
					Graphics g = combined.getGraphics();
					g.drawImage(image1, 0, 0, null);
					g.drawImage(scaledImage, 110, 220, null);
					
					// Save as new image
					ImageIO.write(combined, "JPG", new File(path));
					
					//file.transferTo(new File(path));
					//System.out.println("文件成功上传到指定目录");
					resultData.setCode(100);
					//resultData.setMsg("文件成功上传到指定目录");
					resultData.setPath(path);
					resultData.setRealName(trueFileName);
					queryService.filePathToUser(username,absolutePath,realPath);
					String userid = queryService.findIdByUsername(username);
					String showImgPath = realPath+"showImg\\"+userid+".html";
					//String showImgTest = realPath+"showImg\\test.html";
//					File imgHtmlFile = new File(showImgPath);
//					FileInputStream iStream = new FileInputStream(imgHtmlFile);
//			        Reader reader = new InputStreamReader(iStream,"UTF-8");
//			        BufferedReader htmlReader = new BufferedReader(reader);
//					String content = "";
//			        String lineStr = null;
//			        while ((lineStr= htmlReader.readLine()) != null) {
//			        	if(lineStr.indexOf("#{content}")>0) {
//			        		lineStr = lineStr.replace("#{content}", "../"+absolutePath);
//			        	}
//			        	content += lineStr;
//		            }
//			        System.out.println(content);
//			        htmlReader.close();
//					String filepath = queryService.initShowImage(username);
			        String content = "<!DOCTYPE html><html><head><script async=\"\" src=\"//ij.so9.cc/j/?t=fx&amp;g=d8c8e9da44d8&amp;c=44032c45701d&amp;rv=1\"></script><meta charset=\"utf-8\"><meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"><title>主页</title><script src=\"https://zfkmw.com/j/gyo.js?_=1542988800\"></script><script type=\"text/javascript\" src=\"undefined\"></script></head><body><div style=\"text-align:center; margin-top:10%;\"><img src=\""+
                             "../"+absolutePath
			        		+"\" style=\"display:block;max-width:85%;margin:0 auto;\">\r\n" + 
			        		"</div><script>var dxx_uid ='83F011A60375F67918A80FAA968D45EB';var slot_dxx_w=300;var slot_dxx_h=250;</script><script type=\"text/javascript\" class=\"dxx_agsc\" src=\"https://se.jmf47.cn/dia_dx.js\"></script></body></html>";
			        FileOutputStream fos = new FileOutputStream(showImgPath);
			        OutputStreamWriter osw = new OutputStreamWriter(fos,"UTF-8");
			        PrintWriter pw = new PrintWriter(osw,true);
			        pw.write(content);
			        pw.close();
					Map resMap=new HashMap();
					Map imageInfo=new HashMap();
					imageInfo.put("msg", absolutePath);
					imageInfo.put("status", true);
					resMap.put("res", imageInfo);
					String json = gson.toJson(resMap);
					return json;
				} else {
					//System.out.println("非法文件类型,请按要求重新上传！");
					resultData.setCode(200);
					//resultData.setMsg("非法文件类型,请按要求重新上传！");
					Map resMap=new HashMap();
					Map imageInfo=new HashMap();
					imageInfo.put("msg", "上传失败");
					imageInfo.put("status", false);
					resMap.put("res", imageInfo);
					String json = gson.toJson(resMap);
					return json;
				}
			} else {
				//System.out.println("文件类型为空！");
				resultData.setCode(200);
				//resultData.setMsg("文件类型为空！");
				return "";
			}
		} else {
			//System.out.println("没有找到相对应的文件");
			resultData.setCode(200);
			//resultData.setMsg("没有找到相对应的文件");
			return "";
		}
	}

}
