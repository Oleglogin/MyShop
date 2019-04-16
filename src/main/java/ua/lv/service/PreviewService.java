package ua.lv.service;

import ua.lv.entity.Preview;

import java.util.List;

/**
 * Created by User on 14.04.2019.
 */
public interface PreviewService {
    void addPrewien(Preview preview);
    void deletePrewiev(int id);
    List<Preview> prewievList();
    Preview getPrewievById(int id);
    List<Preview>elsePhoto(int id);
}
