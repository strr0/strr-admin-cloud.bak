package com.strr.admin.client;

import com.strr.admin.model.SysAuthority;
import com.strr.base.model.Result;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@FeignClient("adminservice")
public interface SysAuthorityFeignClient {
    @RequestMapping(
            method = RequestMethod.GET,
            value = "/admin/sysAuthority/menuTree",
            consumes = "application/json"
    )
    Result<List<SysAuthority>> menuTree(SysAuthority param);
}
