package com.strr.admin.service.impl;

import com.strr.admin.mapper.SysPropertiesMapper;
import com.strr.admin.model.SysProperties;
import com.strr.admin.service.SysPropertiesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SysPropertiesServiceImpl implements SysPropertiesService {
    private final SysPropertiesMapper sysPropertiesMapper;

    @Autowired
    public SysPropertiesServiceImpl(SysPropertiesMapper sysPropertiesMapper) {
        this.sysPropertiesMapper = sysPropertiesMapper;
    }

    /**
     * 获取应用列表
     */
    @Override
    public List<SysProperties> listApplication(String application) {
        return sysPropertiesMapper.listApplication(application);
    }

    /**
     * 获取属性列表
     */
    @Override
    public List<SysProperties> listProperties(String application) {
        return sysPropertiesMapper.listProperties(application);
    }
}
