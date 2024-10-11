package com.itwill.fileupload;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Collection;

import com.itwill.shop.domain.Customer;
import com.itwill.shop.domain.Product;
import com.itwill.shop.domain.Review;
import com.itwill.shop.service.ReviewService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

/**
 * 파일 업로드 HTTP 요청을 처리하는 서블릿
 * 
 * @fileSizeThreshold fileUpload 시에 메모리에 저장되는 임시 파일 크기를 정의 [자료형 : int]
 * @location 파일 업로드 시에 임시 저장 디렉터리를 지정한다. [자료형 : String]
 * @maxFileSize 업로드할 파일의 치대 크기를 지정한다. [자료형 : long]
 * @maxRequestSize request 시에 최대 크기를 지정한다. [자료형 : long]
 */
@MultipartConfig( fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 100, maxRequestSize = 1024 * 1024 * 100)//MB
@WebServlet("/upload")
public class FileUploadServletReviewUpdate extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("jsp/customer_view.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
		/**********************파일아닌파라메타*************************/
		Integer reviewNoStr = Integer.parseInt(request.getParameter("reviewNo"));
		String reviewTitleStr = request.getParameter("reviewTitle");
		String reviewContentStr = request.getParameter("reviewContent");
		Integer reviewRatingStr = Integer.parseInt(request.getParameter("reviewRating"));
		   
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");;
		//String reviewImageStr = request.getParameter("reviewImage");
		Integer proNoStr = Integer.parseInt(request.getParameter("productNo"));
		Integer cusNoStr = Integer.parseInt(request.getParameter("customerNo"));
		Product product =Product.builder().productNo(proNoStr).build(); 
		Customer customer = Customer.builder().customerNo(cusNoStr).build();
		/**설정 파일에서 업로드 디렉토리 경로를 로드*/
//		Properties properties = new Properties();
//		InputStream input = FileVO.class.getClassLoader().getResourceAsStream("upload.properties");
//		properties.load(input);
//		String directoryPath = properties.getProperty("UPLOAD_DIRECTORY");
		//String directoryPath = "C:/file/upload"; //파일업로드시 저장경로
		String directoryPath = getServletContext().getRealPath("img"); //파일업로드시 저장경로
		/**파일을 upload 할 directory 생성*/
		File uploadDirectory = new File(directoryPath);
		if (!uploadDirectory.exists()) {//폴더없을경우 생성
			uploadDirectory.mkdirs();
		}
		/**파일 업로드 및 파일 정보 반환*/
		Collection<Part> fileParts = request.getParts(); //파일아닌 파라메타도 들어옴
		
		for (Part filePart : fileParts) {
			//파일파츠의 이름이 업로드파일이고 파일이 들어올 경우 continue
			if(!filePart.getName().equals("reviewImage") || filePart.getSize()==0) continue; 
			//파일 원본 이름, 확장자, 저장 이름 추출
			String originalName = filePart.getSubmittedFileName();
			//String extension = FilenameUtils.getExtension(originalName); //확장자를 꺼냄
			//String savedName = UUID.randomUUID() + "_" + originalName;//랜덤이름_원래이름
			File uploadFile = new File(uploadDirectory, originalName);
			//파일 저장
			//업로드입력파일스트림
			InputStream inputStream = filePart.getInputStream();
			//서버저장파일출력스트림
			OutputStream outputStream = Files.newOutputStream(uploadFile.toPath());
			inputStream.transferTo(outputStream);
			
			if (uploadFile != null) {
				// 파일 정보를 DB에 저장
				
				ReviewService reviewService = new ReviewService();
				Review review = Review.builder()
				        .reviewNo(reviewNoStr) 
				        .reviewTitle(reviewTitleStr)
				        .reviewContent(reviewContentStr)
				        .reviewRating(reviewRatingStr)
				        .reviewImage(originalName)
				        .product(product)
				        .customer(customer)
				        .build();    
				
				reviewService.updateReview(review);
				}
			response.sendRedirect("jsp/review_detail.jsp?reviewNo="+reviewNoStr);
		}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
