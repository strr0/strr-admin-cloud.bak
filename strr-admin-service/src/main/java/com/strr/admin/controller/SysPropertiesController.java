package com.strr.admin.controller;

import com.strr.admin.model.SysProperties;
import com.strr.admin.service.SysPropertiesService;
import com.strr.base.model.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/admin/sysProperties")
public class SysPropertiesController {
    private final SysPropertiesService sysPropertiesService;

    @Autowired
    public SysPropertiesController(SysPropertiesService sysPropertiesService) {
        this.sysPropertiesService = sysPropertiesService;
    }

    /**
     * 获取应用列表
     */
    @GetMapping("/listApplication")
    public Result<List<SysProperties>> listApplication(String application) {
        List<SysProperties> list = sysPropertiesService.listApplication(application);
        return Result.ok(list);
    }

    /**
     * 获取属性列表
     */
    @GetMapping("/listProperties")
    public Result<List<SysProperties>> listProperties(String application) {
        List<SysProperties> list = sysPropertiesService.listProperties(application);
        return Result.ok(list);
    }
}
