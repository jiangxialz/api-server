package com.qinyou.apiserver.core.security;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;

/**
 * 安全用户模型
 * @author chuang
 */
public class JwtUser implements UserDetails {
    private String username;
    private String password;
    private Collection<? extends GrantedAuthority> authorities;
    private String state;

    JwtUser(String username, String password, Collection<? extends GrantedAuthority> authorities,String state) {
        this.username = username;
        this.password = password;
        this.authorities = authorities;
        this.state = state;
    }

    @Override
    public String getUsername() {
        return username;
    }

    @JsonIgnore
    @Override
    public String getPassword() {
        return password;
    }

    // 返回用户权限集合
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return authorities;
    }

    // 账号是否 没有过期
    @JsonIgnore
    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    // 账号是否没有锁定
    @JsonIgnore
    @Override
    public boolean isAccountNonLocked() {
        return "0".equals(state);
    }

    // 账号密码是否 没有过期
    @JsonIgnore
    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @JsonIgnore
    @Override
    public boolean isEnabled() {
        return true;
    }

}
