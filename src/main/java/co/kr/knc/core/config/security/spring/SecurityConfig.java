package co.kr.knc.core.config.security.spring;

import co.kr.knc.core.config.security.service.UserFindService;
import co.kr.knc.core.config.security.spring.filter.JwtAuthenticationFailureHandler;
import co.kr.knc.core.config.security.spring.filter.JwtAuthenticationFilter;
import co.kr.knc.core.config.security.spring.filter.JwtAuthenticationSuccessHandler;
import co.kr.knc.core.config.security.spring.filter.JwtAuthorizationFilter;
import co.kr.knc.core.config.web.CorsConfig;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;


@Configuration
@EnableWebSecurity // 시큐리티 활성화 -> 기본 스프링 필터체인에 등록
@Slf4j
public class SecurityConfig extends WebSecurityConfigurerAdapter {

  private CorsConfig corsConfig;
  private  MessageSource messageSource;
  private co.kr.knc.core.config.security.service.UserFindService UserFindService;
  private  String[] PUBLIC = new String[]{
          "/error", "/error/**", "/login", "/index", "/cache/**", "/rule/**",  "/json/**", "/security/**"
  };

  private  String[] PUBLIC_WEB = new String[]{
          "/static/**", "/index.html", "/*.html", "/**/*.html", "/js/**", "/css/**", "/images/**", "/favicon.ico", "/"
  };

  @Value("${userDefine.security.mode:nopass}")
  private  String mode;

  public SecurityConfig(CorsConfig corsConfig, MessageSource messageSource, UserFindService UserFindService) {
    this.corsConfig = corsConfig;
    this.messageSource = messageSource;
    this.UserFindService = UserFindService;


  }

  @Bean
  public BCryptPasswordEncoder passwordEncoder() {
    return new BCryptPasswordEncoder();
  }


  @Override
  public void configure(WebSecurity web) {
    web.ignoring().antMatchers(PUBLIC_WEB);

  }


  @Override
  protected void configure(HttpSecurity http) throws Exception {
    http.addFilter(corsConfig.corsFilter())
        .csrf().disable()
        .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS)
        .and()
        .formLogin().disable()
        .httpBasic().disable()
        .addFilter(jwtAuthenticationFilter())
        .addFilter(new JwtAuthorizationFilter(authenticationManager(), UserFindService))
        .authorizeRequests()
        .antMatchers(this.PUBLIC)
            .permitAll()
        .antMatchers("/service/**")
          .access("hasRole('ROLE_USER') or hasRole('ROLE_MANAGER') or hasRole('ROLE_ADMIN') ") //or hasRole('ROLE_ANONYMOUS')
        .antMatchers("/manager/**")
          .access("hasRole('ROLE_MANAGER') or hasRole('ROLE_ADMIN')")
        .antMatchers("/admin/**")
          .access("hasRole('ROLE_ADMIN')")
        .anyRequest().authenticated()
        .and()
          .exceptionHandling().accessDeniedHandler(new CustomAccessDeniedHandler(messageSource))
        .and()
          .exceptionHandling().authenticationEntryPoint(new CustomAuthenticationEntryPoint(messageSource))
        .and();
  }

  @Bean
  public JwtAuthenticationFilter jwtAuthenticationFilter() throws Exception {
    JwtAuthenticationFilter authenticationFilter = new JwtAuthenticationFilter(authenticationManager());
    authenticationFilter.setAuthenticationFailureHandler(authenticationFailureHandler());
    authenticationFilter.setAuthenticationSuccessHandler(authenticationSuccessHandler());
    authenticationFilter.setAuthenticationManager(authenticationManagerBean());
    return authenticationFilter;
  }

  @Bean
  public AuthenticationSuccessHandler authenticationSuccessHandler() {
    return new JwtAuthenticationSuccessHandler(messageSource);
  }

  @Bean
  public AuthenticationFailureHandler authenticationFailureHandler() {
    return new JwtAuthenticationFailureHandler(messageSource);
  }


}
