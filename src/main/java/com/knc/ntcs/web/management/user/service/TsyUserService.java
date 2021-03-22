package com.knc.ntcs.web.management.user.service;

import com.knc.ntcs.core.common.dto.ComInfoDTO;
import com.knc.ntcs.core.common.utils.RequestUtils;
import com.knc.ntcs.web.login.dto.LoginRequestDTO;
import com.knc.ntcs.web.login.dto.LoginResponseDTO;
import com.knc.ntcs.web.management.user.dto.TsyUserDto;
import com.knc.ntcs.web.management.user.entity.TsyUserEntity;
import com.knc.ntcs.web.management.user.mapper.TsyUserMapper;
import com.knc.ntcs.web.management.user.respository.TsyUserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@RequiredArgsConstructor
@Service
public class TsyUserService {

  private final TsyUserRepository tsyUserRepository;



  public TsyUserDto loginProcess(LoginRequestDTO loginRequestDTO, ComInfoDTO comInfoDTO)  {

    RequestUtils.printRchRequestHeader();
    TsyUserEntity tsyUserEntity = tsyUserRepository.findByUserIdAndPassword(loginRequestDTO.getUserId(), loginRequestDTO.getPassword());
    TsyUserDto tsyUserResDto = TsyUserMapper.TsyUserINSTANCE.toTsyUserDto(tsyUserEntity);
    return tsyUserResDto;
  }



  public TsyUserDto saveTsyUser(TsyUserDto tsyUserDto,
                                ComInfoDTO comInfoDTO) throws Exception {
    log.debug("=== ctl :: saveCustM : " + tsyUserDto.toString());
    TsyUserEntity tsyUserEntity = TsyUserMapper.TsyUserINSTANCE.toTsyUserEntity(tsyUserDto);
    tsyUserEntity.setControllField(comInfoDTO.getControllFieldDTO());
    tsyUserRepository.save(tsyUserEntity);
    TsyUserDto tsyUserResDto = TsyUserMapper.TsyUserINSTANCE.toTsyUserDto(tsyUserEntity);
    return tsyUserResDto;
  }
}
