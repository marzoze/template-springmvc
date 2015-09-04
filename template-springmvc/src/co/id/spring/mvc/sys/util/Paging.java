/*
 * Copyright 2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package co.id.spring.mvc.sys.util;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Paging utility.
 * 
 * <pre>
 * Paging paging = new Paging();
 * // set total results to 100, current page to 3.
 * paging.setTotalResults(100);
 * paging.setCurrentPage(3);
 * </pre>
 * 
 * @author Byeongkil Woo
 */
public class Paging implements Serializable {

	private static final long serialVersionUID = 2439137595310411068L;

	public static final int INITED_CURRENT_PAGE = 1;

	public static final int DEFAULT_MAX_RESULTS = 10;

	public static final int DEFAULT_PAGING_LINKS = 10;

	public static final int PAGING_LINKS_STYLE_STATIC = 0;

	public static final int PAGING_LINKS_STYLE_DYNAMIC = 1;

	private boolean inited = false;

	private int currentPage = INITED_CURRENT_PAGE;

	private int maxResults = DEFAULT_MAX_RESULTS;

	private int pagingLinks = DEFAULT_PAGING_LINKS;

	private int pagingLinksStyle = PAGING_LINKS_STYLE_STATIC;

	private int totalResults = 0;
	
	private int start = 0;	

	private int end = 0;
	
	private int limit = 10;
	
	private boolean extPaging;
	
	private String userId;
	
	private String status;
	
	private String type;
	
	private String menu;
	
	private Date startDate;
	
	private Date endDate;
	
	private String sorting;
	
	private String searchBy;
	
	private String searchKey;
	
	private String searchField;

	public Paging() {
		this(DEFAULT_MAX_RESULTS, DEFAULT_PAGING_LINKS, PAGING_LINKS_STYLE_STATIC);
	}

	public Paging(int maxResults) {
		this(maxResults, DEFAULT_PAGING_LINKS, PAGING_LINKS_STYLE_STATIC);
	}

	public Paging(int maxResults, int pagingLinks) {
		this(maxResults, pagingLinks, PAGING_LINKS_STYLE_STATIC);
	}

	public Paging(int maxResults, int pagingLinks, int pagingLinkStyle) {
		if (maxResults < 1) {
			throw new IllegalArgumentException("maxResults must not smaller than 1 but " + maxResults);
		}

		if (pagingLinks < 1) {
			throw new IllegalArgumentException("pagingLinks must not smaller than 1 but " + pagingLinks);
		}

		if (pagingLinkStyle != PAGING_LINKS_STYLE_STATIC && pagingLinkStyle != PAGING_LINKS_STYLE_DYNAMIC) {
			throw new IllegalArgumentException("pagingLinkStyle must be " + PAGING_LINKS_STYLE_STATIC + " or " + PAGING_LINKS_STYLE_DYNAMIC + " but " + pagingLinkStyle);
		}

		this.maxResults = maxResults;
		this.pagingLinks = pagingLinks;
		this.pagingLinksStyle = pagingLinkStyle;
	}

	public int getFirstResult() {
		if (extPaging) {
			return Math.max((getCurrentPage() - 1) * maxResults, 0);//getStart();
		} else {
			return Math.max((getCurrentPage() - 1) * maxResults, 0);
		}
		
	}

	public int getFirstRownum() {
		return getFirstResult() + 1;
	}

	public int getLastRownum() {
		return getFirstResult() + maxResults;
	}

	public int getFirstPage() {
		return Math.min(totalResults, 1);
	}

	public int getCurrentResultNum() {
		return getTotalResults() - ((getCurrentPage() - 1) * getMaxResults());
	}

	public int getLastPage() {
		return (int) Math.ceil((double) totalResults / maxResults);
	}

	public int getStartPagingLink() {
		if (pagingLinksStyle == PAGING_LINKS_STYLE_DYNAMIC) {
			return Math.max(getCurrentPage() - pagingLinks, getFirstPage());
		}

		return (getCurrentPage() - 1) / pagingLinks * pagingLinks + 1;
	}

	public int getEndPagingLink() {
		if (pagingLinksStyle == PAGING_LINKS_STYLE_DYNAMIC) {
			return Math.min(getCurrentPage() + pagingLinks, getLastPage());
		}

		return Math.min(getStartPagingLink() + pagingLinks - 1, getLastPage());
	}

	public int getPrelinkPage() {
		return Math.max(getCurrentPage() - 1, getFirstPage());
		//return Math.max(getStartPagingLink() - 1, getFirstPage());
	}

	public int getPostlinkPage() {
		return Math.min(getCurrentPage() + 1, getLastPage());
		//return Math.min(getEndPagingLink() + 1, getLastPage());
	}

	public int getCurrentPage() {
		if (isInited()) {
			return Math.min(currentPage, getLastPage());
		}
		else {
			return currentPage;
		}
	}

