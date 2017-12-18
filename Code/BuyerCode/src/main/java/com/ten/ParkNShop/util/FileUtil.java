package com.ten.ParkNShop.util;

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
 * �ļ�������
 * 
 * @author hwadee
 *
 */
public class FileUtil {

	/**
	 * �ϴ������ļ�
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
		//��ȡ�ļ���
		String filename = file.getOriginalFilename();
		//��ȡ�ļ���չ��
		String prefix = filename.substring(filename.lastIndexOf("."));
		//��ȡ�µ��ļ���
		String newFileName = UUID.randomUUID().toString().replace("-", "")+prefix;
		File newFile = new File(path+"/"+newFileName);
		file.transferTo(newFile);
		return newFileName;
	}
	
	/**
	 * ���ļ��ϴ�
	 * @param request
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	public static String  uploadPluralFile(HttpServletRequest request,String path) throws IllegalStateException, IOException {
//		long startTime = System.currentTimeMillis();		
		// ����ǰ�����ĳ�ʼ���� CommonsMutipartResolver���ಿ�ֽ�������
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
				request.getSession().getServletContext());

		// ���form���Ƿ���enctype="multipart/form-data"
		if (multipartResolver.isMultipart(request)) {
			File newFilePath = new File(path);
			if (!newFilePath.exists()){
				if(!newFilePath.mkdirs()){
					return "error:Ŀ¼����ʧ��:"+path;
				}
			}
			// ��request��ɶಿ��request
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			
			// ��ȡmultiRequest �����е��ļ���
			Iterator<String> iter = multiRequest.getFileNames();
			List<String> fileNameList = new ArrayList<String>();
			// ���������ļ�
			while (iter.hasNext()) {
				// ��ȡһ���ļ�
				MultipartFile file = multiRequest.getFile(iter.next());
				if (file != null) {
					//��ȡ�ļ���
					String filename = file.getOriginalFilename();
					//��ȡ�ļ���չ��
					String prefix = filename.substring(filename.lastIndexOf("."));
					//��ȡ�µ��ļ���
					String newFileName = UUID.randomUUID().toString().replace("-", "")+prefix;
					//�����ļ�
					file.transferTo(new File(path + "/" + newFileName));
					fileNameList.add(filename+"->"+newFileName);
				}
			}
			return fileNameList.toString();
		}
		return "error:û���ϴ����ļ�����";
	}
}

