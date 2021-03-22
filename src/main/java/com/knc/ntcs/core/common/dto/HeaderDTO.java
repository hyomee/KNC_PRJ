package ntcs.core.common.dto;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.LinkedHashMap;

@Setter
@Getter
@ToString
public class HeaderDTO {

    private LinkedHashMap headerMap;
    private String xApplication;
    private String xAuthToken;
    private String xChannel;
    private String xLangSet;
    private String xLogKey;
    private String xMid;

    private String remoteAddr;
    private String queryString;
    private String path;
    private String fullUrl;

    @Builder
    public HeaderDTO(String xApplication,
                     String xAuthToken,
                     String xChannel,
                     String xLangSet,
                     String xLogKey,
                     String xMid,
                     String path,
                     String remoteAddr,
                     String queryString,
                     LinkedHashMap headerMap) {

        this.xApplication = xApplication;
        this.xAuthToken = xAuthToken;
        this.xChannel = xChannel;
        this.xLangSet = xLangSet;
        this.xLogKey = xLogKey;
        this.xMid = xMid;
        this.path = path;
        this.remoteAddr = remoteAddr;
        this.queryString = queryString;
        this.headerMap = headerMap;
        this.fullUrl = path + "/" + queryString;
    }



}
