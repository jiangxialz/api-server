package com.qinyou.apiserver.core.controller;

import cn.hutool.core.date.DateUtil;
import com.qinyou.apiserver.core.result.RequestException;
import com.qinyou.apiserver.core.result.ResponseEnum;
import com.qinyou.apiserver.core.result.ResponseResult;
import com.qinyou.apiserver.core.utils.WebUtils;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;

@RestController
@RequestMapping("/file")
@Slf4j
public class FileController {

    @ApiOperation("文件上传, 表单key为 file")
    @PostMapping("/upload")
    @ResponseBody
    public ResponseResult<String> upload(HttpServletRequest req, @RequestParam("file") MultipartFile file) {
        String path = null;
        try {
            String fileName = System.currentTimeMillis() +"_"+ file.getOriginalFilename();
            String date = DateUtil.format(new Date(),"yyyy_MM_dd");
            path = "static/upload/" + date + "/" + fileName;
            String destFileName = req.getServletContext().getRealPath("") + path;
            File destFile = new File(destFileName);
            if(!destFile.getParentFile().exists()){
               if(!destFile.getParentFile().mkdirs()){
                   throw RequestException.fail(ResponseEnum.UPLOAD_FAIL);
               }
            }
            file.transferTo(destFile);
            log.debug("dest file path: {}",destFile.getAbsolutePath());
        } catch (IOException e) {
            log.error(e.getMessage(),e);
            throw RequestException.fail(ResponseEnum.UPLOAD_FAIL);
        }
        return WebUtils.ok(path) ;
    }
}
