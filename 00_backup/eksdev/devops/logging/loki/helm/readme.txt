https://sotl.tistory.com/283 참조 

helm repo add loki https://grafana.github.io/loki/charts

helm repo list

helm upgrade --install loki --namespace=logging loki/loki
#loki는 nodeSelector , diskVolume을 설정해야함.


helm upgrade --install promtail loki/promtail --set "loki.serviceName=loki" --namespace=logging
#promtail는 nodeSelector , diskVolume을 설정해야함.


uninstall은 
helm uninstall loki -n logging
helm uninstall promtail -n logging



