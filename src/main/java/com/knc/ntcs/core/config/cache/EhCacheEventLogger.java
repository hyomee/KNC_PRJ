package com.knc.ntcs.core.config.cache;

import lombok.extern.slf4j.Slf4j;
import org.ehcache.event.CacheEvent;
import org.ehcache.event.CacheEventListener;

@Slf4j
public class EhCacheEventLogger implements CacheEventListener<Object, Object> {
  /**
   * 이벤트 발행시 로그 출력
   * @param cacheEvent
   */
  @Override
  public void onEvent(CacheEvent<?, ?> cacheEvent) {
    log.info("Cache event {} for item with key {}. Old value = {}, New value = {}",
            cacheEvent.getType(),
            cacheEvent.getKey(),
            cacheEvent.getOldValue(),
            cacheEvent.getNewValue());
  }

}
