package co.kr.knc.core.config.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.MediaType;
import org.springframework.web.servlet.config.annotation.*;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;

//@EnableWebMvc
@Configuration
public class WebMvcConfig implements WebMvcConfigurer  { // implements WebMvcConfigurer extends WebMvcConfigurationSupport

  @Autowired
  LocaleChangeInterceptor localeChangeInterceptor;

  @Autowired
  private CommonInterceptor commonInterceptor = null;

//  @Override
//  public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
//    configurer.enable();
//  }
  /**
   * mediaType 설정
   * @param configurer
   */
  @Override
  public void configureContentNegotiation(ContentNegotiationConfigurer configurer) {
    configurer.mediaType("json", MediaType.APPLICATION_JSON);
  }

  /**
   * 인터셉터를 시스템 레지스트리에 등록
   * @param registry
   */
  @Override //
  public void addInterceptors(InterceptorRegistry registry) {
    registry.addInterceptor(localeChangeInterceptor);
  }


  private static final String[] CLASSPATH_RESOURCE_LOCATIONS = {
          "classpath:/META-INF/resources/", "classpath:/resources/",
          "classpath:/static/", "classpath:/public/"};


  @Override
  public void addResourceHandlers(ResourceHandlerRegistry registry) {
    registry.addResourceHandler("/**") // /resource/**
            .addResourceLocations(CLASSPATH_RESOURCE_LOCATIONS)
            .setCachePeriod(0);
  }

  // url 창에서 ip만 작성시 index.html로 이동
  @Override
  public void addViewControllers(ViewControllerRegistry registry) {
    registry.addViewController("/").setViewName("forward:/index.html");
  }

}
