package dal;

import Model.User;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

public class UserDAOTest {

    private static UserDAO userDAO;

    @BeforeClass
    public static void setUpClass() {
        // Chạy 1 lần duy nhất trước tất cả các test (JUnit 4).
        userDAO = new UserDAO();
        System.out.println("===> @BeforeClass: Chuẩn bị cho tất cả các test.");
    }

    @AfterClass
    public static void tearDownClass() {
        // Chạy 1 lần duy nhất sau tất cả các test (JUnit 4).
        System.out.println("===> @AfterClass: Dọn dẹp sau khi test xong.");
    }

    @Before
    public void setUp() {
        // Chạy trước mỗi test method (JUnit 4).
        System.out.println("===> @Before: Bắt đầu 1 test case.");
    }

    @After
    public void tearDown() {
        // Chạy sau mỗi test method (JUnit 4).
        System.out.println("===> @After: Kết thúc 1 test case.");
    }

    @Test
    public void testGetUserById_ValidId() {
        System.out.println("Test getUserById_ValidId");
        int testUserId = 19; 
        User user = userDAO.getUserById(testUserId);
        assertNotNull("User should not be null for a valid ID.", user);
        assertEquals("User ID should match the testUserId passed in.",
                testUserId, user.getId());
        System.out.println("User found: " + user.getName() 
                + " (Email: " + user.getEmail() + ")");
    }

    @Test
    public void testGetUserById_InvalidId() {
        System.out.println("Test getUserById_InvalidId");
        int invalidUserId = 999999;
        User user = userDAO.getUserById(invalidUserId);
        assertNull("User should be null for an invalid ID.", user);
    }

    @Test
    public void testGetUserByEmail_ExistingEmail() {
        System.out.println("Test getUserByEmail_ExistingEmail");
        String email = "tuanndhe186995@fpt.edu.vn"; // Email phải tồn tại trong DB test
        User user = userDAO.getUserByEmail(email);
        assertNotNull("User should not be null for a valid email.", user);
        assertEquals("Email should match the one passed in.", email, user.getEmail());
    }

    @Test
    public void testGetUserByEmail_NonExistingEmail() {
        System.out.println("Test getUserByEmail_NonExistingEmail");
        String email = "nonexistent@example.com";
        User user = userDAO.getUserByEmail(email);
        assertNull("User should be null for a non-existent email.", user);
    }

    @Test
    public void testLogin_ValidCredentials() {
        System.out.println("Test login_ValidCredentials");
        String email = "tuanddd@gmail.com";
        String password = "111"; // Pass phải khớp DB
        User user = userDAO.login(email, password);
        assertNotNull("Should return a valid User if credentials are correct.", user);
        assertEquals("Returned user email should match input email.", email, user.getEmail());
    }

    @Test
    public void testLogin_InvalidCredentials() {
        System.out.println("Test login_InvalidCredentials");
        String email = "test@example.com"; 
        String password = "wrongpassword";
        User user = userDAO.login(email, password);
        assertNull("Should return null for invalid credentials.", user);
    }

    @Test
    public void testRegister() {
        System.out.println("Test register");
        // Test này sẽ thêm user vào DB, nên dùng DB test hoặc xóa sau khi test
        String username = "Nguyen VAan T";
        String password = "1212";
        String email = "ngvant@gmail.com";

        userDAO.register(username, password, email);

        User registeredUser = userDAO.getUserByEmail(email);
        
        assertNotNull("Newly registered user should exist in DB.", registeredUser);
        assertEquals("User name should match the one passed in register.",
                username, registeredUser.getName());
    }

    @Test
    public void testUpdatePassword() {
        System.out.println("Test updatePassword");
        String email = "tuanndhe186995@fpt.edu.vn"; 
        String newPassword = "newSecret123";
        userDAO.updatePassword(email, newPassword);

        User updatedUser = userDAO.login(email, newPassword);
        assertNotNull("User should be able to login with the new password.", updatedUser);
    }

    @Test
    public void testUpdateProfile() throws Exception {
        System.out.println("Test updateProfile");
        User existingUser = userDAO.getUserById(19);
        if (existingUser == null) {
            fail("User with ID=19 not found. Cannot update.");
        }
        String updatedName = "Updated Name " + System.currentTimeMillis();
        existingUser.setName(updatedName);
        userDAO.updateProfile(existingUser);

        User updatedUser = userDAO.getUserById(existingUser.getId());
        assertEquals("User's name should be updated.", updatedName, updatedUser.getName());
    }
}
