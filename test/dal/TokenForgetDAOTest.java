import dal.TokenForgetDAO;
import Model.TokenForgetPassword;
import java.time.LocalDateTime;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;

public class TokenForgetDAOTest {

    private TokenForgetDAO tokenForgetDAO;

    @Before
    public void setUp() {
        // Khởi tạo DAO trước mỗi test case
        tokenForgetDAO = new TokenForgetDAO();
    }

    @After
    public void tearDown() {
        // Dọn dẹp sau mỗi test case nếu cần
    }

    @Test
    public void testGetFormatDate() {
        // Arrange
        LocalDateTime now = LocalDateTime.of(2025, 3, 13, 10, 15, 30);
        
        // Act
        String formatted = tokenForgetDAO.getFormatDate(now);

        // Assert
        assertEquals("2025-03-13 10:15:30", formatted);
    }

    @Test
    public void testInsertTokenForget() {
        // Arrange
        TokenForgetPassword tokenObj = new TokenForgetPassword(
                1,                                // user_id
                "test-token-123",                 // token
                false,                             // isUsed
                LocalDateTime.now().plusDays(1)   // expiryTime
        );

        // Act
        boolean result = tokenForgetDAO.insertTokenForget(tokenObj);

        // Assert
        assertTrue("Insert token must be successful", result);

        // Kiểm tra xem token có thể truy vấn lại được không
        TokenForgetPassword fromDB = tokenForgetDAO.getTokenPassword("test-token-123");
        assertNotNull("Token vừa insert phải lấy lại được", fromDB);
        assertEquals("test-token-123", fromDB.getToken());
        assertEquals(1, fromDB.getUserId());
        assertFalse("isUsed phải là false", fromDB.isIsUsed());
    }

    @Test
    public void testGetTokenPassword() {
        // Arrange
        TokenForgetPassword tokenObj = new TokenForgetPassword(
                2,
                "some-random-token",
                false,
                LocalDateTime.now().plusDays(1)
        );
        tokenForgetDAO.insertTokenForget(tokenObj);

        // Act
        TokenForgetPassword retrieved = tokenForgetDAO.getTokenPassword("some-random-token");

        // Assert
        assertNotNull("Phải lấy được token từ DB", retrieved);
        assertEquals("some-random-token", retrieved.getToken());
        assertEquals(2, retrieved.getUserId());
        assertFalse(retrieved.isIsUsed());
    }

    @Test
    public void testUpdateStatus() {
        // Arrange
        TokenForgetPassword tokenObj = new TokenForgetPassword(
                3,
                "update-status-token",
                false,
                LocalDateTime.now().plusDays(1)
        );
        tokenForgetDAO.insertTokenForget(tokenObj);

        // Act
        tokenObj.setIsUsed(true);
        tokenForgetDAO.updateStatus(tokenObj);
        TokenForgetPassword updated = tokenForgetDAO.getTokenPassword("update-status-token");

        // Assert
        assertNotNull(updated);
        assertTrue("isUsed phải được cập nhật thành true", updated.isIsUsed());
    }
}
