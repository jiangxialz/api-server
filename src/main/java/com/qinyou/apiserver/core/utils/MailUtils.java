package com.qinyou.apiserver.core.utils;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

/**
 * 发送邮件
 */
@Component
@Slf4j
public class MailUtils {

    @Autowired
    private JavaMailSender mailSender;

    @Value("${spring.mail.username}")
    private String from;

    /**
     * 发送纯文本邮件
     * @param to
     * @param subject
     * @param content
     * @return
     */
    public boolean sendTextMail(String to,String subject,String content){
        boolean flag = false;
        try{
            SimpleMailMessage message = new SimpleMailMessage();
            message.setFrom(from);
            message.setTo(to);
            message.setSubject(subject);
            message.setText(content);
            mailSender.send(message);
            flag = true;
        }catch (Exception e){
            log.error(e.getMessage(),e);
        }
        return flag;
    }


    /**
     * 发送html 邮件
     * @param to
     * @param subject
     * @param content
     * @throws MessagingException
     */
    public boolean sendHtmlMail(String to,String subject,String content) {
        boolean flag = false;
        try{
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper send = new MimeMessageHelper(message,true);
            send.setFrom(from);
            send.setTo(to);
            send.setSubject(subject);
            send.setText(content,true);
            mailSender.send(message);
            flag = true;
        }catch (Exception e){
            log.error(e.getMessage(),e);
        }
        return flag;
    }

}
