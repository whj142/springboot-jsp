/**
 * 
 */
package cn.whj.demo;

import java.io.Serializable;

/**
 * @author wuhuijie
 *2019年4月25日
 * 
 */
public class Dept implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Long deptno;
    private String dname;
    public Long getDeptno() {
        return deptno;
    }
    public void setDeptno(Long deptno) {
        this.deptno = deptno;
    }
    public String getDname() {
        return dname;
    }
    public void setDname(String dname) {
        this.dname = dname;
    }
}
