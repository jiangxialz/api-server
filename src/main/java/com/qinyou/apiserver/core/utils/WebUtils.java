package com.qinyou.apiserver.core.utils;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.qinyou.apiserver.core.base.FindDTO;
import com.qinyou.apiserver.core.base.OrderDTO;
import com.qinyou.apiserver.core.base.PageDTO;
import com.qinyou.apiserver.core.base.PageFindDTO;
import com.qinyou.apiserver.core.result.ResponseEnum;
import com.qinyou.apiserver.core.result.ResponseResult;
import com.qinyou.apiserver.core.security.JwtUser;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.context.SecurityContextHolder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/**
 * 通用工具类，方法 全部 为 static 方法
 * @author chuang
 */
@SuppressWarnings("Duplicates")
@Slf4j
public class WebUtils {


    /**
     * 对象 转 json 字符串,使用内置 配置好的 objectMapper, 与 spring 耦合
     * @param o
     * @return
     */
    public static String toJSONString(Object o){
        ObjectMapper objectMapper = SpringUtils.getBean(ObjectMapper.class);
        String jsonString;
        try {
            jsonString =  objectMapper.writeValueAsString(o);
        } catch (JsonProcessingException e) {
            jsonString = "";
            log.error(e.getMessage(),e);
        }
        return jsonString;
    }

    /**
     * 通过 response 响应为 json
     * @param response
     * @param responseResult
     */
    public static  <T>  void outPrintJSON(HttpServletResponse response, ResponseResult<T> responseResult){
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=utf-8");
        String str = toJSONString(responseResult);
        PrintWriter out;
        try {
            out = response.getWriter();
            out.print(str);
            out.flush();
            out.close();
        } catch (IOException e) {
            log.error(e.getMessage(),e);
        }
    }

    /**
     * 获取客户端IP
     * @param request
     * @return
     */
    public static String getClientIp(HttpServletRequest request) {
        String ip = request.getHeader("X-Real-IP");
        if (ip==null || "".equals(ip.trim()) || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("X-Forwarded-For");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknow".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        if("0.0.0.0".equals(ip) || "0:0:0:0:0:0:0:1".equals(ip) || "localhost".equals(ip) || "127.0.0.1".equals(ip)){
            ip = "127.0.0.1";
        }
        return ip;
    }


    /**
     * 获得当前认证的用户名
     * @return
     */
    public static  String getSecurityUsername(){
        String  username = "游客";
        if(SecurityContextHolder.getContext()!=null &&  SecurityContextHolder.getContext().getAuthentication()!=null){
            if(SecurityContextHolder.getContext().getAuthentication().getPrincipal() instanceof JwtUser){
                JwtUser jwtUser = (JwtUser)SecurityContextHolder.getContext().getAuthentication().getPrincipal() ;
                username =  jwtUser.getUsername();
            }
            // 否则是  anonymousUser
        }
        return username;
    }


    /**
     * 构建 分页 排序 等 条件
     * @param pageFindDto
     * @param <T>
     * @return
     */
    public static <T> IPage<T> buildSearchPage(PageFindDTO pageFindDto){
        Page<T> page = new Page<T>().setCurrent(pageFindDto.getCurrent())
                .setSize(pageFindDto.getPageSize());
        return  page;
    }

    /**
     * 构造查询条件
     * @param findDto
     * @param <T>
     * @return
     */
    public static  <T> QueryWrapper<T> buildSearchQueryWrapper(FindDTO findDto){
        Map<String,String> filter = findDto.getFilter();
        QueryWrapper<T> queryWrapper = new QueryWrapper<>();

        String filterStr;
        String filterField;
        String filterQuery;
        // 查询参数
        if(filter!=null){
            for (Map.Entry<String,String> entry: filter.entrySet()){
                filterStr = entry.getKey();
                if(!filterStr.startsWith("search_")){
                    continue;
                }

//                "search_EQ_action_name"
                filterStr = filterStr.replaceAll("search_","");
                filterQuery = filterStr.substring(0,filterStr.indexOf("_"));
                filterField = filterStr.substring(filterStr.indexOf("_")+1);

                switch (filterQuery){
                    case "EQ":
                        queryWrapper.eq(filterField,entry.getValue());
                        break;
                    case "LIKE":
                        queryWrapper.like(filterField,entry.getValue());
                        break;
                    case "GT":
                        queryWrapper.gt(filterField,entry.getValue());
                        break;
                    case "LT":
                        queryWrapper.lt(filterField,entry.getValue());
                        break;
                    case "GTE":
                        queryWrapper.ge(filterField,entry.getValue());
                        break;
                    case "LTE":
                        queryWrapper.le(filterField,entry.getValue());
                        break;
                    case "IN":
                        queryWrapper.in(filterField,entry.getValue().split(","));
                        break;
                }
            }
        }

        // 排序参数
        List<OrderDTO> orders = findDto.getOrders();
        if(orders!=null){
            for (OrderDTO order : orders) {
                switch (order.getSort().toUpperCase()){
                    case "ASC": queryWrapper.orderByAsc(order.getColumn());break;
                    case "DESC": queryWrapper.orderByDesc(order.getColumn());break;
                    default: queryWrapper.orderByAsc(order.getColumn()); break;
                }
            }
        }
        return  queryWrapper;
    }


