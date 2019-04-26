/**
 * 
 */
package cn.whj.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import cn.whj.demo.Dept;

/**
 * @author wuhuijie 2019年4月25日
 * 
 */
@Mapper
public interface DeptMapper {
	List<Dept> findAll();

	void addDept(Dept dept);
}
