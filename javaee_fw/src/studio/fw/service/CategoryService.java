package studio.fw.service;

import java.util.List;

import studio.fw.entity.CategoryInfo;


public interface CategoryService {
	List<CategoryInfo> listAll();
	
	CategoryInfo getIdByName(String categoryType);
	
	CategoryInfo getById(Integer id);
}
