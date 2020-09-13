import com.github.pagehelper.PageInfo;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import pojo.hirePerson;
import pojo.rentInfo;
import pojo.rentPerson;
import service.hirePersonService;
import service.rentInfoService;
import service.rentPersonService;

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

    @Test
    public void test3(){
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        rentInfoService rentInfoServiceImpl = (rentInfoService)context.getBean("rentInfoServiceImpl");
        hirePersonService hpservice = (hirePersonService)context.getBean("hirePersonServiceImpl");
        rentPersonService rpservice = (rentPersonService)context.getBean("rentPersonServiceImpl");
        rentInfo ri = new rentInfo();
        ri.setRentId(200001);
        ri.setHireId(300001);
        ri.setHouseId(400001);
        rentInfoServiceImpl.AddRentInfo(ri);
        hirePerson hp = hpservice.GetHirePersonById(ri.getHireId());
        rentPerson rp = rpservice.GetRentPersonById(ri.getRentId());
        ri.setHireName(hp.getUserName());
        ri.setHirePhone(hp.getPhone());
        ri.setRentName(rp.getUserName());
        ri.setRentPhone(rp.getPhone());
    }
}
