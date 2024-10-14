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
@WebServlet("/upload2")
public class FileUploadServletReviewInsert extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("jsp/customer_view.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
		/**********************파일아닌파라메타*************************/
			String reviewTitle = request.getParameter("reviewTitle");
			String reviewContent = request.getParameter("reviewContent");
			Integer reviewRating = Integer.parseInt(request.getParameter("reviewRating"));
			//String reviewImage = request.getParameter("reviewImage");
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
			// 파일 업로드 경로 설정
	        String directoryPath = getServletContext().getRealPath("img");
	        File uploadDirectory = new File(directoryPath);
	        if (!uploadDirectory.exists()) {
	            uploadDirectory.mkdirs();
	        }

	        // 파일 업로드 및 파일 정보 반환
	        Collection<Part> fileParts = request.getParts();
	        String reviewImage = null; // 이미지 파일 이름을 저장할 변수 초기화

	        for (Part filePart : fileParts) {
	            if (!filePart.getName().equals("reviewImage") || filePart.getSize() == 0) continue;

	            // 파일 원본 이름 저장
	            reviewImage = filePart.getSubmittedFileName();
	            File uploadFile = new File(uploadDirectory, reviewImage);

	            // 파일 저장
	            try (InputStream inputStream = filePart.getInputStream();
	                 OutputStream outputStream = Files.newOutputStream(uploadFile.toPath())) {
	                inputStream.transferTo(outputStream);
	            }
	        }

	        // 리뷰 객체 생성, reviewImage가 null일 수 있음
	        Review review = Review.builder()
	                .reviewTitle(reviewTitle)
	                .reviewContent(reviewContent)
	                .reviewRating(reviewRating)
	                .reviewImage(reviewImage) // 업로드된 이미지가 없으면 null
	                .product(product)
	                .customer(customer)
	                .build();

	        ReviewService reviewService = new ReviewService();
	        reviewService.insertReview(review); // 항상 리뷰 정보를 DB에 저장

	        response.sendRedirect("jsp/review_mypage_form.jsp");
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
