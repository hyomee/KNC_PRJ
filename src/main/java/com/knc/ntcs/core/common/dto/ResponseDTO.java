package ntcs.core.common.dto;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@JsonInclude(JsonInclude.Include.NON_NULL)
@ToString
public class ResponseDTO<T> {
    @JsonIgnore
    private Boolean isException = false;

    private ResultDTO result ;
    private T data ;
    public ResponseDTO() {
    }

    @Builder
    public ResponseDTO(ResultDTO result, T data) {
        this.result = result;
        this.data = data;
    }

}
