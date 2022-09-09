ServiceAccount를 생성하면 secret을 random으로 생성함. 
statefulset에서는 serviceName이 필수항목인데ClusterIP나 Headless로 생성하고 serviceName을 statefulset의 serviceName과 일치시키지 않아도 잘 동작함.

단 statefulset은 몇가지 특정이 있음.
1) 스테이트 풀셋과 관련된 볼륨은 삭제되지 않음. (관리 필요)
2) Pod 네트워크 ID를 유지하기 위해 headless 서비스 필요.
기타 여러가지 특징이 있는데 궁금하면 인터넷 검색해보세요.

그리고 kubectl xxx xxx -o yaml로 보는 것과 k8s dashboard에서 yaml 파일 보는 것의 내용이 다름. k8s dashboard가 더 많은 내용을 보여줌.

Deploymentㄹ 수행해도 당연히 동작함.

그리고 둑이 Cluster가 필요없는 1개의 Replicas인 시스템은 headless가 적합해 보임.



