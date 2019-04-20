package ua.lv.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.lv.dao.SuccessOrderDAO;
import ua.lv.entity.SuccessOrder;
import ua.lv.service.SuccessOrderService;

/**
 * Created by User on 19.04.2019.
 */
@Service
@Transactional
public class SuccessOrderServiceImpl implements SuccessOrderService {
    @Autowired
    SuccessOrderDAO successOrderDAO;

    @Override
    public void addOrder(SuccessOrder successOrder) {
        successOrderDAO.save(successOrder);
    }
}
