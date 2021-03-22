package com.knc.ntcs.core.config.web;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
 
	@Bean
	public MappingJackson2JsonView jsonView() {
		return new MappingJackson2JsonView();
	}

//    @Bean
//    public TilesConfigurer tilesConfigurer() {
//        final TilesConfigurer configurer = new TilesConfigurer();
//
//        //타일즈 설정파일이 위치하는 디렉토리+파일명
//        configurer.setDefinitions(new String[]{"/WEB-INF/views/tiles/tiles.xml"});
//        configurer.setCheckRefresh(true);
//        return configurer;
//    }
//
//    @Bean
//    public TilesViewResolver tilesViewResolver() {
//        final TilesViewResolver tilesViewResolver = new TilesViewResolver();
//        tilesViewResolver.setViewClass(TilesView.class);
//        tilesViewResolver.setOrder(2);  //뷰 우선순위
//        return tilesViewResolver;
//    }
}