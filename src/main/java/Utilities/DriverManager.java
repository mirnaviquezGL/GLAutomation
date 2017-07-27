package Utilities;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.testng.annotations.AfterClass;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Parameters;
import java.util.concurrent.TimeUnit;


public class DriverManager {


    public static WebDriver driver;


        public void openBrowser(){
            driver=new ChromeDriver();
            driver.get("https://gorillalogic.com");
            driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);
        }


        public void closeBrowser(){
            driver.quit();
        }
 }