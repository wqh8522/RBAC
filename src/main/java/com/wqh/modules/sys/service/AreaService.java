package com.wqh.modules.sys.service;

import java.util.List;

import com.wqh.modules.sys.utils.UserUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wqh.common.service.TreeService;
import com.wqh.modules.sys.dao.AreaDao;
import com.wqh.modules.sys.entity.Area;
import com.wqh.modules.sys.utils.LogUtils;
import com.wqh.modules.sys.utils.UserUtils;

/**
 * 区域Service
 * 
 * @version 2014-05-16
 */
@Service
@Transactional(readOnly = true)
public class AreaService extends TreeService<AreaDao, Area> {

	public List<Area> findAll(){
		return UserUtils.getAreaList();
	}

	@Transactional(readOnly = false)
	public void save(Area area) {
		super.save(area);
		UserUtils.removeCache(UserUtils.CACHE_AREA_LIST);
	}
	
	@Transactional(readOnly = false)
	public void delete(Area area) {
		super.delete(area);
		UserUtils.removeCache(UserUtils.CACHE_AREA_LIST);
	}
	
}
