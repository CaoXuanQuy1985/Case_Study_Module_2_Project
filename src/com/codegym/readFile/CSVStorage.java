package com.codegym.readFile;

import java.util.ArrayList;
import java.util.List;
import java.io.*;

public class CSVStorage implements CourseStorage {
    private List<InformationCourse> listCourses ;
    private File file = null;

    public CSVStorage() {
        this.listCourses = new ArrayList<InformationCourse>();
    }

    public List<InformationCourse> getListCourses() {
        return this.listCourses;
    }

    @Override
    public void read(String sourcePath) {
        BufferedReader in = null;
        String line = null;
        InformationCourse course = null;
        String[] arrayCourse;
        try {
            try {
                file = new File(sourcePath).getAbsoluteFile();
                in = new BufferedReader(new FileReader(file));
                while ((line = in.readLine()) != null) {
                    arrayCourse = line.split(" ");
                    course = new InformationCourse(arrayCourse[1], arrayCourse[2]);
                    this.listCourses.add(course);
                }
            } finally {
                in.close();
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }
}
