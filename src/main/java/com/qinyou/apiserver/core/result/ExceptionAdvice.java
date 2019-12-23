package com.qinyou.apiserver.core.result;

import com.qinyou.apiserver.core.utils.WebUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.jdbc.BadSqlGrammarException;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 全局异常管理器
 *
 * @author chuang
 */
@ControllerAdvice
@Slf4j
public class ExceptionAdvice {

    /**
     * 自定义 request 异常
     *
     * @param e
     * @return
     */
    @ExceptionHandler(RequestException.class)
    @ResponseBody
    public ResponseResult requestExceptionHandler(RequestException e) {
        if (e.getE() != null) log.error(e.getMessage(), e.getE());
        return ResponseResult.builder()
                .status(false)
                .code(e.getCode())
                .msg(e.getMsg())
                .build();
    }

    // DTO 参数校验失败
    @ExceptionHandler(MethodArgumentNotValidException.class)
    @ResponseBody
    public ResponseResult methodArgumentNotValidExceptionHandler(MethodArgumentNotValidException e) {
        BindingResult result = e.getBindingResult();
        String s = ResponseEnum.BAD_PARAM.getMsg();
        if (result.hasErrors()) {
            List<ObjectError> errors = result.getAllErrors();
            s = errors.get(0).getDefaultMessage();
        }
        return ResponseResult.builder()
                .status(false)
                .code(ResponseEnum.BAD_PARAM.getCode())
                .msg(s)
                .build();
    }

    //spring security 账号找不到
    @ExceptionHandler(UsernameNotFoundException.class)
    @ResponseBody
    public ResponseResult usernameNotFoundException(UsernameNotFoundException exception) {
        return WebUtils.fail(ResponseEnum.BAD_USERNAME);
    }

    // spring security 密码错误
    @ExceptionHandler(BadCredentialsException.class)
    @ResponseBody
    public ResponseResult badCredentialsExceptionHandler(BadCredentialsException exception) {
        return WebUtils.fail(ResponseEnum.BAD_PASSWORD);
    }

    // spring security 账号被锁定
    @ExceptionHandler(LockedException.class)
    @ResponseBody
    public ResponseResult lockedException(LockedException exception) {
        return WebUtils.fail(ResponseEnum.ACCOUNT_LOCKED);
    }

    //spring security 无权限访问
    @ExceptionHandler(AccessDeniedException.class)
    @ResponseBody
    public ResponseResult accessDeniedException(AccessDeniedException exception) {
        return WebUtils.fail(ResponseEnum.ACCESS_DENIED);
    }

    // sql 操作异常
    @ExceptionHandler(DataIntegrityViolationException.class)
    @ResponseBody
    public ResponseResult dataIntegrityViolationExceptionHandler(DataIntegrityViolationException e) {
        log.error(e.getMessage(), e);
        return WebUtils.fail(ResponseEnum.BAD_SQL);
    }

    @ExceptionHandler(BadSqlGrammarException.class)
    @ResponseBody
    public ResponseResult badSqlGrammarExceptionHandler(BadSqlGrammarException e) {
        log.error(e.getMessage(), e);
        return WebUtils.fail(ResponseEnum.BAD_SQL);
    }

    // TODO 自定义可能更多的异常
    // 通用异常信息
    @ExceptionHandler(Exception.class)
    @ResponseBody
    public ResponseResult exceptionHandler(Exception e) {
        log.error(e.getMessage(), e);
        // 详细异常信息 放入到 data 字段中
        return WebUtils.fail(ResponseEnum.EXCEPTION_MSG, e.getMessage());
    }
}
