package com.ddas.sns.staticgift.service;

import com.ddas.common.page.Page;
import com.ddas.common.util.date.DateUtil;
import com.ddas.common.util.uuid.UUIDUtil;
import com.ddas.sns.blogcomment.domain.BlogComment;
import com.ddas.sns.blogcomment.domain.BlogCommentDto;
import com.ddas.sns.blogcomment.domain.BlogCommentExample;
import com.ddas.sns.blogcomment.mapper.BlogCommentMapper;
import com.ddas.sns.blogcomment.mapper.BlogCommentWithUserMapper;
import com.ddas.sns.staticgift.domain.StaticGiftCriteria;
import com.ddas.sns.staticgift.mapper.StaticGiftMapper;
import com.ddas.sns.userinfo.domain.UserInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * ClassName:	BlogCommentService
 * Function: 	日志评论Service
 *
 * @author liuchen
 * @date 2016/7/10 13:33
 * @since JDK 1.6
 */
@Service
public class StaticGiftService {
    private final static Logger LOGGER = LoggerFactory.getLogger(StaticGiftService.class);

    @Resource
    private StaticGiftMapper staticGiftMapper;

    /**
     * 分页查找userBlog
     *@param currentPage
     *@param pageSize
     *@param giftProperty
     *@return com.ddas.common.page.Page
     *@Author liuchen6
     *@Date 2016/7/7 18:04
     *@since JDK1.7
     */
    public Page queryRecordsByPage(int currentPage, int pageSize, String giftProperty) {
        Page page = new Page();
        page.setCurrentPage(currentPage);
        page.setPageSize(pageSize);
        StaticGiftCriteria staticGiftCriteria = new StaticGiftCriteria();
        staticGiftCriteria.setOrderByClause("gift_id");
        staticGiftCriteria.setLimitStart(page.getPageStart());
        staticGiftCriteria.setLimitEnd(pageSize);

        StaticGiftCriteria.Criteria criteria = staticGiftCriteria.createCriteria();
        criteria.andGiftPropertyEqualTo(giftProperty);
        if(currentPage==1){//如果是当前第一页，则要求总数
            page.setTotalCount(staticGiftMapper.countByExample(staticGiftCriteria));
        }
        page.setDataList(staticGiftMapper.selectByExample(staticGiftCriteria));

        return page;
    }

}
