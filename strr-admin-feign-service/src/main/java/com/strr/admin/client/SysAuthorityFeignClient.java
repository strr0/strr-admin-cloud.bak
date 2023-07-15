package com.strr.admin.client;

import com.strr.admin.model.SysAuthority;
import com.strr.admin.model.SysAuthorityVO;
import com.strr.base.model.Result;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.cloud.openfeign.SpringQueryMap;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@FeignClient("adminservice")
public interface SysAuthorityFeignClient {
    @GetMapping("/admin/sysAuthority/menuTree")
    Result<List<SysAuthorityVO>> menuTree(@SpringQueryMap SysAuthority param);
}
