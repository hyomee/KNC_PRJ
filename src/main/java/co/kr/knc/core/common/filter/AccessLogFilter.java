package co.kr.knc.core.common.filter;


import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import java.io.*;
import java.nio.charset.Charset;


@WebFilter(urlPatterns = "/*")
@Component
@Order(1)
@Slf4j
public class AccessLogFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        log.debug("AccessLogFilter Init .... ");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        log.debug("AccessLogFilter doFilter .... ");


        HttpServletRequest req = (HttpServletRequest) request;

        log.debug(String.format("AccessLogFilter doFilter :: req : %s", req.getHeaderNames()));
        String remoteAddr = StringUtils.defaultString(request.getRemoteAddr(), "-");
        String url = (req.getRequestURL() == null) ? "" : req.getRequestURL().toString();
        String queryString = StringUtils.defaultIfEmpty(req.getQueryString(), "");
        String refer = StringUtils.defaultString(req.getHeader("Refer"), "-");
        String agent = StringUtils.defaultString(req.getHeader("User-Agent"), "-");
        String fullUrl = url;
        fullUrl += StringUtils.isNotEmpty(queryString) ? "?" + queryString : queryString;

        StringBuffer result = new StringBuffer();
        result.append(":").append(remoteAddr).append(":").append(fullUrl).append(":").append(refer).append(":")
                .append(agent);

        log.debug("LOG FILTER" + result.toString());


        //log.debug(String.format(String.format("QueryString :: %s", req.getQueryString())));
        long startDate = System.currentTimeMillis();
        ResettableStreamHttpServletRequest resettableStreamHttpServletRequest = new ResettableStreamHttpServletRequest(
                req);
        try {
            chain.doFilter(resettableStreamHttpServletRequest, response);

        } catch (ServletException ex) {
            //TODO 오류 처리 해야 함
            log.debug("Error :: ServletException ::", ex.getMessage());
            throw ex;
        } catch (IOException ex) {
            //TODO 오류 처리 해야 함
            log.debug("Error :: IOException ::", ex.getMessage());
            throw ex;
        } catch (RuntimeException ex) {
            //TODO 오류 처리 해야 함
            log.debug("Error :: Throwable ::", ex.getMessage());
        }

        long endDate = System.currentTimeMillis();
        log.debug("=====\trestAPI Access Time:" + (double) (endDate - startDate) / 1000 + "초\t==================");

    }
    //     HttpMediaTypeNotSupportedException
    //     HttpRequestMethodNotSupportedException
    //     PropertyValueException

    @Override
    public void destroy() {
        log.debug("AccessLogFilter destroy .... ");
    }

    private static class ResettableStreamHttpServletRequest extends
            HttpServletRequestWrapper {

        private byte[] rawData;
        private final HttpServletRequest request;
        private final ResettableServletInputStream servletStream;

        public ResettableStreamHttpServletRequest(HttpServletRequest request) {
            super(request);
            this.request = request;
            this.servletStream = new ResettableServletInputStream();
        }


        public void resetInputStream() {
            servletStream.stream = new ByteArrayInputStream(rawData);
        }

        @Override
        public ServletInputStream getInputStream() throws IOException {
            if (rawData == null) {
                rawData = IOUtils.toByteArray(this.request.getReader(), String.valueOf(Charset.defaultCharset()));
                servletStream.stream = new ByteArrayInputStream(rawData);
            }
            return servletStream;
        }

        @Override
        public BufferedReader getReader() throws IOException {
            if (rawData == null) {
                rawData = IOUtils.toByteArray(this.request.getReader(), String.valueOf(Charset.defaultCharset()));
                servletStream.stream = new ByteArrayInputStream(rawData);
            }
            return new BufferedReader(new InputStreamReader(servletStream));
        }


        private static class ResettableServletInputStream extends ServletInputStream {

            private InputStream stream;

            @Override
            public int read() throws IOException {
                return stream.read();
            }

            @Override
            public boolean isFinished() {
                try {
                    int available = stream.available();
                    return available == 0;
                } catch (IOException e) {
                    return true;
                }
            }

            @Override
            public boolean isReady() {
                return true;
            }

            @Override
            public void setReadListener(ReadListener listener) { }
        }
    }
}
