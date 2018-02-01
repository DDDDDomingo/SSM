package studio.fw.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import studio.fw.entity.MessageInfo;
import studio.fw.mapper.MessageInfoMapper;
import studio.fw.service.MessageService;
@Service
public class MessageServiceImpl implements MessageService {
	@Autowired
	MessageInfoMapper messageInfoMapper;
	
	@Override
	public int insertSelective(MessageInfo record) {
		return messageInfoMapper.insertSelective(record);
	}

	@Override
	public List<MessageInfo> listBySaleId(Integer saleitemId) {
		return messageInfoMapper.listBySaleId(saleitemId);
	}

}
