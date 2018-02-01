package studio.fw.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import studio.fw.entity.LetterInfo;
import studio.fw.mapper.LetterInfoMapper;
import studio.fw.service.LetterService;

@Service
public class LetterServiceImpl implements LetterService {
	@Autowired
	LetterInfoMapper letterInfoMapper;
	
	@Override
	public List<LetterInfo> listById(Integer id) {
		// TODO Auto-generated method stub
		return letterInfoMapper.listById(id);
	}

	@Override
	public int deleteByPrimaryKey(Integer letterId) {
		// TODO Auto-generated method stub
		return letterInfoMapper.deleteByPrimaryKey(letterId);
	}

	@Override
	public int insertSelective(LetterInfo record) {
		// TODO Auto-generated method stub
		return letterInfoMapper.insertSelective(record);
	}

}
