/**
 * 
 */
package net.zjwu.mis.system.vo;

import java.io.Serializable;

/**
 * @author Lay
 *
 */
public class Result implements Serializable{

	private boolean success = true;
	
	private String msg;

	/**
	 * @return the success
	 */
	public boolean isSuccess() {
		return success;
	}

	/**
	 * @param success the success to set
	 */
	public void setSuccess(boolean success) {
		this.success = success;
	}

	/**
	 * @return the msg
	 */
	public String getMsg() {
		return msg;
	}

	/**
	 * @param msg the msg to set
	 */
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	
}
