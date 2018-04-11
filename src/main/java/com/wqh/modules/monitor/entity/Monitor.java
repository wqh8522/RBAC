package com.wqh.modules.monitor.entity;

import com.wqh.common.persistence.DataEntity;
import com.wqh.common.utils.excel.annotation.ExcelField;
import org.hibernate.validator.constraints.Length;


/**
 * 系统监控Entity
 * 
 * @version 2016-02-07
 */
public class Monitor extends DataEntity<Monitor> {
	
	private static final long serialVersionUID = 1L;
	private String cpu;		// cpu使用率
	private String jvm;		// jvm使用率
	private String ram;		// 内存使用率
	private String toEmail;		// 警告通知邮箱
	
	public Monitor() {
		super();
	}

	public Monitor(String id){
		super(id);
	}

	@Length(min=0, max=64, message="cpu使用率长度必须介于 0 和 64 之间")
	@ExcelField(title="cpu使用率", align=2, sort=1)
	public String getCpu() {
		return cpu;
	}

	public void setCpu(String cpu) {
		this.cpu = cpu;
	}
	
	@Length(min=0, max=64, message="jvm使用率长度必须介于 0 和 64 之间")
	@ExcelField(title="jvm使用率", align=2, sort=2)
	public String getJvm() {
		return jvm;
	}

	public void setJvm(String jvm) {
		this.jvm = jvm;
	}
	
	@Length(min=0, max=64, message="内存使用率长度必须介于 0 和 64 之间")
	@ExcelField(title="内存使用率", align=2, sort=3)
	public String getRam() {
		return ram;
	}

	public void setRam(String ram) {
		this.ram = ram;
	}
	
	@Length(min=0, max=64, message="警告通知邮箱长度必须介于 0 和 64 之间")
	@ExcelField(title="警告通知邮箱", align=2, sort=4)
	public String getToEmail() {
		return toEmail;
	}

	public void setToEmail(String toEmail) {
		this.toEmail = toEmail;
	}
	
}