package ua.lv.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.lv.dao.PreviewDAO;
import ua.lv.entity.Preview;
import ua.lv.service.PreviewService;

import java.util.List;

/**
 * Created by User on 14.04.2019.
 */
@Transactional
@Service
public class PreviewServiceImpl implements PreviewService {
    @Autowired
    PreviewDAO previewDAO;

    @Override
    public void addPrewien(Preview preview) {
        previewDAO.save(preview);
    }

    @Override
    public void deletePrewiev(int id) {
        previewDAO.delete(id);
    }

    @Override
    public List<Preview> prewievList() {
        return previewDAO.findAll();
    }

    @Override
    public Preview getPrewievById(int id) {
        return previewDAO.findOne(id);
    }

    @Override
    public List<Preview> elsePhoto(int id) {
        return previewDAO.elsePhoto(id);
    }
}
