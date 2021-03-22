package ntcs.core.common.dto;

import lombok.Builder;
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class ComInfoDTO {
    private HeaderDTO headerDTO ;
    private ControllFieldDTO controllFieldDTO ;

    @Builder
    public ComInfoDTO(HeaderDTO headerDTO, ControllFieldDTO controllFieldDTO) {
        this.headerDTO = headerDTO;
        this.controllFieldDTO = controllFieldDTO;
    }
}
