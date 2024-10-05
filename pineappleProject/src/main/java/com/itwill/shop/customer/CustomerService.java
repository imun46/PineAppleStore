package com.itwill.shop.customer;

public class CustomerService {

	private CustomerDao customerDao;

	public CustomerService() throws Exception {
		this.customerDao = new CustomerDaoImpl();
	}

	// 회원가입
	public int create(Customer customer) throws Exception {
		// 아이디 중복체크
		if (customerDao.countByCustomerId(customer.getCustomerId()) > 0) {
			return -1;

		}
		// 회원가입 완료
		return customerDao.insert(customer);
	}

	// 로그인
	public int login(String userId, int password) throws Exception {

		// 로그인 유효성체크
		if (customerDao.countByCustomerId(userId) == 1) {

			Customer customer = customerDao.findCustomerId(userId);
			// 유효성체크가 된 유처객체안에 비밀번호와 맞는지 확인
			if (customer.getCustomerPassword().equals(password)) {
				return 1;
			}
		}

		return 0;
	}

	// 사용자 정보 아이디로 찾기

	public Customer findCustomerId(String customerNo) throws Exception {
		return customerDao.findCustomerId(customerNo);
	}

	// 사용자 정보 사용자 번호로 찾기

	public Customer findCustomerNo(Integer customerNo) throws Exception {
		return customerDao.findCustomerNo(customerNo);
	}

	// 사용자 정보 수정
	public int updateCustomerId(Customer customer) throws Exception {
		return customerDao.update(customer);
	}

	// 사용자 삭제
	public int deleteCustomerNo(Integer customerId) throws Exception {
		return customerDao.delete(customerId);
	}

}
