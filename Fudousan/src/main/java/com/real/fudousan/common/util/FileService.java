package com.real.fudousan.common.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

import com.real.fudousan.common.exception.DuplicateFileNameException;

/**
 * 파일 관련 유틸
 * 업로드한 파일의 저장 & 서버에 저장된 파일 삭제 등의 기능 제공
 */
public class FileService {
	private static final Logger logger = LoggerFactory.getLogger(FileService.class);

	/**
	 * 업로드 된 파일을 지정된 경로에 저장하고, 저장된 파일명을 리턴
	 * @param mfile 업로드된 파일
	 * @param path 저장할 경로
	 * @return 저장된 파일명
	 * @throws DuplicateFileNameException 원래 이름을 사용할 수 없을 때 발생
	 */
	public static String saveFile(MultipartFile mfile, String uploadPath, boolean useOriginalName) {
		//업로드된 파일이 없거나 크기가 0이면 저장하지 않고 null을 리턴
		if (mfile == null || mfile.isEmpty() || mfile.getSize() == 0) {
			return null;
		}
		
		//저장 폴더가 없으면 생성
		File path = new File(uploadPath);
		if (!path.isDirectory()) {
			path.mkdirs();
		}
		
		//원본 파일명
		String originalFilename = mfile.getOriginalFilename();

		String savedFilename = originalFilename;
		if(!useOriginalName) {
			//저장할 파일명을 오늘 날짜의 년월일로 생성
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			savedFilename = sdf.format(new Date());
		}
		
		//원본 파일의 확장자
		String ext;
		int lastIndex = originalFilename.lastIndexOf('.');
		//확장자가 없는 경우
		if (lastIndex == -1) {
			ext = "";
		}
		//확장자가 있는 경우
		else {
			ext = "." + originalFilename.substring(lastIndex + 1);
		}

		//저장할 전체 경로를 포함한 File 객체
		File serverFile = null;
		
		//같은 이름의 파일이 있는 경우의 처리
		while (true) {
			serverFile = new File(uploadPath + "/" + savedFilename + ext);
			//같은 이름의 파일이 없으면 나감.
			if ( !serverFile.isFile()) break;	
			if (useOriginalName) {
				//같은 이름의 파일이 있으면 이름 뒤에 long 타입의 시간정보를 덧붙임.
				savedFilename = savedFilename + new Date().getTime();
			} else {
				throw new DuplicateFileNameException();
			}
		}		
		
		//파일 저장
		FileOutputStream fos = null;
		try {
			//mfile.transferTo(serverFile);
			 fos = new FileOutputStream(serverFile);
			
			fos.write(mfile.getBytes());
		} catch (Exception e) {
			savedFilename = null;
			e.printStackTrace();
		}
		finally{
			if (fos != null) {
				try {
					fos.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		return savedFilename + ext;
	}
	
	/**
	 * 서버에 저장된 파일의 전체 경로를 전달받아, 해당 파일을 삭제
	 * @param fullpath 삭제할 파일의 경로
	 * @return 삭제 여부
	 */
	public static boolean deleteFile(String fullpath) {
		//파일 삭제 여부를 리턴할 변수
		boolean result = false;
		
		//전달된 전체 경로로 File객체 생성
		File delFile = new File(fullpath);
		
		//해당 파일이 존재하면 삭제
		if (delFile.isFile()) {
			delFile.delete();
			result = true;
		}
		
		return result;
	}
	/**
	 * 서버에 저장된 디렉토리의 전체 경로를 전달받아, 해당 디렉토리를 삭제
	 * @param fullpath 삭제할 디렉토리의 경로
	 * @return 삭제 여부
	 */
	public static boolean deleteDirectory(String fullpath) {
		//파일 삭제 여부를 리턴할 변수
		boolean result = false;
		
		File file = new File(fullpath);
		//폴더내 파일을 배열로 가져온다.
		File[] tempFile = file.listFiles();

		if(tempFile.length > 0){
			
			for (int i = 0; i < tempFile.length; i++) {
				
				if(tempFile[i].isFile()){
					if (!tempFile[i].delete()) {
						logger.info("file("+tempFile[i].exists()+") delete fail : " + tempFile[i]);
					}
				}else{
					//재귀함수
					deleteDirectory(tempFile[i].getPath());
				}
				tempFile[i].delete();
			}
			result = file.delete();
		}
		
		return result;
	}
}
