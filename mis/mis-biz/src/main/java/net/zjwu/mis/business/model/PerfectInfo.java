package net.zjwu.mis.business.model;

import java.io.Serializable;
import javax.persistence.*;

@Table(name = "t_t_perfectinfo")
public class PerfectInfo implements Serializable {
    /**
     * id
     */
    @Id
    private Integer id;

    /**
     * 用户账号
     */
    private String uid;

    /**
     * 姓名
     */
    private String name;

    /**
     * 昵称
     */
    private String nickname;

    /**
     * 手机号
     */
    private String tel;

    /**
     * 邮箱
     */
    private String mail;

    /**
     * 生日
     */
    private String birth;

    private String remark;

    /**
     * 头像图片路径
     */
    @Column(name = "headImg")
    private String headimg;

    /**
     * 创建日期
     */
    private String time;

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
     * 获取用户账号
     *
     * @return uid - 用户账号
     */
    public String getUid() {
        return uid;
    }

    /**
     * 设置用户账号
     *
     * @param uid 用户账号
     */
    public void setUid(String uid) {
        this.uid = uid;
    }

    /**
     * 获取姓名
     *
     * @return name - 姓名
     */
    public String getName() {
        return name;
    }

    /**
     * 设置姓名
     *
     * @param name 姓名
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取昵称
     *
     * @return nickname - 昵称
     */
    public String getNickname() {
        return nickname;
    }

    /**
     * 设置昵称
     *
     * @param nickname 昵称
     */
    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    /**
     * 获取手机号
     *
     * @return tel - 手机号
     */
    public String getTel() {
        return tel;
    }

    /**
     * 设置手机号
     *
     * @param tel 手机号
     */
    public void setTel(String tel) {
        this.tel = tel;
    }

    /**
     * 获取邮箱
     *
     * @return mail - 邮箱
     */
    public String getMail() {
        return mail;
    }

    /**
     * 设置邮箱
     *
     * @param mail 邮箱
     */
    public void setMail(String mail) {
        this.mail = mail;
    }

    /**
     * 获取生日
     *
     * @return birth - 生日
     */
    public String getBirth() {
        return birth;
    }

    /**
     * 设置生日
     *
     * @param birth 生日
     */
    public void setBirth(String birth) {
        this.birth = birth;
    }

    /**
     * @return remark
     */
    public String getRemark() {
        return remark;
    }

    /**
     * @param remark
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

    /**
     * 获取头像图片路径
     *
     * @return headImg - 头像图片路径
     */
    public String getHeadimg() {
        return headimg;
    }

    /**
     * 设置头像图片路径
     *
     * @param headimg 头像图片路径
     */
    public void setHeadimg(String headimg) {
        this.headimg = headimg;
    }

    /**
     * 获取创建日期
     *
     * @return time - 创建日期
     */
    public String getTime() {
        return time;
    }

    /**
     * 设置创建日期
     *
     * @param time 创建日期
     */
    public void setTime(String time) {
        this.time = time;
    }
}