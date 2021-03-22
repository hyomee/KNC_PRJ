package com.knc.ntcs.core.common.utils;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.expression.Expression;
import org.springframework.expression.ExpressionParser;
import org.springframework.expression.spel.standard.SpelExpressionParser;
import org.springframework.expression.spel.support.StandardEvaluationContext;

@Configuration
public class CustomExpressionParser {
  ExpressionParser ep;
  StandardEvaluationContext context;

  @Bean
  public ExpressionParser CustomExpressionParser() throws NoSuchMethodException {
    ep = new SpelExpressionParser() ;
    context = new StandardEvaluationContext();
    context.registerFunction("containsListAndList", ExpressionUTIL.class.getDeclaredMethod("containsListAndList", String.class, String.class));
    context.registerFunction("containsStringAndList", ExpressionUTIL.class.getDeclaredMethod("containsStringAndList", String.class, String.class));
    return ep;
  }


  public Boolean parseExpression(String expression) {
    Expression exp = ep.parseExpression(expression);
    Boolean bl = exp.getValue(context, Boolean.class);
    return bl;
  }


}
