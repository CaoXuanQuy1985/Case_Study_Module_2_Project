package com.codegym.readFile;

public class InformationCourse {
    private String nameCourse;
    private String priceCourse;

    public InformationCourse(String nameCourse, String priceCourse) {
        this.nameCourse = nameCourse;
        this.priceCourse = priceCourse;
    }

    public String getNameCourse() {
        return this.nameCourse;
    }

    public String getPriceCourse() {
        return this.priceCourse;
    }
}
