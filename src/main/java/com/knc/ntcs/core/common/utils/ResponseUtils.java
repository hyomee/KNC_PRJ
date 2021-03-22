package com.knc.ntcs.core.common.utils;

import java.util.ArrayList;
import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;

import com.knc.ntcs.core.common.constant.DkHttpStatus;
import com.knc.ntcs.core.common.dto.ComInfoDTO;
import com.knc.ntcs.core.common.dto.ErrorMsgDTO;
import com.knc.ntcs.core.common.dto.ResponseDTO;
import com.knc.ntcs.core.common.dto.ResultDTO;


@Component
public class ResponseUtils {


    public static ResponseEntity<Object> completed(Object obj, ComInfoDTO comInfoDTO) {

        List<ErrorMsgDTO> error = new ArrayList<ErrorMsgDTO>();

        ErrorMsgDTO errorMsgDTO = ErrorMsgDTO.builder()
                .message(String.valueOf(DkHttpStatus.OK.getReasonPhrase()))
                .build();
        error.add(errorMsgDTO);

        ResultDTO resultDTO = ResultDTO.builder()
                .code(String.valueOf(DkHttpStatus.OK.value()))
                .error(error)
                .status(String.valueOf(DkHttpStatus.OK.value()))
                .path(comInfoDTO.getHeaderDTO().getPath())
                .build();

        ResponseDTO responseDTO = ResponseDTO.builder()
                .result(resultDTO)
                .data(obj)
                .build();


        return ResponseEntity.status(DkHttpStatus.OK.value()).body(responseDTO);//
        // new ResponseEntity<>(responseDTO, HttpStatus.OK);
    }

    public static ResponseEntity<Object> completed(ComInfoDTO comInfoDTO) {

        List<ErrorMsgDTO> error = new ArrayList<ErrorMsgDTO>();

        ErrorMsgDTO errorMsgDTO = ErrorMsgDTO.builder()
                .message(String.valueOf(DkHttpStatus.OK.getReasonPhrase()))
                .build();
        error.add(errorMsgDTO);

        ResultDTO resultDTO = ResultDTO.builder()
                .code(String.valueOf(DkHttpStatus.OK.value()))
                .error(error)
                .status(String.valueOf(DkHttpStatus.OK.value()))
                .path(comInfoDTO.getHeaderDTO().getPath())
                .build();

        ResponseDTO responseDTO = ResponseDTO.builder()
                .result(resultDTO)
                .build();



        return ResponseEntity.status(DkHttpStatus.OK.value()).body(responseDTO);
        //DkHttpStatus//new ResponseEntity<>(responseDTO, HttpStatus.OK);
    }

}
