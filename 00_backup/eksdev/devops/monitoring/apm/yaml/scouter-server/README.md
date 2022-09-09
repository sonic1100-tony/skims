yaml 파일 적용할 때 주의사항
 Deployment 적용 
  1) namespace
  2) nodeSelector
  3) Disk Volume

 Service 적용 
  1) LoadBalancer Service 적용시 
    service.beta.kubernetes.io/aws-load-balancer-type: "nlb"
    service.beta.kubernetes.io/aws-load-balancer-internal: "true"
