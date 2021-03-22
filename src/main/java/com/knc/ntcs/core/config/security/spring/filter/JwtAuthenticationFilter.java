package ntcs.core.config.security.spring.filter;

import com.knc.ntcs.core.common.utils.JsonUtils;
import com.knc.ntcs.core.config.security.spring.dto.JwtRequestDTO;
import com.knc.ntcs.core.config.security.spring.dto.JwtUserDetailsVO;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.IOUtils;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.InsufficientAuthenticationException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Slf4j
@RequiredArgsConstructor
public class JwtAuthenticationFilter extends UsernamePasswordAuthenticationFilter{

	private final AuthenticationManager authenticationManager;
	
	// Authentication 객체 만들어서 리턴 => 의존 : AuthenticationManager
	// 인증 요청시에 실행되는 함수 => /login
	@SneakyThrows
	@Override
	public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response)
			throws AuthenticationException {
		
		log.debug("==== JwtAuthenticationFilter 1 : 진입");
		

		String requestBody = IOUtils.toString(request.getReader());
		log.debug("requestBody = " + requestBody);
		JwtRequestDTO jwtRequestDTO = JsonUtils.toObject(requestBody, JwtRequestDTO.class);

		if (jwtRequestDTO == null || jwtRequestDTO.isInvalid()) {
			throw new InsufficientAuthenticationException("Invalid authentication request");
		}


		log.debug("==== JwtAuthenticationFilter 2 : "+jwtRequestDTO);
		
		// 유저네임패스워드 토큰 생성
		UsernamePasswordAuthenticationToken authenticationToken = 
				new UsernamePasswordAuthenticationToken(
								jwtRequestDTO.getUserId(),
								jwtRequestDTO.getPassword());

		log.debug("==== JwtAuthenticationFilter 3 :  토큰생성완료");
		
		Authentication authentication =
				authenticationManager.authenticate(authenticationToken);

		JwtUserDetailsVO principalDetailis = (JwtUserDetailsVO) authentication.getPrincipal();
		log.debug("==== JwtAuthenticationFilter 4 : Authentication : "+ principalDetailis.getJwtUserVO().getUserName());
		return authentication;
	}

	// JWT Token 생성해서 response에 담아주기
//	@Override
//	protected void successfulAuthentication(HttpServletRequest request, HttpServletResponse response, FilterChain chain,
//			Authentication authResult) throws IOException, ServletException {
//
//		JwtUserDetailsVO jwtUserDetailsVO = (JwtUserDetailsVO) authResult.getPrincipal();
//
//		String jwtToken = JWT.create()
//				.withSubject(jwtUserDetailsVO.getUsername())
//				.withExpiresAt(new Date(System.currentTimeMillis()+ ComConstant.EXPIRATION_TIME))
//				.withClaim("id", jwtUserDetailsVO.getJwtUserVO().getUserSeq())
//				.withClaim("username", jwtUserDetailsVO.getJwtUserVO().getUsername())
//				.sign(Algorithm.HMAC512(ComConstant.SECRET));
//
//		response.addHeader(ComConstant.HEADER_STRING, ComConstant.TOKEN_PREFIX+jwtToken);
//	}


	
}
