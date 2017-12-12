package com.ten.ParkNShop.dto;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

/**
 * 文件操作类
 * 
 * @author hwadee
 *
 */
public class FileUtil {

	/**
	 * 上传单个文件
	 * @param file
	 * @param path
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	public static String uploadFile(CommonsMultipartFile file,String path) throws IllegalStateException, IOException{
		File newFilePath = new File(path);
		if (!newFilePath.exists()){
			if(!newFilePath.mkdirs()){
				return "error:目录创建失败:"+path;
			}
		}
		//获取文件名
		String filename = file.getOriginalFilename();
		//获取文件扩展名
		String prefix = filename.substring(filename.lastIndexOf("."));
		//获取新的文件名
		String newFileName = UUID.randomUUID().toString().replace("-", "")+prefix;
		File newFile = new File(path+"/"+newFileName);
		file.transferTo(newFile);
		return newFileName;
	}
	
	/**
	 * 多文件上传
	 * @param request
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	public static String  uploadPluralFile(HttpServletRequest request,String path) throws IllegalStateException, IOException {
//		long startTime = System.currentTimeMillis();		
		// 将当前上下文初始化给 CommonsMutipartResolver（多部分解析器）
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
				request.getSession().getServletContext());

		// 检查form中是否有enctype="multipart/form-data"
		if (multipartResolver.isMultipart(request)) {
			File newFilePath = new File(path);
			if (!newFilePath.exists()){
				if(!newFilePath.mkdirs()){
					return "error:目录创建失败:"+path;
				}
			}
			// 将request变成多部分request
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			
			// 获取multiRequest 中所有的文件名
			Iterator<String> iter = multiRequest.getFileNames();
			List<String> fileNameList = new ArrayList<String>();
			// 遍历所有文件
			while (iter.hasNext()) {
				// 获取一个文件
				MultipartFile file = multiRequest.getFile(iter.next());
				if (file != null) {
					//获取文件名
					String filename = file.getOriginalFilename();
					//获取文件扩展名
					String prefix = filename.substring(filename.lastIndexOf("."));
					//获取新的文件名
					String newFileName = UUID.randomUUID().toString().replace("-", "")+prefix;
					//保存文件
					file.transferTo(new File(path + "/" + newFileName));
					fileNameList.add(filename+"->"+newFileName);
				}
			}
			return fileNameList.toString();
		}
		return "error:没有上传的文件！！";
	}
}

