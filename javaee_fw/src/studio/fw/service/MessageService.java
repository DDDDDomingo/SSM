package studio.fw.service;

import java.util.List;

import studio.fw.entity.MessageInfo;

public interface MessageService {
	// 添加评论
	int insertSelective(MessageInfo record);

	// 显示单个商品的评论
	List<MessageInfo> listBySaleId(Integer saleitemId);
}
