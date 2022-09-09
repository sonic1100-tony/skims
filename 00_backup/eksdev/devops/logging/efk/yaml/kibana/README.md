 securityContext:
            readOnlyRootFilesystem: false  #if true , write permission error.


yaml file에서 readOnlyRootFilesystem을 true로 하니 아래와 같은 에러 발생. 



[ec2-user@ip-10-12-102-13 elasticsearch]$ kubectl logs -f kibana-79f6bc875-f99vq -n logging
[2022-06-17T05:07:07.650+00:00][FATAL][root] Error: Unable to write to UUID file at /usr/share/kibana/data/uuid. Ensure Kibana has sufficient permissions to read / write to this file.  Error was: EROFS
    at writeUuidToFile (/usr/share/kibana/src/core/server/environment/resolve_uuid.js:111:11)
    at resolveInstanceUuid (/usr/share/kibana/src/core/server/environment/resolve_uuid.js:68:5)
    at EnvironmentService.preboot (/usr/share/kibana/src/core/server/environment/environment_service.js:73:17)
    at Server.preboot (/usr/share/kibana/src/core/server/server.js:157:32)
    at Root.preboot (/usr/share/kibana/src/core/server/root/index.js:48:14)
    at bootstrap (/usr/share/kibana/src/core/server/bootstrap.js:99:9)
    at Command.<anonymous> (/usr/share/kibana/src/cli/serve/serve.js:216:5)

 FATAL  Error: Unable to write to UUID file at /usr/share/kibana/data/uuid. Ensure Kibana has sufficient permissions to read / write to this file.  Error was: EROFS



exception: Security must be explicitly enabled when using a [basic] license. Enable security by setting [xpack.security.enabled] to [true] in the elasticsearch.yml file and restart the node. (500)
