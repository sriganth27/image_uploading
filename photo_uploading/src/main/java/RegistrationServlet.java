import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;

@WebServlet("/registration")
@MultipartConfig(maxFileSize = 16177215) // Limit the maximum size of the uploaded file to 16MB
public class RegistrationServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Database connection details
      
        // Get form inputs
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Get the uploaded file
        Part imagePart = request.getPart("image");
        InputStream imageInputStream = imagePart.getInputStream();
        String imageFileName=imagePart.getSubmittedFileName(); 

        // Save the image to a temporary location
        String imagePath = "D:/jee-2021-12-2/photo_uploading/src/main/webapp/image/" +imageFileName;
        System.out.println("succesfully uploadde"+imagePath);
        Files.copy(imageInputStream, Paths.get(imagePath));
    

        // Save the image path to the database
        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn =DriverManager.getConnection("jdbc:mysql://localhost:3306/imagetutorial?characterEncoding=utf8","root","srivkp@2003");

            String sql = "insert into users (username, password, image_path) values (?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);
            statement.setString(3,imageFileName);
            
            int row=statement.executeUpdate();        	
            if(row>0)
			{
				System.out.println("Image added into database successfully.");
			}
			
			else
			{
				System.out.println("Failed to upload image.");
			}
			
            conn.close();
        } catch  (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("retrieve.jsp");
}
}