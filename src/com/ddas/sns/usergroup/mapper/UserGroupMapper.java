package com.ddas.sns.usergroup.mapper;

import com.ddas.sns.usergroup.domain.UserGroup;
import com.ddas.sns.usergroup.domain.UserGroupCriteria;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserGroupMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_group
     *
     * @mbggenerated Sun Jul 31 16:45:21 CST 2016
     */
    int countByExample(UserGroupCriteria example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_group
     *
     * @mbggenerated Sun Jul 31 16:45:21 CST 2016
     */
    int deleteByExample(UserGroupCriteria example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_group
     *
     * @mbggenerated Sun Jul 31 16:45:21 CST 2016
     */
    int deleteByPrimaryKey(String groupId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_group
     *
     * @mbggenerated Sun Jul 31 16:45:21 CST 2016
     */
    int insert(UserGroup record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_group
     *
     * @mbggenerated Sun Jul 31 16:45:21 CST 2016
     */
    int insertSelective(UserGroup record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_group
     *
     * @mbggenerated Sun Jul 31 16:45:21 CST 2016
     */
    List<UserGroup> selectByExample(UserGroupCriteria example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_group
     *
     * @mbggenerated Sun Jul 31 16:45:21 CST 2016
     */
    UserGroup selectByPrimaryKey(String groupId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_group
     *
     * @mbggenerated Sun Jul 31 16:45:21 CST 2016
     */
    int updateByExampleSelective(@Param("record") UserGroup record, @Param("example") UserGroupCriteria example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_group
     *
     * @mbggenerated Sun Jul 31 16:45:21 CST 2016
     */
    int updateByExample(@Param("record") UserGroup record, @Param("example") UserGroupCriteria example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_group
     *
     * @mbggenerated Sun Jul 31 16:45:21 CST 2016
     */
    int updateByPrimaryKeySelective(UserGroup record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_group
     *
     * @mbggenerated Sun Jul 31 16:45:21 CST 2016
     */
    int updateByPrimaryKey(UserGroup record);
}