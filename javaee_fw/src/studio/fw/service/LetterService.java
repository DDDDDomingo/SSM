package studio.fw.service;

import java.util.List;

import studio.fw.entity.LetterInfo;

public interface LetterService {
	// 查看自己的站内信
	List<LetterInfo> listById(Integer id);

	// 用户删除站内信
	int deleteByPrimaryKey(Integer letterId);

	// 买家给卖家发站内信
	int insertSelective(LetterInfo record);
}
