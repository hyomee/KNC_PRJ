package com.knc.ntcs.core.common.dto;

import java.util.ArrayList;
import java.util.List;

import com.knc.ntcs.core.common.utils.DateCalendarUtils;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ResultDTO {
    private String code = "";
    private List<ErrorMsgDTO> error = new ArrayList<ErrorMsgDTO>();
    private String status = "";
    private String path = "";
    private String timestamp = "";

    /**
     * "timestamp": "2020-10-19T04:52:40.598+00:00",
     *     "status": 404,
     *     "error": "Not Found",
     *     "message": "No message available",
     *     "path": "/test/aa"
     */

    @Builder
    public ResultDTO(String status, String code, List<ErrorMsgDTO> error, String path) {
        this.code = code;
        this.error = error;
        this.status = status;
        this.path = path;
        this.timestamp = DateCalendarUtils.currentDate("yyyyMMddHHmmss");
    }


}
