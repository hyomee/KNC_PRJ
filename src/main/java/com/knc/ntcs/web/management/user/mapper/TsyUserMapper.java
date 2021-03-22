package com.knc.ntcs.web.management.user.mapper;

import com.knc.ntcs.web.management.user.dto.TsyUserDto;
import com.knc.ntcs.web.management.user.entity.TsyUserEntity;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

@Mapper
public interface TsyUserMapper {
  TsyUserMapper TsyUserINSTANCE = Mappers.getMapper(TsyUserMapper.class);

  TsyUserEntity toTsyUserEntity(TsyUserDto tsyUserDto);
  TsyUserDto    toTsyUserDto(TsyUserEntity tsyUserEntity);

}
