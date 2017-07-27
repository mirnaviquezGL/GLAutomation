package Utilities;

import org.testng.annotations.AfterClass;
import org.testng.annotations.BeforeClass;

/**
 * Created by vivianaaraya on 7/26/17.
 */
public class hooks {

    @BeforeClass
    public void initial() {
        new DriverManager().openBrowser();
    }

    @AfterClass
    public void tearDown() {
        new DriverManager().closeBrowser();
    }

}
