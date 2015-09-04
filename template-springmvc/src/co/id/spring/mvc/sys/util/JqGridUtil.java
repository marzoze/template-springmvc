package co.id.spring.mvc.sys.util;

import java.util.List;

public class JqGridUtil extends JSONUtil {
    private boolean _search;
    private String searchField;
    private String searchOper;
    private String searchString;
    private int page;
    private int rows;
    @SuppressWarnings("unused")
	private int totalPages;
    private String sidx;
    private String sord;
    @SuppressWarnings("rawtypes")
	private List resultList;
    private int totalRecords;

    public JqGridUtil() {
        super();
    }

    public boolean is_search() {
        return _search;
    }

    public void set_search(boolean _search) {
        this._search = _search;
    }

    public String getSearchField() {
        return searchField;
    }

    public void setSearchField(String searchField) {
        this.searchField = searchField;
    }

    public String getSearchOper() {
        return searchOper;
    }

    public void setSearchOper(String searchOper) {
        this.searchOper = searchOper;
    }

    public String getSearchString() {
        return searchString;
    }

    public void setSearchString(String searchString) {
        this.searchString = searchString;
    }

    public int getPage() {
        return page > getTotalPages() ? getTotalPages() : page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getRows() {
        return rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }

    public int getTotalPages() {
        return Math.round((totalRecords/rows) + 0.5f);
    }

    public void setTotalPages(int totalPages) {
        this.totalPages = totalPages;
    }

    public String getSidx() {
        return sidx;
    }

    public void setSidx(String sidx) {
        this.sidx = sidx;
    }

    public String getSord() {
        return sord;
    }

    public void setSord(String sord) {
        this.sord = sord;
    }

    public int getOffset() {
        int start = rows*getPage() - rows;
        return start < 0 ? 0 : start;
    }

    @SuppressWarnings("rawtypes")
	public List getResultList() {
        return resultList;
    }

    @SuppressWarnings("rawtypes")
	public void setResultList(List resultList) {
        this.resultList = resultList;
    }

    public int getTotalRecords() {
        return totalRecords;
    }

    public void setTotalRecords(int totalRecords) {
        this.totalRecords = totalRecords;
    }

    @Override
    public String serialize() {
        addData("rows", getResultList());
        addData("page", getPage());
        addData("records", getTotalRecords());
        addData("total", getTotalPages());
        return super.serialize();
    }
}
