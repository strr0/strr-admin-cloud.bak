package com.strr.config.security;

import java.util.HashMap;
import java.util.Map;

public enum OAuth2Scope {
//    read("read", "读权限"),
//    write("write", "写权限"),
    web("web", "web端权限"),
    app("app", "app端权限");

    private final String code;
    private final String name;

    OAuth2Scope(String code, String name) {
        this.code = code;
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public String getName() {
        return name;
    }

    public static OAuth2Scope getScope(String code) {
        for (OAuth2Scope scope : values()) {
            if (scope.getCode().equals(code)) {
                return scope;
            }
        }
        return null;
    }

    public Map<String, Object> toMap() {
        return new HashMap<>() {{
            put("code", getCode());
            put("name", getName());
        }};
    }
}
