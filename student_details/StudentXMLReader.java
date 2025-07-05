import org.w3c.dom.*;
import javax.xml.parsers.*;
import java.io.*;
import java.util.Scanner;

public class StudentXMLReader {
    public static void main(String[] args) {
        try {
            // Load the XML file
            File xmlFile = new File("students.xml");
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            Document document = builder.parse(xmlFile);

            // Normalize the XML structure
            document.getDocumentElement().normalize();

            // Get user input for Roll Number
            Scanner scanner = new Scanner(System.in);
            System.out.print("Enter Roll Number: ");
            String rollNumberInput = scanner.nextLine();

            // Fetch student records
            NodeList studentList = document.getElementsByTagName("Student");

            boolean studentFound = false;

            for (int i = 0; i < studentList.getLength(); i++) {
                Node node = studentList.item(i);
                if (node.getNodeType() == Node.ELEMENT_NODE) {
                    Element student = (Element) node;

                    // Get Roll Number
                    String rollNumber = student.getElementsByTagName("RollNumber").item(0).getTextContent();

                    if (rollNumber.equals(rollNumberInput)) {
                        studentFound = true;
                        System.out.println("\nStudent Details:");
                        System.out.println("Roll Number: " + rollNumber);
                        System.out.println("Name: " + student.getElementsByTagName("Name").item(0).getTextContent());
                        System.out.println("Course: " + student.getElementsByTagName("Course").item(0).getTextContent());
                        System.out.println("Year: " + student.getElementsByTagName("Year").item(0).getTextContent());
                        System.out.println("Marks 1: " + student.getElementsByTagName("Marks1").item(0).getTextContent());
                        System.out.println("Marks 2: " + student.getElementsByTagName("Marks2").item(0).getTextContent());
                        System.out.println("Marks 3: " + student.getElementsByTagName("Marks3").item(0).getTextContent());
                        System.out.println("Total Marks: " + student.getElementsByTagName("TotalMarks").item(0).getTextContent());
                        break;
                    }
                }
            }

            if (!studentFound) {
                System.out.println("Student with Roll Number " + rollNumberInput + " not found.");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
