/**
 * 
 */
package cn.whj.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.whj.Mapper.DeptMapper;
import cn.whj.demo.Dept;
import cn.whj.service.DeptService;

/**
 * @author wuhuijie
 *2019年4月25日
 * 
 */
@Service  //  该注解一定要写，否则无法注册bean
public class DeptServiceImpl implements DeptService{

    @Autowired
    private DeptMapper deptMapper;  //  注入mapper

	/* (non-Javadoc)
	 * @see cn.whj.service.DeptService#findAll()
	 */
	public List<Dept> findAll() {
		// TODO Auto-generated method stub
		return deptMapper.findAll();
	}

	/* (non-Javadoc)
	 * @see cn.whj.service.DeptService#addDept(cn.whj.demo.Dept)
	 */
	public void addDept(Dept dept) {
		// TODO Auto-generated method stub
		deptMapper.addDept(dept);
	}


}
