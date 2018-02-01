package studio.fw.mapper;

import java.util.List;

import studio.fw.entity.LetterInfo;

public interface LetterInfoMapper {
	//用户查看自己的站内信
	List<LetterInfo> listById(Integer recieverId);
	//用户删除站内信
    int deleteByPrimaryKey(Integer letterId);
    //买家给卖家发站内信
    int insertSelective(LetterInfo record);

}