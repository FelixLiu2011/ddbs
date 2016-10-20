package com.ddas.sns.vip.domain;

import java.io.Serializable;

public class VipPrivs implements Serializable {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column vip_privs.vip_priv_id
     *
     * @mbggenerated Fri Aug 12 22:17:41 CST 2016
     */
    private String vipPrivId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column vip_privs.vip_type_code
     *
     * @mbggenerated Fri Aug 12 22:17:41 CST 2016
     */
    private String vipTypeCode;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column vip_privs.priv_type
     *
     * @mbggenerated Fri Aug 12 22:17:41 CST 2016
     */
    private String privType;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column vip_privs.priv_value
     *
     * @mbggenerated Fri Aug 12 22:17:41 CST 2016
     */
    private String privValue;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table vip_privs
     *
     * @mbggenerated Fri Aug 12 22:17:41 CST 2016
     */
    private static final long serialVersionUID = 1L;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column vip_privs.vip_priv_id
     *
     * @return the value of vip_privs.vip_priv_id
     *
     * @mbggenerated Fri Aug 12 22:17:41 CST 2016
     */
    public String getVipPrivId() {
        return vipPrivId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column vip_privs.vip_priv_id
     *
     * @param vipPrivId the value for vip_privs.vip_priv_id
     *
     * @mbggenerated Fri Aug 12 22:17:41 CST 2016
     */
    public void setVipPrivId(String vipPrivId) {
        this.vipPrivId = vipPrivId == null ? null : vipPrivId.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column vip_privs.vip_type_code
     *
     * @return the value of vip_privs.vip_type_code
     *
     * @mbggenerated Fri Aug 12 22:17:41 CST 2016
     */
    public String getVipTypeCode() {
        return vipTypeCode;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column vip_privs.vip_type_code
     *
     * @param vipTypeCode the value for vip_privs.vip_type_code
     *
     * @mbggenerated Fri Aug 12 22:17:41 CST 2016
     */
    public void setVipTypeCode(String vipTypeCode) {
        this.vipTypeCode = vipTypeCode == null ? null : vipTypeCode.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column vip_privs.priv_type
     *
     * @return the value of vip_privs.priv_type
     *
     * @mbggenerated Fri Aug 12 22:17:41 CST 2016
     */
    public String getPrivType() {
        return privType;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column vip_privs.priv_type
     *
     * @param privType the value for vip_privs.priv_type
     *
     * @mbggenerated Fri Aug 12 22:17:41 CST 2016
     */
    public void setPrivType(String privType) {
        this.privType = privType == null ? null : privType.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column vip_privs.priv_value
     *
     * @return the value of vip_privs.priv_value
     *
     * @mbggenerated Fri Aug 12 22:17:41 CST 2016
     */
    public String getPrivValue() {
        return privValue;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column vip_privs.priv_value
     *
     * @param privValue the value for vip_privs.priv_value
     *
     * @mbggenerated Fri Aug 12 22:17:41 CST 2016
     */
    public void setPrivValue(String privValue) {
        this.privValue = privValue == null ? null : privValue.trim();
    }
}