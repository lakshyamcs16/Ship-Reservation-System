package com.wipro.srs.dao;

import com.wipro.srs.bean.CreditCardBean;

public interface CreditCardDAO {

	CreditCardBean findByIDCreditCardNumber(String creditCardNumber);
}
