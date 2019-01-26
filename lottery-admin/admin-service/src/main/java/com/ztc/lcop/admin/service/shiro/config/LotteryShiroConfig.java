package com.ztc.lcop.admin.service.shiro.config;

import com.ztc.lcop.admin.service.shiro.AdminShiroRealm;
import org.apache.shiro.cache.CacheManager;
import org.apache.shiro.cache.ehcache.EhCacheManager;
import org.apache.shiro.codec.Base64;
import org.apache.shiro.mgt.DefaultSecurityManager;
import org.apache.shiro.session.mgt.SessionManager;
import org.apache.shiro.web.mgt.CookieRememberMeManager;
import org.apache.shiro.web.servlet.SimpleCookie;
import org.springframework.cache.ehcache.EhCacheManagerFactoryBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class LotteryShiroConfig {

    /**
     * 设置默认的SecurityManager
     *
     * @param rememberMeManager 记住我
     * @param cacheShiroManager 缓存
     * @param sessionManager    会话管理
     * @return SecurityManager
     */
    @Bean
    public DefaultSecurityManager securityManager(CookieRememberMeManager rememberMeManager
            , CacheManager cacheShiroManager, SessionManager sessionManager) {

        DefaultSecurityManager securityManager = new DefaultSecurityManager();
        // TODO: 2019/1/26 设置自定义Realm
        securityManager.setRememberMeManager(rememberMeManager);
        securityManager.setCacheManager(cacheShiroManager);
        securityManager.setSessionManager(sessionManager);

        return securityManager;
    }

    /**
     * 缓存管理器 使用Ehcache实现
     *
     * @param ehcache 详细参见 {@code EhCacheConfig.java}
     * @return 缓存管理
     */
    @Bean
    public CacheManager getCacheShiroManager(EhCacheManagerFactoryBean ehcache) {
        EhCacheManager ehCacheManager = new EhCacheManager();
        ehCacheManager.setCacheManager(ehcache.getObject());
        return ehCacheManager;
    }

    /**
     * rememberMe管理器, cipherKey生成见{@code Base64Test.java}
     */
    @Bean
    public CookieRememberMeManager rememberMeManager(SimpleCookie rememberMeCookie) {
        CookieRememberMeManager manager = new CookieRememberMeManager();
        manager.setCipherKey(Base64.decode("Z3VucwAAAAAAAAAAAAAAAA=="));
        manager.setCookie(rememberMeCookie);
        return manager;
    }

    /**
     * 记住密码Cookie
     */
    @Bean
    public SimpleCookie rememberMeCookie() {
        SimpleCookie simpleCookie = new SimpleCookie("rememberMe");
        simpleCookie.setHttpOnly(true);
        simpleCookie.setMaxAge(7 * 24 * 60 * 60);//7天
        return simpleCookie;
    }

    /**
     * 项目自定义的Realm
     */
    @Bean
    public AdminShiroRealm shiroDbRealm() {
        return new AdminShiroRealm();
    }

}