    /**
     * mybatis plus 分页查询结果封装
     * @param page
     * @param <T>
     * @return
     */
    public static <T> PageDTO<T> buildResultPage(IPage<T> page ){
        return new PageDTO<>(page.getCurrent(),page.getSize(),page.getTotal(),page.getPages(),page.getRecords());
    }

    // 成功消息响应
    public static <T> ResponseResult<T> ok(ResponseEnum responseEnum){
        return ResponseResult.<T>builder()
                .status(true)
                .code(responseEnum.getCode())
                .msg(responseEnum.getMsg())
                .build();
    }

    // 成功 消息响应，带消息参数
    public static <T> ResponseResult<T> ok(ResponseEnum responseEnum,Object[] args){
        return ResponseResult.<T>builder()
                .status(true)
                .code(responseEnum.getCode())
                .msg(responseEnum.getMsg(args))
                .build();
    }
    // 成功 数据响应
    public static  <T>  ResponseResult<T> ok(T data){
        return ResponseResult.<T>builder()
                .status(true)
                .data(data)
                .build();
    }

    // 成功 消息数据 响应
    public static <T> ResponseResult<T> ok(ResponseEnum responseEnum, T data){
        return ResponseResult.<T>builder()
                .status(true)
                .code(responseEnum.getCode())
                .msg(responseEnum.getMsg())
                .data(data)
                .build();
    }

    // 失败 消息 响应
    public static <T> ResponseResult fail(ResponseEnum responseEnum){
        return ResponseResult.builder()
                .status(false)
                .code(responseEnum.getCode())
                .msg(responseEnum.getMsg())
                .build();
    }
    // 失败消息响应，消息带参数
    public static <T> ResponseResult fail(ResponseEnum responseEnum, Object[] args){
        return ResponseResult.builder()
                .status(false)
                .code(responseEnum.getCode())
                .msg(responseEnum.getMsg(args))
                .build();
    }
    // 失败 消息数据响应
    public static <T> ResponseResult<T> fail(ResponseEnum responseEnum, T data){
        return ResponseResult.<T>builder()
                .status(false)
                .code(responseEnum.getCode())
                .msg(responseEnum.getMsg())
                .data(data)
                .build();
    }


    /**
     * 构建具有层级结构的树形数据
     * @param allNodes          完整所有数据
     * @param idFieldName       id字段名
     * @param pidFieldName      pid字段名
     * @param childrenFieldName children字段名
     * @param fieldNames        额外的字段名
     * @return
     */
    public static List<Map<String, Object>> buildTreeData(List<Map<String, Object>> allNodes,
                                                          String idFieldName,  String pidFieldName,
                                                          String childrenFieldName, String[] fieldNames) {
        List<Map<String, Object>> rootNodes = new LinkedList<>();

        // 拿到全部的 根节点
        for(Map<String,Object> item:allNodes){
            if(!parentNodeExist(item, idFieldName, pidFieldName, allNodes)){
                Map<String,Object> node  = new LinkedHashMap<>();
                node.put(idFieldName,item.get(idFieldName));
                node.put(pidFieldName, item.get(pidFieldName));
                for(String fieldName : fieldNames){
                    node.put(fieldName, item.get(fieldName));
                }
                rootNodes.add(node);
            }
        }
        // 不同集合，但集合内对象初始化相同
        LinkedList<Map<String,Object>> queue = new LinkedList<>();
        queue.addAll(rootNodes);

        // 一层一层 拿到子节点，直到拿不到 子节点为止(叶子节点)
        while(queue.size()!=0){
            Map<String,Object> headItem = queue.pop();
            for(Map<String,Object> item:allNodes){
                if(item.get(pidFieldName).equals(headItem.get(idFieldName))){
                    Map<String,Object> childNode = new LinkedHashMap<>();
                    childNode.put(idFieldName,item.get(idFieldName));
                    childNode.put(pidFieldName, item.get(pidFieldName));
                    for(String fieldName : fieldNames){
                        childNode.put(fieldName, item.get(fieldName));
                    }
                    @SuppressWarnings("unchecked")
                    List<Map<String,Object>> children =
                            (List<Map<String, Object>>) headItem.get(childrenFieldName);
                    if(children == null){
                        children = new LinkedList<>();
                        headItem.put(childrenFieldName, children);
                    }
                    children.add(childNode);
                    queue.push(childNode);
                }
            }
        }

        return rootNodes;
    }

    /**
     * 当前节点是否为 根节点 (通过判断当前节点 父节点是否存在)
     *
     * @param node     当前节点
     * @param idFieldName  id字段名
     * @param pidFieldName   pid字段名
     * @param allNodes  完整全部节点
     * @return
     */
    private static boolean parentNodeExist(Map<String, Object> node, String idFieldName,
                                           String pidFieldName, List<Map<String, Object>> allNodes) {
        boolean flag = false;
        for (Map<String, Object> item : allNodes) {
            if (node.get(pidFieldName).equals(item.get(idFieldName))) {
                flag = true;
                break;
            }
        }
        return flag;
    }
}
