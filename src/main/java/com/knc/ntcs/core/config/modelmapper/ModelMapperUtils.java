package com.knc.ntcs.core.config.modelmapper;

import org.modelmapper.ModelMapper;
import org.modelmapper.convention.MatchingStrategies;

public class ModelMapperUtils {

  private static ModelMapper modelMapper = new ModelMapper();


  public static ModelMapper getModelMapper() {
    modelMapper.getConfiguration().setMatchingStrategy(MatchingStrategies.STRICT);
    return modelMapper;
  }

}
