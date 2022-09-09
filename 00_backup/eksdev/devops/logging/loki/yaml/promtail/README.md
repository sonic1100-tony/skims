promtail은 aws storage EBS를 사용할 필요가 없음.
Daemonset으로 동작하므로 hostPath만으로도 충분함.

   volumes:
        - name: config
          configMap:
            name: promtail
            defaultMode: 420
        - name: run
          hostPath:
            path: /run/promtail
            type: ''
        - name: docker
          hostPath:
            path: /var/lib/docker/containers
            type: ''
        - name: pods
          hostPath:
            path: /var/log/pods
            type: ''



Promtail에서 loki와 연결 하므로아래와 같이 URL을 일치시켜야 함. 
Loki의 ServiceName을 일치시켜야 함.
      containers:
        - name: promtail
          image: grafana/promtail:2.0.0
          args:
            - '-config.file=/etc/promtail/promtail.yaml'
            - '-client.url=http://loki:3100/loki/api/v1/push'

