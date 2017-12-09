package net.zjwu.mis.business.model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

@Table(name = "t_v_message")
public class MessageInfo implements Serializable {
    /**
     * 账号
     */
    private String uid;

    /**
     * 创建时间
     */
    private Date time;

    /**
     * 中文名
     */
    private String name;

    /**
     * 内容
     */
    private String content;
    private String headimg;

    private static final long serialVersionUID = 1L;
  
    
   

	public String getHeadimg() {
		return headimg;
	}

	public void setHeadimg(String headimg) {
		this.headimg = headimg;
	}

	/**
     * 获取账号
     *
     * @return uid - 账号
     */
    public String getUid() {
        return uid;
    }

    /**
     * 设置账号
     *
     * @param uid 账号
     */
    public void setUid(String uid) {
        this.uid = uid;
    }

    /**
     * 获取创建时间
     *
     * @return time - 创建时间
     */
    public Date getTime() {
        return time;
    }

    /**
     * 设置创建时间
     *
     * @param time 创建时间
     */
    public void setTime(Date time) {
        this.time = time;
    }

    /**
     * 获取中文名
     *
     * @return name - 中文名
     */
    public String getName() {
        return name;
    }

    /**
     * 设置中文名
     *
     * @param name 中文名
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取内容
     *
     * @return content - 内容
     */
    public String getContent() {
        return content;
    }

    /**
     * 设置内容
     *
     * @param content 内容
     */
    public void setContent(String content) {
        this.content = content;
    }
}