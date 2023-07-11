package com.strr.web;

import com.strr.config.security.OAuth2Scope;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.oauth2.core.endpoint.OAuth2ParameterNames;
import org.springframework.security.oauth2.server.authorization.client.RegisteredClient;
import org.springframework.security.oauth2.server.authorization.client.RegisteredClientRepository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

@RestController
public class OAuth2ConsentController {
    private final RegisteredClientRepository registeredClientRepository;

    @Autowired
    public OAuth2ConsentController(RegisteredClientRepository registeredClientRepository) {
        this.registeredClientRepository = registeredClientRepository;
    }

    @GetMapping(value = "/oauth2/consent")
    public Map<String, Object> consent(Principal principal,
                                       @RequestParam(OAuth2ParameterNames.CLIENT_ID) String clientId,
                                       @RequestParam(OAuth2ParameterNames.SCOPE) String scope,
                                       @RequestParam(OAuth2ParameterNames.STATE) String state) {

        Map<String, Object> data = new HashMap<>();
        data.put("clientId", clientId);
        data.put("state", state);
        data.put("principalName", principal.getName());

        RegisteredClient client = this.registeredClientRepository.findByClientId(clientId);
        if (client != null) {
            List<Map<String, Object>> scopes = client.getScopes().stream().map(OAuth2Scope::getScope)
                    .filter(Objects::nonNull).map(item -> {
                        Map<String, Object> map = item.toMap();
                        if (scope.contains(item.getCode())) {
                            map.put("disabled", false);
                        } else {
                            map.put("disabled", true);
                        }
                        return map;
                    }).collect(Collectors.toList());
            data.put("scopes", scopes);
            data.put("clientName", client.getClientName());
            data.put("redirectUri", client.getRedirectUris().iterator().next());
        }

        return new HashMap<>() {{
            put("code", HttpServletResponse.SC_OK);
            put("data", data);
        }};
    }
}
