package co.kr.knc.core.config.modelmapper;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.modelmapper.ModelMapper;
import org.modelmapper.convention.MatchingStrategies;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class CommonBean {

  @Bean
  public ModelMapper modelMapper() {
    // ModelMapper modelMapper = new ModelMapper();
    // modelMapper.getConfiguration().setMatchingStrategy(MatchingStrategies.LOOSE);
    ModelMapper modelMapper = new CustomModelMapper();
    modelMapper.getConfiguration().setMatchingStrategy(MatchingStrategies.STRICT);
    modelMapper.getConfiguration().setFieldMatchingEnabled(true);
    modelMapper.getConfiguration().setFieldAccessLevel(org.modelmapper.config.Configuration.AccessLevel.PRIVATE);
    return modelMapper;
  }

  /**
   * UTF-8로 변환
   * @return
   */
//  @Bean
//  public FilterRegistrationBean encodingBean() {
//    FilterRegistrationBean registrationBean = new FilterRegistrationBean();
//    CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
//    characterEncodingFilter.setForceEncoding(true);
//    characterEncodingFilter.setEncoding("UTF-8");
//    registrationBean.setFilter(characterEncodingFilter);
//    return registrationBean;
//  }


  @Bean
  public ObjectMapper objectMapper() {
    return new ObjectMapper();
  }

}
