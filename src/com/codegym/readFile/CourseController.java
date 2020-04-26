package com.codegym.readFile;

import java.util.*;

public class CourseController {
    private CourseStorage storage;
    private List<InformationCourse> listCourse;

    public CourseController(CourseStorage storage) {
        this.storage = storage;
    }

    public List<InformationCourse> getListCourse() {
        return this.listCourse;
    }

    public void read(String sourcePath) {
        this.storage.read(sourcePath);
        this.listCourse = this.storage.getListCourses();
    }
}
