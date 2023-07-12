package com.strr.admin.controller;

import com.strr.admin.client.SysAuthorityFeignClient;
import com.strr.admin.model.SysAuthority;
import com.strr.admin.model.SysAuthorityVO;
import com.strr.base.model.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/admin/sysAuthority")
public class SysAuthorityController {
    @Autowired
    private SysAuthorityFeignClient sysAuthorityFeignClient;

    @GetMapping("/menuTree")
    public Result<List<SysAuthorityVO>> menuTree(SysAuthority param) {
        return sysAuthorityFeignClient.menuTree(param);
    }
}
