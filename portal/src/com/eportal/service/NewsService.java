package com.eportal.service;

import java.util.List;
import com.eportal.ORM.News;

/** 新闻管理业务逻辑接口 */
public interface NewsService {
	/** 浏览新闻 */
	public List<News> browseNews();
	/** 装载指定的新闻 */	
	public News loadNews(Integer id);	
	/** 删除指定的新闻 */	
	public boolean delNews(Integer id);	
	/** 新增或修改新闻 */
	public boolean saveOrUpdateNews(News News);
	/**查出查看最多的前十条新闻*/
	public List<News> selectTopTen();
}
