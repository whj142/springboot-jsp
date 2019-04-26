/**
 * 
 */
package cn.whj;

/**
 * @author wuhuijie
 *2019年4月25日
 * 
 */
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class ApplicationStarter {
    public static void main(String[] args){
        SpringApplication.run(ApplicationStarter.class, args);
    }
}   
