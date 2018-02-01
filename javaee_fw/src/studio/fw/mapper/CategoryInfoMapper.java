package studio.fw.mapper;

import java.util.List;

import studio.fw.entity.CategoryInfo;

public interface CategoryInfoMapper {
	// 列出所有类别
	List<CategoryInfo> listAll();

	// 通过名字获得ID
	CategoryInfo getIdByName(String categoryType);

	CategoryInfo selectByPrimaryKey(Integer categoryId);

	int deleteByPrimaryKey(Integer categoryId);

	int insert(CategoryInfo record);

	int insertSelective(CategoryInfo record);

	int updateByPrimaryKeySelective(CategoryInfo record);

	int updateByPrimaryKey(CategoryInfo record);
}