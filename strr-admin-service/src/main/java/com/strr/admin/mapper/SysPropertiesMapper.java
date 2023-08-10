package com.strr.admin.mapper;

import com.strr.admin.model.SysProperties;

import java.util.List;

public interface SysPropertiesMapper {
    /**
     * 获取应用列表
     */
    List<SysProperties> listApplication(String application);

    /**
     * 获取属性列表
     */
    List<SysProperties> listProperties(String application);
}
