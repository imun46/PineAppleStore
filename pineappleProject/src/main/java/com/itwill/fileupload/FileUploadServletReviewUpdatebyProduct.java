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
@WebServlet("/upload0")
public class FileUploadServletReviewUpdatebyProduct extends HttpServlet {

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
        File uploadDirectory = new File(directoryPath);
        if (!uploadDirectory.exists()) {
            uploadDirectory.mkdirs();
        }
        // 기존 리뷰 정보를 가져옴 (기존 이미지 포함)
        ReviewService reviewService = new ReviewService();
        Review existingReview = reviewService.findReviewByReviewNo(reviewNoStr);
        String existingImage = existingReview.getReviewImage(); // 기존 이미지 이름
        // 파일 업로드 및 파일 정보 반환
        Collection<Part> fileParts = request.getParts();
        String reviewImage = existingImage; // 업로드된 이미지 이름을 저장할 변수 초기화

        for (Part filePart : fileParts) {
            // 파일 파라미터가 아닌 경우 continue
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
                .reviewNo(reviewNoStr)
                .reviewTitle(reviewTitleStr)
                .reviewContent(reviewContentStr)
                .reviewRating(reviewRatingStr)
                .reviewImage(reviewImage) // 업로드된 이미지가 없으면 null
                .product(product)
                .customer(customer)
                .build();
        

        // 리뷰 업데이트
        reviewService.updateReview(review);

        response.sendRedirect("jsp/review_detail_by_product.jsp?reviewNo=" + reviewNoStr);

		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
