package studio.fw.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import studio.fw.entity.CategoryInfo;
import studio.fw.mapper.CategoryInfoMapper;
import studio.fw.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService{
	@Autowired
	CategoryInfoMapper categoryInfoMapper;
	
	@Override
	public List<CategoryInfo> listAll() {
		return categoryInfoMapper.listAll();
	}

	@Override
	public CategoryInfo getIdByName(String categoryType) {
		return categoryInfoMapper.getIdByName(categoryType);
	}

	@Override
	public CategoryInfo getById(Integer id) {
		return categoryInfoMapper.selectByPrimaryKey(id);
	}
	

}
