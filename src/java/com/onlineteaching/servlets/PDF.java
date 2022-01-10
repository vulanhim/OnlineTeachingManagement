/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.onlineteaching.servlets;

/**
 *
 * @author LeeBen
 */
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

import java.io.FileOutputStream;
import java.io.FileNotFoundException;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;

public class PDF {

    public static void main(String[] args) {
        // tạo một document
        Document document = new Document();

        try {
            // khởi tạo một PdfWriter truyền vào document và FileOutputStream
            PdfWriter.getInstance(document, new FileOutputStream("HelloWorld.pdf"));

            // mở file để thực hiện viết
            document.open();
            // thêm nội dung sử dụng add function
            //Khởi tạo một table có 3 cột
            PdfPTable table = new PdfPTable(3);
            //Khởi tạo 3 ô header
            PdfPCell header1 = new PdfPCell(new Paragraph("Header 1"));
            PdfPCell header2 = new PdfPCell(new Paragraph("Header 2"));
            PdfPCell header3 = new PdfPCell(new Paragraph("Header 3"));
            //Thêm 3 ô header vào table
            table.addCell(header1);
            table.addCell(header2);
            table.addCell(header3);

            //Khởi tạo 3 ô data: ô số 1 là string, ô số 2 là ảnh, ô số 3 là table
            PdfPCell data1 = new PdfPCell(new Paragraph("Data String"));
            PdfPCell data2 = new PdfPCell(new Paragraph("Data Int"));

            PdfPTable nestedTable = new PdfPTable(2);
            nestedTable.addCell(new Paragraph("Nested Cell 1"));
            nestedTable.addCell(new Paragraph("Nested Cell 2"));
            PdfPCell data3 = new PdfPCell(nestedTable);
            //Thêm data vào bảng.
            table.addCell(data1);
            table.addCell(data2);
            table.addCell(data3);

            document.add(table);
            // đóng file
            document.close();

        } catch (DocumentException e) {
            e.printStackTrace();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
    }
}