	public void setCurrentPage(int currentPage) {
		if (currentPage < 1) {
			return;
		}

		this.currentPage = currentPage;
	}

	public int getMaxResults() {
		if (extPaging) {
			return getLimit();
		} else {
			return maxResults;
		}
		
	}

	protected void setMaxResults(int maxResults) {
		if (maxResults < 1) {
			return;
		}

		this.maxResults = maxResults;
	}

	public int getTotalResults() {
		return totalResults;
	}

	public void setTotalResults(int totalResults) {
		this.totalResults = totalResults;
		this.inited = true;
	}

	public int getPagingLinks() {
		return pagingLinks;
	}

	protected void setPagingLinks(int pagingLinks) {
		if (pagingLinks < 1) {
			return;
		}

		this.pagingLinks = pagingLinks;
	}

	public int getPagingLinksStyle() {
		return pagingLinksStyle;
	}

	public void setPagingLinksStyle(int pagingLinksStyle) {
		if (pagingLinksStyle != PAGING_LINKS_STYLE_STATIC && pagingLinksStyle != PAGING_LINKS_STYLE_DYNAMIC) {
			return;
		}

		this.pagingLinksStyle = pagingLinksStyle;
	}

	public boolean isInited() {
		return inited;
	}

	public void setInited(boolean inited) {
		this.inited = inited;
	}

	@Override
	public String toString() {
		return getClass().getName() + "@" + Integer.toHexString(hashCode()) + 
			"(" + 
			"firstPage=" + "'" + getFirstPage() + "'" + ", " + 
			"lastPage=" + "'" + getLastPage() + "'" + ", " + 
			"currentPage=" + "'" + getCurrentPage() + "'" + ", " + 
			"startPagingLink=" + "'" + getStartPagingLink() + "'" + ", " + 
			"endPagingLink=" + "'" + getEndPagingLink() + "'" + 
			")";
	}

	/**
	 * @param start the start to set
	 */
	public void setStart(int start) {
		this.start = start;
	}

	/**
	 * @return the start
	 */
	public int getStart() {
		return start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	/**
	 * @param limit the limit to set
	 */
	public void setLimit(int limit) {
		this.limit = limit;
	}

	/**
	 * @return the limit
	 */
	public int getLimit() {
		return limit;
	}

	/**
	 * @param extPaging the extPaging to set
	 */
	public void setExtPaging(boolean extPaging) {
		this.extPaging = extPaging;
	}

	/**
	 * @return the extPaging
	 */
	public boolean getExtPaging() {
		return extPaging;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getMenu() {
		return menu;
	}

	public void setMenu(String menu) {
		this.menu = menu;
	}
	
	private String refNoCol;
	private String refNoOrderBy;

	public String getRefNoCol() {
		return refNoCol;
	}

	public void setRefNoCol(String refNoCol) {
		this.refNoCol = refNoCol;
	}

	public String getRefNoOrderBy() {
		return refNoOrderBy;
	}

	public void setRefNoOrderBy(String refNoOrderBy) {
		this.refNoOrderBy = refNoOrderBy;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = convertToDate(startDate,false);
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = convertToDate(endDate,true);
	}
	
	private Date convertToDate(String dateStr, boolean isEnd){
		if(null!=dateStr){
			if(isEnd){
				dateStr = dateStr+" 23:59:00.0";				
			}else{					
				dateStr = dateStr+" 00:00:00.0";	
			}
			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss.S"); 
	        java.util.Date date = new java.util.Date();
			try {
				date = sdf.parse(dateStr);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			java.sql.Timestamp timest = new java.sql.Timestamp(date.getTime()); 
			return timest;
		}else{
			return null;
		}
	}

	public String getSorting() {
		return sorting;
	}

	public void setSorting(String sorting) {
		this.sorting = sorting;
	}

	public String getSearchBy() {
		return searchBy;
	}

	public void setSearchBy(String searchBy) {
		this.searchBy = searchBy;
	}

	public String getSearchKey() {
		return searchKey;
	}

	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}
	
	public String getSearchField() {
		return searchField;
	}

	public void setSearchField(String searchField) {
		this.searchField = searchField;
	}
	
	private int totalPage;
	
	public void setTotalPage(int rows) {
		if(rows == 0)
			rows = 10;
		
        if (getTotalResults() > 0) {
        	
            if (getTotalResults() % rows > 0) {
                totalPage = (getTotalResults() / rows) + 1;
            } else {
                totalPage = (getTotalResults() / rows);
            }
        } else {
        	totalPage = 1;
        }
	}
	
	public int getTotalPage() {
		return totalPage;
	}
	
	public int getFirstResult2() {
		if (getTotalResults() > 0) {
			return ((getCurrentPage() - 1) * 10) + 1;
		} else {
			return 0;
		}
		
	}
	
	public int getLastResult() {
		int lastResult = getFirstResult() + 10;
		
		if(lastResult > getTotalResults()) {
			return getTotalResults();
		} else {
			return lastResult;
		}
	}
	
}

