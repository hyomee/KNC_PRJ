package ntcs.core.common.entity;


import javax.persistence.Column;
import javax.persistence.MappedSuperclass;


import com.knc.ntcs.core.common.dto.ControllFieldDTO;
import com.knc.ntcs.core.common.utils.DateCalendarUtils;

import lombok.Getter;
import org.apache.commons.lang3.StringUtils;

@Getter
@MappedSuperclass
public class ControllField {

  @Column(name="OPERATOR_ID", nullable = false)
  private String operatorId;

  @Column(name="CREATION_DATE", nullable = false)
  private String createDate;

  @Column(name="UPDATE_DATE")
  private String updateDate;


  protected void setControllField(ControllFieldDTO controllFieldDO) {
    this.operatorId = controllFieldDO.getOperatorId();
    setDefautReqDrrm(controllFieldDO.getCreateDate());
    this.updateDate  = controllFieldDO.getUpdateDate();
  }

  private void setDefaultRegId(String operatorId) {
    this.operatorId = operatorId;
    if (StringUtils.isEmpty(operatorId)) {
      this.operatorId = "NTCS";
    }
  }
  /**
   * 생성일자가 없는 경우 현재 일자를 자동으로 넣어 준다.
   * @param createDate
   */
  private void setDefautReqDrrm(String createDate) {
    this.createDate = createDate;
    if (StringUtils.isEmpty(createDate)) {
      this.createDate = DateCalendarUtils.currentDate("yyyyMMddHHmmss");
    }
  }



}
