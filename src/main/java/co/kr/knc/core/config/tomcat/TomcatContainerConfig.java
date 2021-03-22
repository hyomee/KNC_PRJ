package co.kr.knc.core.config.tomcat;

import org.apache.catalina.connector.Connector;
import org.apache.coyote.http11.AbstractHttp11Protocol;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.web.embedded.tomcat.TomcatServletWebServerFactory;
import org.springframework.boot.web.servlet.server.ServletWebServerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class TomcatContainerConfig {

  @Value("${tomcat.httpProtocol.maxKeepAliveRequests:2000}")
  private Integer maxKeepAliveRequests;

  @Value("${tomcat.httpProtocol.tcpNoDelay:true}")
  private boolean tcpNoDelay;

  @Value("${tomcat.httpProtocol.keepAliveTimeout:2000}")
  private Integer keepAliveTimeout;

  @Value("${tomcat.ajp.port:18009}")
  private Integer port;

  @Value("${tomcat.ajp.secure:false}")
  private boolean secure;

  @Value("${tomcat.ajp.allowTrace:false}")
  private boolean allowTrace;

  @Value("${tomcat.ajp.scheme:http}")
  private String scheme;

  @Value("${tomcat.ajp.maxPostSize:-1}")
  private Integer maxPostSize;

  @Value("${tomcat.ajp.maxParameterCount:100}")
  private Integer maxParameterCount;

  @Value("${tomcat.ajp.enableLookups:false}")
  private boolean enableLookups;

  @Value("${tomcat.ajp.redirectPort:8443}")
  private Integer redirectPort;

  /**
   * Embedded Tomcat Configuration Setting
   * @return
   */
  @SuppressWarnings("rawtypes")
  @Bean
  public ServletWebServerFactory servletContainer() {
    TomcatServletWebServerFactory tomcat = new TomcatServletWebServerFactory();
    //TODO AJP PORT 체크 해야함
    // tomcat.addAdditionalTomcatConnectors(createAjpConnector());

    tomcat.addConnectorCustomizers(connector -> {
      ((AbstractHttp11Protocol) connector.getProtocolHandler()).setMaxKeepAliveRequests(maxKeepAliveRequests);;
      ((AbstractHttp11Protocol) connector.getProtocolHandler()).setTcpNoDelay(tcpNoDelay);;
      ((AbstractHttp11Protocol) connector.getProtocolHandler()).setKeepAliveTimeout(keepAliveTimeout);
    });

    return tomcat;
  }



  private Connector createAjpConnector() {
    Connector ajpConnector = new Connector("AJP/1.3");
    ajpConnector.setPort(port);
    ajpConnector.setSecure(secure);
    ajpConnector.setAllowTrace(allowTrace);
    ajpConnector.setScheme(scheme);
    ajpConnector.setMaxPostSize(maxPostSize);
    ajpConnector.setMaxParameterCount(maxParameterCount);
    ajpConnector.setEnableLookups(enableLookups);
    ajpConnector.setRedirectPort(redirectPort);
    return ajpConnector;
  }




  // 1.스레드풀 설정
//	StandardThreadExecutor executor = new StandardThreadExecutor();
//	executor.setNamePrefix(env.getProperty("tomcat.executor.namePrefix"));
//	executor.setName(env.getProperty("tomcat.executor.name"));
//	executor.setMaxThreads(env.getProperty("tomcat.executor.maxThreads", Integer.class));
//	executor.setMinSpareThreads(env.getProperty("tomcat.executor.minSpareThreads", Integer.class));

//	@Component
//	public class MyTomcatWebServerCustomizer
//			implements WebServerFactoryCustomizer<TomcatServletWebServerFactory> {
//
//		@SuppressWarnings("rawtypes")
//		@Override
//		public void customize(TomcatServletWebServerFactory factory) {
//			Log.debug("=== ContainerConfig Start");
//			factory.addConnectorCustomizers((TomcatConnectorCustomizer) connector -> {
//	            ProtocolHandler protocolHandler = connector.getProtocolHandler();
//	            if (protocolHandler instanceof AbstractHttp11Protocol) {
//	                applyProperties((AbstractHttp11Protocol) protocolHandler);
//	            }
//	        });
//
//		}
//	}
//
//	@SuppressWarnings("rawtypes")
//	private void applyProperties(AbstractHttp11Protocol protocolHandler) {
//        protocolHandler.setMaxKeepAliveRequests(300);
//        protocolHandler.setKeepAliveTimeout(40000);
//
//    }
//
//


}
