package com.kopo.hanaglobal.hana_global.web.vo;

import java.util.Arrays;

public class BoardVO {
    private int no;
    private String title;
    private String writer;
    private String content;
    private String regDate;
    private int count;
    private int[] numbers;

    public int[] getNumbers() {
        return numbers;
    }
    public void setNumbers(int[] numbers) {
        this.numbers = numbers;
    }
    public int getNo() {
        return no;
    }
    public void setNo(int no) {
        this.no = no;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getWriter() {
        return writer;
    }
    public void setWriter(String writer) {
        this.writer = writer;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }

    public String getRegDate() {
        return regDate;
    }
    public void setRegDate(String regDate) {
        this.regDate = regDate;
    }
    public int getCount() {
        return count;
    }
    public void setCount(int count) {
        this.count = count;
    }
    @Override
    public String toString() {
        return "BoardVO [no=" + no + ", title=" + title + ", writer=" + writer + ", content=" + content + ", regDate="
                + regDate + ", count=" + count + ", numbers=" + Arrays.toString(numbers) + "]";
    }


}