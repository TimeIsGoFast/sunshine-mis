package net.zjwu.mis.system.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

import net.zjwu.mis.base.audit.CreateBy;
import net.zjwu.mis.base.audit.CreateDate;
import net.zjwu.mis.base.audit.UpdateBy;
import net.zjwu.mis.base.audit.UpdateDate;

import org.springframework.format.annotation.DateTimeFormat;

@Table(name = "t_s_resource")
public class Resource implements Serializable {
    @Id
    private Integer id;

    /**
     * 资源名
     */
    private String reid;

    /**
     * 资源中文名
     */
    private String name;

    /**
     * 类型
     */
    private String type;

    /**
     * 状态
     */
    private String enabled;

    /**
     * 创建时间
     */
    @CreateDate
    @DateTimeFormat
    @Column(name = "create_date")
    private Date createDate;

    /**
     * 修改时间
     */
    @UpdateDate
    @DateTimeFormat
    @Column(name = "update_date")
    private Date updateDate;

    /**
     * 创建者
     */
    @CreateBy
    @Column(name = "create_by")
    private String createBy;

    /**
     * 修改者
     */
    @UpdateBy
    @Column(name = "update_by")
    private String updateBy;

    /**
     * 备注
     */
    private String remark;

    /**
     * 父资源ID
     */
    private Integer pid;

    /**
     * 资源值
     */
    private String value;
    
    /**
     * 是否叶子节点
     */
    private String leaf;

    
    private static final long serialVersionUID = 1L;

    /**
     * @return id
     */
    public Integer getId() {
        return id;
    }

    /**
     * @param id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取资源名
     *
     * @return reid - 资源名
     */
    public String getReid() {
        return reid;
    }

    /**
     * 设置资源名
     *
     * @param reid 资源名
     */
    public void setReid(String reid) {
        this.reid = reid;
    }

    /**
     * 获取资源中文名
     *
     * @return name - 资源中文名
     */
    public String getName() {
        return name;
    }

    /**
     * 设置资源中文名
     *
     * @param name 资源中文名
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取类型
     *
     * @return type - 类型
     */
    public String getType() {
        return type;
    }

    /**
     * 设置类型
     *
     * @param type 类型
     */
    public void setType(String type) {
        this.type = type;
    }

    /**
     * 获取状态
     *
     * @return enabled - 状态
     */
    public String getEnabled() {
        return enabled;
    }

    /**
     * 设置状态
     *
     * @param enabled 状态
     */
    public void setEnabled(String enabled) {
        this.enabled = enabled;
    }

    /**
     * 获取创建时间
     *
     * @return create_date - 创建时间
     */
    public Date getCreateDate() {
        return createDate;
    }

    /**
     * 设置创建时间
     *
     * @param createDate 创建时间
     */
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    /**
     * 获取修改时间
     *
     * @return update_date - 修改时间
     */
    public Date getUpdateDate() {
        return updateDate;
    }

    /**
     * 设置修改时间
     *
     * @param updateDate 修改时间
     */
    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    /**
     * 获取创建者
     *
     * @return create_by - 创建者
     */
    public String getCreateBy() {
        return createBy;
    }

    /**
     * 设置创建者
     *
     * @param createBy 创建者
     */
    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    /**
     * 获取修改者
     *
     * @return update_by - 修改者
     */
    public String getUpdateBy() {
        return updateBy;
    }

    /**
     * 设置修改者
     *
     * @param updateBy 修改者
     */
    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    /**
     * 获取备注
     *
     * @return remark - 备注
     */
    public String getRemark() {
        return remark;
    }

    /**
     * 设置备注
     *
     * @param remark 备注
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

    /**
     * 获取父资源ID
     *
     * @return pid - 父资源ID
     */
    public Integer getPid() {
        return pid;
    }

    /**
     * 设置父资源ID
     *
     * @param pid 父资源ID
     */
    public void setPid(Integer pid) {
        this.pid = pid;
    }

    /**
     * 获取资源值
     *
     * @return value - 资源值
     */
    public String getValue() {
        return value;
    }

    /**
     * 设置资源值
     *
     * @param value 资源值
     */
    public void setValue(String value) {
        this.value = value;
    }

	/**
	 * @return the leaf
	 */
	public String getLeaf() {
		return leaf;
	}

	/**
	 * @param leaf the leaf to set
	 */
	public void setLeaf(String leaf) {
		this.leaf = leaf;
	}
    
}