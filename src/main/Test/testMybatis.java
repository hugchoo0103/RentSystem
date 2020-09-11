import com.github.pagehelper.PageInfo;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import pojo.rentInfo;
import service.rentInfoService;

public class testMybatis {
    @Test
    public void test1(){
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        rentInfoService rentInfoServiceImpl = (rentInfoService)context.getBean("rentInfoServiceImpl");
        for(rentInfo ri : rentInfoServiceImpl.GetRentInfoList()){
            System.out.println(ri);
        }
    }

    @Test
    public void test2(){
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        rentInfoService rentInfoServiceImpl = (rentInfoService)context.getBean("rentInfoServiceImpl");
        PageInfo pageInfo = rentInfoServiceImpl.GetRentInfoListLimit(0,10);
        for (Object o : pageInfo.getList()) {
            System.out.println(o);
        }
    }

}
