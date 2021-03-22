package ntcs.web.management.user.respository;


import com.knc.ntcs.web.login.dto.LoginRequestDTO;
import com.knc.ntcs.web.management.user.entity.TsyUserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

public interface TsyUserRepository extends JpaRepository<TsyUserEntity, String>, QuerydslPredicateExecutor<TsyUserEntity> {
  TsyUserEntity findByUserIdAndPassword(String userId, String password);
  TsyUserEntity findByUserId(String userId);

}
