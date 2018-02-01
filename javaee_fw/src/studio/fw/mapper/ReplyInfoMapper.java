package studio.fw.mapper;

import studio.fw.entity.ReplyInfo;

public interface ReplyInfoMapper {
    int deleteByPrimaryKey(Integer replyId);

    int insert(ReplyInfo record);

    int insertSelective(ReplyInfo record);

    ReplyInfo selectByPrimaryKey(Integer replyId);

    int updateByPrimaryKeySelective(ReplyInfo record);

    int updateByPrimaryKey(ReplyInfo record);
}