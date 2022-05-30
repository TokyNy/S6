/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fonction;

import com.spire.pdf.*;
import com.spire.pdf.PdfPageBase;
import com.spire.pdf.PdfPageSize;
import com.spire.pdf.graphics.*;
import com.spire.pdf.tables.*;
import com.spire.pdf.tables.table.*;
import com.spire.pdf.tables.table.common.JdbcAdapter;import java.awt.Font;
import java.awt.geom.*;

import java.io.File;
import java.io.FileOutputStream;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.Vector;
import model.Ingredients;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author ASUS
 */
public class Export {
    public static void exporter(Vector<Ingredients> liste)throws Exception{
        XSSFWorkbook workbook = new XSSFWorkbook();
        XSSFSheet spreadsheet= workbook.createSheet("Etat de stock des ingredients");
        XSSFRow row;
        Map<String, Object[]> data = new TreeMap<String, Object[]>();
        data.put("1",new Object[]{"Reference","Intitule","Stock"});
        for(int i=0;i<liste.size();i++){
            data.put(String.valueOf(i+2),new Object[]{liste.get(i).getId(),
                liste.get(i).getDesc(),liste.get(i).getPoids()});
        }
        
        Set<String> keyid = data.keySet();
        int rowid = 0;
        for (String key : keyid) {
            row = spreadsheet.createRow(rowid++);
            Object[] objectArr = data.get(key);
            int cellid = 0;
            for (Object obj : objectArr) {
                    Cell cell = row.createCell(cellid++);
                    cell.setCellValue((String.valueOf(obj)));
            }
        }
        FileOutputStream out = new FileOutputStream(
			new File("Etat-stock-ingredients.xlsx"));
        workbook.write(out);
        out.close();
    }
    
    public static void exporterPDF(Vector<Ingredients> liste)throws Exception{
        PdfDocument doc = new PdfDocument();

        //Set margins
        PdfUnitConvertor unitCvtr = new PdfUnitConvertor();
        PdfMargins margin = new PdfMargins();
        margin.setTop(unitCvtr.convertUnits(2.54f, PdfGraphicsUnit.Centimeter, PdfGraphicsUnit.Point));
        margin.setBottom(margin.getTop());
        margin.setLeft(unitCvtr.convertUnits(3.17f, PdfGraphicsUnit.Centimeter, PdfGraphicsUnit.Point));
        margin.setRight(margin.getLeft());

        //Add one page
        PdfPageBase page = doc.getPages().add(PdfPageSize.A4, margin);

        float y = 10;

        //Draw title
        PdfBrush brush1 = PdfBrushes.getBlack();
        PdfTrueTypeFont font1 = new PdfTrueTypeFont(new Font("Arial",Font.BOLD ,16));
        PdfStringFormat format1 = new PdfStringFormat(PdfTextAlignment.Center);
        page.getCanvas().drawString("Etat de stock des ingredients", font1, brush1, page.getCanvas().getClientSize().getWidth() / 2, y, format1);
        y = y + (float) font1.measureString("Etat de stock des ingredients", format1).getHeight();
        y = y + 5;
        
        
        //Data source to create table
        String [] data=new String[liste.size()+1];
        data[0]="Reference;Description;Quantite en stock";
        for(int i=0;i<liste.size();i++){
            Ingredients t=liste.get(i);
            data[i+1]=t.getId()+";"+t.getDesc()+";"+t.getPoids();
        }
        String[][] dataSource = new String[liste.size()+1][];
        for (int i = 0; i < data.length; i++) {
            dataSource[i] = data[i].split("[;]", -1);
        }

        //Create a PdfTable instance and set data source
        PdfTable table = new PdfTable();
        table.getStyle().setCellPadding(2);
        table.getStyle().setHeaderSource(PdfHeaderSource.Rows);
        table.getStyle().setHeaderRowCount(1);
        table.getStyle().setShowHeader(true);
        table.setDataSource(dataSource);

        //Draw table to the page
        PdfLayoutResult result = table.draw(page, new Point2D.Float(0, y));

        y = y + (float) result.getBounds().getHeight() + 5;

        //Draw string below table
        PdfBrush brush2 = PdfBrushes.getGray();
        PdfTrueTypeFont font2 = new PdfTrueTypeFont(new Font("Arial", 0,9));
        //page.getCanvas().drawString(String.format("* %1$s countries in the list.", data.length - 1), font2, brush2, 5, y);

        doc.saveToFile("Etat-stock-ingredients.pdf");
    }
}
