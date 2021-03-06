package com.ddas.sns.image.domain;

import java.util.ArrayList;
import java.util.List;

public class ImageInfoCriteria {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table image_info
     *
     * @mbggenerated Mon Dec 12 21:26:57 CST 2016
     */
    protected String orderByClause;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table image_info
     *
     * @mbggenerated Mon Dec 12 21:26:57 CST 2016
     */
    protected boolean distinct;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table image_info
     *
     * @mbggenerated Mon Dec 12 21:26:57 CST 2016
     */
    protected List<Criteria> oredCriteria;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table image_info
     *
     * @mbggenerated Mon Dec 12 21:26:57 CST 2016
     */
    protected int limitStart = -1;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table image_info
     *
     * @mbggenerated Mon Dec 12 21:26:57 CST 2016
     */
    protected int limitEnd = -1;

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table image_info
     *
     * @mbggenerated Mon Dec 12 21:26:57 CST 2016
     */
    public ImageInfoCriteria() {
        oredCriteria = new ArrayList<Criteria>();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table image_info
     *
     * @mbggenerated Mon Dec 12 21:26:57 CST 2016
     */
    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table image_info
     *
     * @mbggenerated Mon Dec 12 21:26:57 CST 2016
     */
    public String getOrderByClause() {
        return orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table image_info
     *
     * @mbggenerated Mon Dec 12 21:26:57 CST 2016
     */
    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table image_info
     *
     * @mbggenerated Mon Dec 12 21:26:57 CST 2016
     */
    public boolean isDistinct() {
        return distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table image_info
     *
     * @mbggenerated Mon Dec 12 21:26:57 CST 2016
     */
    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table image_info
     *
     * @mbggenerated Mon Dec 12 21:26:57 CST 2016
     */
    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table image_info
     *
     * @mbggenerated Mon Dec 12 21:26:57 CST 2016
     */
    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table image_info
     *
     * @mbggenerated Mon Dec 12 21:26:57 CST 2016
     */
    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table image_info
     *
     * @mbggenerated Mon Dec 12 21:26:57 CST 2016
     */
    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table image_info
     *
     * @mbggenerated Mon Dec 12 21:26:57 CST 2016
     */
    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table image_info
     *
     * @mbggenerated Mon Dec 12 21:26:57 CST 2016
     */
    public void setLimitStart(int limitStart) {
        this.limitStart=limitStart;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table image_info
     *
     * @mbggenerated Mon Dec 12 21:26:57 CST 2016
     */
    public int getLimitStart() {
        return limitStart;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table image_info
     *
     * @mbggenerated Mon Dec 12 21:26:57 CST 2016
     */
    public void setLimitEnd(int limitEnd) {
        this.limitEnd=limitEnd;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table image_info
     *
     * @mbggenerated Mon Dec 12 21:26:57 CST 2016
     */
    public int getLimitEnd() {
        return limitEnd;
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table image_info
     *
     * @mbggenerated Mon Dec 12 21:26:57 CST 2016
     */
    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andZoimIdIsNull() {
            addCriterion("zoim_id is null");
            return (Criteria) this;
        }

        public Criteria andZoimIdIsNotNull() {
            addCriterion("zoim_id is not null");
            return (Criteria) this;
        }

        public Criteria andZoimIdEqualTo(String value) {
            addCriterion("zoim_id =", value, "zoimId");
            return (Criteria) this;
        }

        public Criteria andZoimIdNotEqualTo(String value) {
            addCriterion("zoim_id <>", value, "zoimId");
            return (Criteria) this;
        }

        public Criteria andZoimIdGreaterThan(String value) {
            addCriterion("zoim_id >", value, "zoimId");
            return (Criteria) this;
        }

        public Criteria andZoimIdGreaterThanOrEqualTo(String value) {
            addCriterion("zoim_id >=", value, "zoimId");
            return (Criteria) this;
        }

        public Criteria andZoimIdLessThan(String value) {
            addCriterion("zoim_id <", value, "zoimId");
            return (Criteria) this;
        }

        public Criteria andZoimIdLessThanOrEqualTo(String value) {
            addCriterion("zoim_id <=", value, "zoimId");
            return (Criteria) this;
        }

        public Criteria andZoimIdLike(String value) {
            addCriterion("zoim_id like", value, "zoimId");
            return (Criteria) this;
        }

        public Criteria andZoimIdNotLike(String value) {
            addCriterion("zoim_id not like", value, "zoimId");
            return (Criteria) this;
        }

        public Criteria andZoimIdIn(List<String> values) {
            addCriterion("zoim_id in", values, "zoimId");
            return (Criteria) this;
        }

        public Criteria andZoimIdNotIn(List<String> values) {
            addCriterion("zoim_id not in", values, "zoimId");
            return (Criteria) this;
        }

        public Criteria andZoimIdBetween(String value1, String value2) {
            addCriterion("zoim_id between", value1, value2, "zoimId");
            return (Criteria) this;
        }

        public Criteria andZoimIdNotBetween(String value1, String value2) {
            addCriterion("zoim_id not between", value1, value2, "zoimId");
            return (Criteria) this;
        }

        public Criteria andZoimGagaidIsNull() {
            addCriterion("zoim_gagaid is null");
            return (Criteria) this;
        }

        public Criteria andZoimGagaidIsNotNull() {
            addCriterion("zoim_gagaid is not null");
            return (Criteria) this;
        }

        public Criteria andZoimGagaidEqualTo(String value) {
            addCriterion("zoim_gagaid =", value, "zoimGagaid");
            return (Criteria) this;
        }

        public Criteria andZoimGagaidNotEqualTo(String value) {
            addCriterion("zoim_gagaid <>", value, "zoimGagaid");
            return (Criteria) this;
        }

        public Criteria andZoimGagaidGreaterThan(String value) {
            addCriterion("zoim_gagaid >", value, "zoimGagaid");
            return (Criteria) this;
        }

        public Criteria andZoimGagaidGreaterThanOrEqualTo(String value) {
            addCriterion("zoim_gagaid >=", value, "zoimGagaid");
            return (Criteria) this;
        }

        public Criteria andZoimGagaidLessThan(String value) {
            addCriterion("zoim_gagaid <", value, "zoimGagaid");
            return (Criteria) this;
        }

        public Criteria andZoimGagaidLessThanOrEqualTo(String value) {
            addCriterion("zoim_gagaid <=", value, "zoimGagaid");
            return (Criteria) this;
        }

        public Criteria andZoimGagaidLike(String value) {
            addCriterion("zoim_gagaid like", value, "zoimGagaid");
            return (Criteria) this;
        }

        public Criteria andZoimGagaidNotLike(String value) {
            addCriterion("zoim_gagaid not like", value, "zoimGagaid");
            return (Criteria) this;
        }

        public Criteria andZoimGagaidIn(List<String> values) {
            addCriterion("zoim_gagaid in", values, "zoimGagaid");
            return (Criteria) this;
        }

        public Criteria andZoimGagaidNotIn(List<String> values) {
            addCriterion("zoim_gagaid not in", values, "zoimGagaid");
            return (Criteria) this;
        }

        public Criteria andZoimGagaidBetween(String value1, String value2) {
            addCriterion("zoim_gagaid between", value1, value2, "zoimGagaid");
            return (Criteria) this;
        }

        public Criteria andZoimGagaidNotBetween(String value1, String value2) {
            addCriterion("zoim_gagaid not between", value1, value2, "zoimGagaid");
            return (Criteria) this;
        }

        public Criteria andZoimZoneidIsNull() {
            addCriterion("zoim_zoneid is null");
            return (Criteria) this;
        }

        public Criteria andZoimZoneidIsNotNull() {
            addCriterion("zoim_zoneid is not null");
            return (Criteria) this;
        }

        public Criteria andZoimZoneidEqualTo(String value) {
            addCriterion("zoim_zoneid =", value, "zoimZoneid");
            return (Criteria) this;
        }

        public Criteria andZoimZoneidNotEqualTo(String value) {
            addCriterion("zoim_zoneid <>", value, "zoimZoneid");
            return (Criteria) this;
        }

        public Criteria andZoimZoneidGreaterThan(String value) {
            addCriterion("zoim_zoneid >", value, "zoimZoneid");
            return (Criteria) this;
        }

        public Criteria andZoimZoneidGreaterThanOrEqualTo(String value) {
            addCriterion("zoim_zoneid >=", value, "zoimZoneid");
            return (Criteria) this;
        }

        public Criteria andZoimZoneidLessThan(String value) {
            addCriterion("zoim_zoneid <", value, "zoimZoneid");
            return (Criteria) this;
        }

        public Criteria andZoimZoneidLessThanOrEqualTo(String value) {
            addCriterion("zoim_zoneid <=", value, "zoimZoneid");
            return (Criteria) this;
        }

        public Criteria andZoimZoneidLike(String value) {
            addCriterion("zoim_zoneid like", value, "zoimZoneid");
            return (Criteria) this;
        }

        public Criteria andZoimZoneidNotLike(String value) {
            addCriterion("zoim_zoneid not like", value, "zoimZoneid");
            return (Criteria) this;
        }

        public Criteria andZoimZoneidIn(List<String> values) {
            addCriterion("zoim_zoneid in", values, "zoimZoneid");
            return (Criteria) this;
        }

        public Criteria andZoimZoneidNotIn(List<String> values) {
            addCriterion("zoim_zoneid not in", values, "zoimZoneid");
            return (Criteria) this;
        }

        public Criteria andZoimZoneidBetween(String value1, String value2) {
            addCriterion("zoim_zoneid between", value1, value2, "zoimZoneid");
            return (Criteria) this;
        }

        public Criteria andZoimZoneidNotBetween(String value1, String value2) {
            addCriterion("zoim_zoneid not between", value1, value2, "zoimZoneid");
            return (Criteria) this;
        }

        public Criteria andZoimImgurlIsNull() {
            addCriterion("zoim_imgurl is null");
            return (Criteria) this;
        }

        public Criteria andZoimImgurlIsNotNull() {
            addCriterion("zoim_imgurl is not null");
            return (Criteria) this;
        }

        public Criteria andZoimImgurlEqualTo(String value) {
            addCriterion("zoim_imgurl =", value, "zoimImgurl");
            return (Criteria) this;
        }

        public Criteria andZoimImgurlNotEqualTo(String value) {
            addCriterion("zoim_imgurl <>", value, "zoimImgurl");
            return (Criteria) this;
        }

        public Criteria andZoimImgurlGreaterThan(String value) {
            addCriterion("zoim_imgurl >", value, "zoimImgurl");
            return (Criteria) this;
        }

        public Criteria andZoimImgurlGreaterThanOrEqualTo(String value) {
            addCriterion("zoim_imgurl >=", value, "zoimImgurl");
            return (Criteria) this;
        }

        public Criteria andZoimImgurlLessThan(String value) {
            addCriterion("zoim_imgurl <", value, "zoimImgurl");
            return (Criteria) this;
        }

        public Criteria andZoimImgurlLessThanOrEqualTo(String value) {
            addCriterion("zoim_imgurl <=", value, "zoimImgurl");
            return (Criteria) this;
        }

        public Criteria andZoimImgurlLike(String value) {
            addCriterion("zoim_imgurl like", value, "zoimImgurl");
            return (Criteria) this;
        }

        public Criteria andZoimImgurlNotLike(String value) {
            addCriterion("zoim_imgurl not like", value, "zoimImgurl");
            return (Criteria) this;
        }

        public Criteria andZoimImgurlIn(List<String> values) {
            addCriterion("zoim_imgurl in", values, "zoimImgurl");
            return (Criteria) this;
        }

        public Criteria andZoimImgurlNotIn(List<String> values) {
            addCriterion("zoim_imgurl not in", values, "zoimImgurl");
            return (Criteria) this;
        }

        public Criteria andZoimImgurlBetween(String value1, String value2) {
            addCriterion("zoim_imgurl between", value1, value2, "zoimImgurl");
            return (Criteria) this;
        }

        public Criteria andZoimImgurlNotBetween(String value1, String value2) {
            addCriterion("zoim_imgurl not between", value1, value2, "zoimImgurl");
            return (Criteria) this;
        }

        public Criteria andZoimSortIsNull() {
            addCriterion("zoim_sort is null");
            return (Criteria) this;
        }

        public Criteria andZoimSortIsNotNull() {
            addCriterion("zoim_sort is not null");
            return (Criteria) this;
        }

        public Criteria andZoimSortEqualTo(Integer value) {
            addCriterion("zoim_sort =", value, "zoimSort");
            return (Criteria) this;
        }

        public Criteria andZoimSortNotEqualTo(Integer value) {
            addCriterion("zoim_sort <>", value, "zoimSort");
            return (Criteria) this;
        }

        public Criteria andZoimSortGreaterThan(Integer value) {
            addCriterion("zoim_sort >", value, "zoimSort");
            return (Criteria) this;
        }

        public Criteria andZoimSortGreaterThanOrEqualTo(Integer value) {
            addCriterion("zoim_sort >=", value, "zoimSort");
            return (Criteria) this;
        }

        public Criteria andZoimSortLessThan(Integer value) {
            addCriterion("zoim_sort <", value, "zoimSort");
            return (Criteria) this;
        }

        public Criteria andZoimSortLessThanOrEqualTo(Integer value) {
            addCriterion("zoim_sort <=", value, "zoimSort");
            return (Criteria) this;
        }

        public Criteria andZoimSortIn(List<Integer> values) {
            addCriterion("zoim_sort in", values, "zoimSort");
            return (Criteria) this;
        }

        public Criteria andZoimSortNotIn(List<Integer> values) {
            addCriterion("zoim_sort not in", values, "zoimSort");
            return (Criteria) this;
        }

        public Criteria andZoimSortBetween(Integer value1, Integer value2) {
            addCriterion("zoim_sort between", value1, value2, "zoimSort");
            return (Criteria) this;
        }

        public Criteria andZoimSortNotBetween(Integer value1, Integer value2) {
            addCriterion("zoim_sort not between", value1, value2, "zoimSort");
            return (Criteria) this;
        }

        public Criteria andZoimStateIsNull() {
            addCriterion("zoim_state is null");
            return (Criteria) this;
        }

        public Criteria andZoimStateIsNotNull() {
            addCriterion("zoim_state is not null");
            return (Criteria) this;
        }

        public Criteria andZoimStateEqualTo(String value) {
            addCriterion("zoim_state =", value, "zoimState");
            return (Criteria) this;
        }

        public Criteria andZoimStateNotEqualTo(String value) {
            addCriterion("zoim_state <>", value, "zoimState");
            return (Criteria) this;
        }

        public Criteria andZoimStateGreaterThan(String value) {
            addCriterion("zoim_state >", value, "zoimState");
            return (Criteria) this;
        }

        public Criteria andZoimStateGreaterThanOrEqualTo(String value) {
            addCriterion("zoim_state >=", value, "zoimState");
            return (Criteria) this;
        }

        public Criteria andZoimStateLessThan(String value) {
            addCriterion("zoim_state <", value, "zoimState");
            return (Criteria) this;
        }

        public Criteria andZoimStateLessThanOrEqualTo(String value) {
            addCriterion("zoim_state <=", value, "zoimState");
            return (Criteria) this;
        }

        public Criteria andZoimStateLike(String value) {
            addCriterion("zoim_state like", value, "zoimState");
            return (Criteria) this;
        }

        public Criteria andZoimStateNotLike(String value) {
            addCriterion("zoim_state not like", value, "zoimState");
            return (Criteria) this;
        }

        public Criteria andZoimStateIn(List<String> values) {
            addCriterion("zoim_state in", values, "zoimState");
            return (Criteria) this;
        }

        public Criteria andZoimStateNotIn(List<String> values) {
            addCriterion("zoim_state not in", values, "zoimState");
            return (Criteria) this;
        }

        public Criteria andZoimStateBetween(String value1, String value2) {
            addCriterion("zoim_state between", value1, value2, "zoimState");
            return (Criteria) this;
        }

        public Criteria andZoimStateNotBetween(String value1, String value2) {
            addCriterion("zoim_state not between", value1, value2, "zoimState");
            return (Criteria) this;
        }

        public Criteria andZoimIsrecommendIsNull() {
            addCriterion("zoim_isrecommend is null");
            return (Criteria) this;
        }

        public Criteria andZoimIsrecommendIsNotNull() {
            addCriterion("zoim_isrecommend is not null");
            return (Criteria) this;
        }

        public Criteria andZoimIsrecommendEqualTo(String value) {
            addCriterion("zoim_isrecommend =", value, "zoimIsrecommend");
            return (Criteria) this;
        }

        public Criteria andZoimIsrecommendNotEqualTo(String value) {
            addCriterion("zoim_isrecommend <>", value, "zoimIsrecommend");
            return (Criteria) this;
        }

        public Criteria andZoimIsrecommendGreaterThan(String value) {
            addCriterion("zoim_isrecommend >", value, "zoimIsrecommend");
            return (Criteria) this;
        }

        public Criteria andZoimIsrecommendGreaterThanOrEqualTo(String value) {
            addCriterion("zoim_isrecommend >=", value, "zoimIsrecommend");
            return (Criteria) this;
        }

        public Criteria andZoimIsrecommendLessThan(String value) {
            addCriterion("zoim_isrecommend <", value, "zoimIsrecommend");
            return (Criteria) this;
        }

        public Criteria andZoimIsrecommendLessThanOrEqualTo(String value) {
            addCriterion("zoim_isrecommend <=", value, "zoimIsrecommend");
            return (Criteria) this;
        }

        public Criteria andZoimIsrecommendLike(String value) {
            addCriterion("zoim_isrecommend like", value, "zoimIsrecommend");
            return (Criteria) this;
        }

        public Criteria andZoimIsrecommendNotLike(String value) {
            addCriterion("zoim_isrecommend not like", value, "zoimIsrecommend");
            return (Criteria) this;
        }

        public Criteria andZoimIsrecommendIn(List<String> values) {
            addCriterion("zoim_isrecommend in", values, "zoimIsrecommend");
            return (Criteria) this;
        }

        public Criteria andZoimIsrecommendNotIn(List<String> values) {
            addCriterion("zoim_isrecommend not in", values, "zoimIsrecommend");
            return (Criteria) this;
        }

        public Criteria andZoimIsrecommendBetween(String value1, String value2) {
            addCriterion("zoim_isrecommend between", value1, value2, "zoimIsrecommend");
            return (Criteria) this;
        }

        public Criteria andZoimIsrecommendNotBetween(String value1, String value2) {
            addCriterion("zoim_isrecommend not between", value1, value2, "zoimIsrecommend");
            return (Criteria) this;
        }

        public Criteria andZoimLikecountIsNull() {
            addCriterion("zoim_likecount is null");
            return (Criteria) this;
        }

        public Criteria andZoimLikecountIsNotNull() {
            addCriterion("zoim_likecount is not null");
            return (Criteria) this;
        }

        public Criteria andZoimLikecountEqualTo(Integer value) {
            addCriterion("zoim_likecount =", value, "zoimLikecount");
            return (Criteria) this;
        }

        public Criteria andZoimLikecountNotEqualTo(Integer value) {
            addCriterion("zoim_likecount <>", value, "zoimLikecount");
            return (Criteria) this;
        }

        public Criteria andZoimLikecountGreaterThan(Integer value) {
            addCriterion("zoim_likecount >", value, "zoimLikecount");
            return (Criteria) this;
        }

        public Criteria andZoimLikecountGreaterThanOrEqualTo(Integer value) {
            addCriterion("zoim_likecount >=", value, "zoimLikecount");
            return (Criteria) this;
        }

        public Criteria andZoimLikecountLessThan(Integer value) {
            addCriterion("zoim_likecount <", value, "zoimLikecount");
            return (Criteria) this;
        }

        public Criteria andZoimLikecountLessThanOrEqualTo(Integer value) {
            addCriterion("zoim_likecount <=", value, "zoimLikecount");
            return (Criteria) this;
        }

        public Criteria andZoimLikecountIn(List<Integer> values) {
            addCriterion("zoim_likecount in", values, "zoimLikecount");
            return (Criteria) this;
        }

        public Criteria andZoimLikecountNotIn(List<Integer> values) {
            addCriterion("zoim_likecount not in", values, "zoimLikecount");
            return (Criteria) this;
        }

        public Criteria andZoimLikecountBetween(Integer value1, Integer value2) {
            addCriterion("zoim_likecount between", value1, value2, "zoimLikecount");
            return (Criteria) this;
        }

        public Criteria andZoimLikecountNotBetween(Integer value1, Integer value2) {
            addCriterion("zoim_likecount not between", value1, value2, "zoimLikecount");
            return (Criteria) this;
        }

        public Criteria andZoimTimeIsNull() {
            addCriterion("zoim_time is null");
            return (Criteria) this;
        }

        public Criteria andZoimTimeIsNotNull() {
            addCriterion("zoim_time is not null");
            return (Criteria) this;
        }

        public Criteria andZoimTimeEqualTo(String value) {
            addCriterion("zoim_time =", value, "zoimTime");
            return (Criteria) this;
        }

        public Criteria andZoimTimeNotEqualTo(String value) {
            addCriterion("zoim_time <>", value, "zoimTime");
            return (Criteria) this;
        }

        public Criteria andZoimTimeGreaterThan(String value) {
            addCriterion("zoim_time >", value, "zoimTime");
            return (Criteria) this;
        }

        public Criteria andZoimTimeGreaterThanOrEqualTo(String value) {
            addCriterion("zoim_time >=", value, "zoimTime");
            return (Criteria) this;
        }

        public Criteria andZoimTimeLessThan(String value) {
            addCriterion("zoim_time <", value, "zoimTime");
            return (Criteria) this;
        }

        public Criteria andZoimTimeLessThanOrEqualTo(String value) {
            addCriterion("zoim_time <=", value, "zoimTime");
            return (Criteria) this;
        }

        public Criteria andZoimTimeLike(String value) {
            addCriterion("zoim_time like", value, "zoimTime");
            return (Criteria) this;
        }

        public Criteria andZoimTimeNotLike(String value) {
            addCriterion("zoim_time not like", value, "zoimTime");
            return (Criteria) this;
        }

        public Criteria andZoimTimeIn(List<String> values) {
            addCriterion("zoim_time in", values, "zoimTime");
            return (Criteria) this;
        }

        public Criteria andZoimTimeNotIn(List<String> values) {
            addCriterion("zoim_time not in", values, "zoimTime");
            return (Criteria) this;
        }

        public Criteria andZoimTimeBetween(String value1, String value2) {
            addCriterion("zoim_time between", value1, value2, "zoimTime");
            return (Criteria) this;
        }

        public Criteria andZoimTimeNotBetween(String value1, String value2) {
            addCriterion("zoim_time not between", value1, value2, "zoimTime");
            return (Criteria) this;
        }

        public Criteria andZoneImgcountIsNull() {
            addCriterion("zone_imgcount is null");
            return (Criteria) this;
        }

        public Criteria andZoneImgcountIsNotNull() {
            addCriterion("zone_imgcount is not null");
            return (Criteria) this;
        }

        public Criteria andZoneImgcountEqualTo(Integer value) {
            addCriterion("zone_imgcount =", value, "zoneImgcount");
            return (Criteria) this;
        }

        public Criteria andZoneImgcountNotEqualTo(Integer value) {
            addCriterion("zone_imgcount <>", value, "zoneImgcount");
            return (Criteria) this;
        }

        public Criteria andZoneImgcountGreaterThan(Integer value) {
            addCriterion("zone_imgcount >", value, "zoneImgcount");
            return (Criteria) this;
        }

        public Criteria andZoneImgcountGreaterThanOrEqualTo(Integer value) {
            addCriterion("zone_imgcount >=", value, "zoneImgcount");
            return (Criteria) this;
        }

        public Criteria andZoneImgcountLessThan(Integer value) {
            addCriterion("zone_imgcount <", value, "zoneImgcount");
            return (Criteria) this;
        }

        public Criteria andZoneImgcountLessThanOrEqualTo(Integer value) {
            addCriterion("zone_imgcount <=", value, "zoneImgcount");
            return (Criteria) this;
        }

        public Criteria andZoneImgcountIn(List<Integer> values) {
            addCriterion("zone_imgcount in", values, "zoneImgcount");
            return (Criteria) this;
        }

        public Criteria andZoneImgcountNotIn(List<Integer> values) {
            addCriterion("zone_imgcount not in", values, "zoneImgcount");
            return (Criteria) this;
        }

        public Criteria andZoneImgcountBetween(Integer value1, Integer value2) {
            addCriterion("zone_imgcount between", value1, value2, "zoneImgcount");
            return (Criteria) this;
        }

        public Criteria andZoneImgcountNotBetween(Integer value1, Integer value2) {
            addCriterion("zone_imgcount not between", value1, value2, "zoneImgcount");
            return (Criteria) this;
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table image_info
     *
     * @mbggenerated do_not_delete_during_merge Mon Dec 12 21:26:57 CST 2016
     */
    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }

        public Criteria andZoimIdLikeInsensitive(String value) {
            addCriterion("upper(zoim_id) like", value.toUpperCase(), "zoimId");
            return this;
        }

        public Criteria andZoimGagaidLikeInsensitive(String value) {
            addCriterion("upper(zoim_gagaid) like", value.toUpperCase(), "zoimGagaid");
            return this;
        }

        public Criteria andZoimZoneidLikeInsensitive(String value) {
            addCriterion("upper(zoim_zoneid) like", value.toUpperCase(), "zoimZoneid");
            return this;
        }

        public Criteria andZoimImgurlLikeInsensitive(String value) {
            addCriterion("upper(zoim_imgurl) like", value.toUpperCase(), "zoimImgurl");
            return this;
        }

        public Criteria andZoimStateLikeInsensitive(String value) {
            addCriterion("upper(zoim_state) like", value.toUpperCase(), "zoimState");
            return this;
        }

        public Criteria andZoimIsrecommendLikeInsensitive(String value) {
            addCriterion("upper(zoim_isrecommend) like", value.toUpperCase(), "zoimIsrecommend");
            return this;
        }

        public Criteria andZoimTimeLikeInsensitive(String value) {
            addCriterion("upper(zoim_time) like", value.toUpperCase(), "zoimTime");
            return this;
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table image_info
     *
     * @mbggenerated Mon Dec 12 21:26:57 CST 2016
     */
    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}