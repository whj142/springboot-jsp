/**
 * 
 */
package cn.whj.service;

import java.util.List;

import cn.whj.demo.Dept;

/**
 * @author wuhuijie
 *2019年4月25日
 * 
 */
public interface DeptService {
	 /**
     * 获取所有部门信息
     * @return
     */
    List<Dept> findAll(); 
    /**
     * 添加部门 
     * @param dept
     */
    void addDept(Dept dept);

}
