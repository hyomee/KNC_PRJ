package com.knc.ntcs.web.management.user.mapper;

import com.knc.ntcs.web.management.user.dto.TsyUserDto;
import com.knc.ntcs.web.management.user.entity.TsyUserEntity;
import org.mapstruct.Mapper;

@Mapper
public interface TsyUserMapper {

  TsyUserEntity toTsyUserEntity(TsyUserDto tsyUserDto);
  TsyUserDto    toTsyUserDto(TsyUserEntity tsyUserEntity);

}
