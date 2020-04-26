package com.codegym.readFile;

import java.util.*;

public interface CourseStorage {
    void read(String sourcePath);
    List<InformationCourse> getListCourses();
}
