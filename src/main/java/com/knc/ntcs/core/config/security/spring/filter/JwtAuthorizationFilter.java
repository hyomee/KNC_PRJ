package ntcs.core.config.security.spring.filter;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.knc.ntcs.core.config.security.contant.JwtPropContant;
import com.knc.ntcs.core.config.security.service.UserFindService;
import com.knc.ntcs.core.config.security.spring.dto.JwtUserDetailsVO;
import com.knc.ntcs.core.config.security.spring.dto.JwtUserVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.www.BasicAuthenticationFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

// 인가
@Slf4j
public class JwtAuthorizationFilter extends BasicAuthenticationFilter{
	
	private UserFindService userFindService;
	
	public JwtAuthorizationFilter(AuthenticationManager authenticationManager, UserFindService userFindService) {
		super(authenticationManager);
		this.userFindService = userFindService;
	}
	
	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		log.debug("==== JwtAuthorizationFilter : doFilterInternal 진입 ====");
		String header = request.getHeader(JwtPropContant.HEADER_STRING);
		log.debug("==== JwtAuthorizationFilter : doFilterInternal :: header ====" + header);
		if(header == null || !header.startsWith(JwtPropContant.TOKEN_PREFIX)) {
			log.debug("==== JwtAuthorizationFilter : doFilterInternal No Header ====");
			chain.doFilter(request, response);
                        return;
		}
		log.debug("==== header : "+header);
		String token = header.replace(JwtPropContant.TOKEN_PREFIX, "");
		
		// 토큰 검증 (이게 인증이기 때문에 AuthenticationManager도 필요 없음)
		// 내가 SecurityContext에 집적접근해서 세션을 만들때 자동으로 UserDetailsService에 있는 loadByUsername이 호출됨.
		String username = JWT.require(Algorithm.HMAC512(JwtPropContant.SECRET)).build().verify(token)
				.getClaim("username").asString();
		
		if(username != null) {
			JwtUserVO jwtUserVO = userFindService.findByUsrLoginId(username);
			
			// 인증은 토큰 검증시 끝. 인증을 하기 위해서가 아닌 스프링 시큐리티가 수행해주는 권한 처리를 위해 
			// 아래와 같이 토큰을 만들어서 Authentication 객체를 강제로 만들고 그걸 세션에 저장!
			JwtUserDetailsVO jwtUserDetailsVO = new JwtUserDetailsVO(jwtUserVO);
			Authentication authentication =
					new UsernamePasswordAuthenticationToken(
									jwtUserDetailsVO, //나중에 컨트롤러에서 DI해서 쓸 때 사용하기 편함.
							null, // 패스워드는 모르니까 null 처리, 어차피 지금 인증하는게 아니니까!!
									jwtUserDetailsVO.getAuthorities());
			
			// 강제로 시큐리티의 세션에 접근하여 값 저장
			SecurityContextHolder.getContext().setAuthentication(authentication);
		}
	
		chain.doFilter(request, response);
	}
	
}
