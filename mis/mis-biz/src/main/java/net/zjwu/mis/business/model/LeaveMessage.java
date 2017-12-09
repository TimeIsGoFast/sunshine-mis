package net.zjwu.mis.business.model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

@Table(name = "t_t_leave_message")
public class LeaveMessage implements Serializable {
    /**
     * id
     */
    @Id
    private Integer id;

    /**
     * 账号
     */
    private String uid;

    /**
     * 创建时间
     */
    @Column(name = "Creat_time")
    private Date creatTime;

    /**
     * 内容
     */
    private String content;

    private static final long serialVersionUID = 1L;

    /**
     * 获取id
     *
     * @return id - id
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置id
     *
     * @param id id
     */
    public void setId(Integer id) {
        this.id = id;
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
     * @return Creat_time - 创建时间
     */
    public Date getCreatTime() {
        return creatTime;
    }

    /**
     * 设置创建时间
     *
     * @param creatTime 创建时间
     */
    public void setCreatTime(Date creatTime) {
        this.creatTime = creatTime;
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