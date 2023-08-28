package com.novocozy.util;

import java.io.File;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

public class FileUploadUtil {
	
	// 썸네일 크기 설정
	static final int THUMB_WIDTH = 300;
	static final int THUMB_HEIGHT = 300;
	
	public static String fileUpload(String uploadPath, String fileName, byte[] fileData, String ymdPath) throws Exception {
		
		/*
			UUID = Universally Unique Identifier
			고유식별자 생성(128비트)
			무조건 랜덤으로 생성하고, 100%확률이 아니지만 거의 유일한 값을 가지도록 설정
		*/
		UUID uid = UUID.randomUUID();
		
		/*
			newFileName = uid + 언더바 + 업로드할 원래 파일 이름
						= 새로운 파일 이름 생성을 함
			imgPath = 기본 디렉토리 경로 + 메소드로 계산된 년/월/일 해당하는 서브 디렉토리 경로
		 */
		String newFileName = uid + "_" + fileName;
		String imgPath = uploadPath + ymdPath;
		
		/*
			File target = new File(imgPath, newFileName);
			FileCopyUtils.copy(fileData, target);
			
			File taget : imgPath 랑 newFileName 을 한 번에 묶기위해 사용
						하지만 코드 길이를 줄일라면
						FileCopyUtils.copy(fileData, new File(imgPath, newFileName));
						한 줄로 줄이는게 시각적으로 더 좋음
						
			FileCopyUtils.copy : FileCopyUtils 클래스의 copy 메소드를 사용하여 파일을 실제로 복사함
			fileData : 업로드된 파일의 내용을 담고 있는 바이트배열
		 */
		FileCopyUtils.copy(fileData, new File(imgPath, newFileName));
		
		return newFileName;
	}
	
    public static List<String> fileUploadMultiple(String uploadPath, MultipartFile[] files, String ymdPath) throws Exception {
        List<String> uploadedFileNames = new ArrayList<>();

        for (MultipartFile file : files) {
            if (file != null && !file.isEmpty()) {
                String fileName = fileUpload(uploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
                uploadedFileNames.add(fileName);
            }
        }

        return uploadedFileNames;
    }	
	
	private static void makeDir(String uploadPath, String... paths) {
		
		if (new File(paths[paths.length - 1]).exists()) {
			return ;
		}
		for (String path : paths) {
			File dirPath = new File(uploadPath + path);
			
			if (!dirPath.exists()) {
				dirPath.mkdir();
			}
		}
	}
	
	public static String calcPath(String uploadPath) {
		/*
		Calendar cal = Calendar.getInstance();
		String yearPath = File.separator + cal.get(Calendar.YEAR);
		// String monthDayPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1) + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		*/
		
		Calendar cal = Calendar.getInstance();
		String yearPath = "/" + cal.get(Calendar.YEAR);
		// String monthDayPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1) + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String monthPath = yearPath + "/" + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String datePath = monthPath + "/" + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		
		// makeDir(uploadPath, yearPath, monthDayPath);
		makeDir(uploadPath, yearPath, monthPath, datePath);
	
		return datePath;
	}
}
