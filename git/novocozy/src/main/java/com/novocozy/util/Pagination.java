package com.novocozy.util;

public class Pagination {
    private int page;
    private int pageSize;
    private int totalCount;

    public Pagination(int page, int pageSize, int totalCount) {
        this.page = page;
        this.pageSize = pageSize;
        this.totalCount = totalCount;
    }

    public int getTotalPages() {
        return (int) Math.ceil((double) totalCount / pageSize);
    }

    public int getStartPage() {
        return (page - 1) / 10 * 10 + 1;
    }

    public int getEndPage() {
        int totalPages = getTotalPages();
        return Math.min(getStartPage() + 9, totalPages);
    }

    public int getOffset() {
        return (page - 1) * pageSize;
    }
}
