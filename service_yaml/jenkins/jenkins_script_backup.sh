
젠킨스 스크립트 백업용

##################################################################################################
# skimscnr
##################################################################################################



node {
        stage('git clone') {
            echo 'skims-cnr-pipeline start'
            try {
                sh 'rm -rf skims'
            }catch(e)
            {
                sh 'echo "skims-cnr not found"'
            }
            sh 'git clone https://github.com/ByounggwanLee/skims.git'
            sh 'chmod +x skims/skimscnr/gradlew'
            sh 'aws ecr get-login-password --region ap-northeast-2 | docker login --username AWS --password-stdin 504441673365.dkr.ecr.ap-northeast-2.amazonaws.com'
        }
        
        stage('build') {
            dir('./') {
                sh './cnr-build.sh skimscnr ${BUILD_NUMBER}'
            }
        }
        
        stage('deploy to k8s') {
            sh 'envsubst <  /var/lib/jenkins/workspace/skims-cnr/cnr-deployment-template.yaml > /var/lib/jenkins/workspace/skims-cnr/cnr-deployment.yaml'
            sh '/var/lib/jenkins/bin/kubectl apply -f /var/lib/jenkins/workspace/skims-cnr/cnr-deployment.yaml'
        }
        
        stage('end') {
            echo 'skims-cnr-pipeline end'
         }
        
}


##################################################################################################
# skimscus
##################################################################################################

node {
        stage('git clone') {
            echo 'skims-cus-pipeline start'
            try {
                sh 'rm -rf skims'
            }catch(e)
            {
                sh 'echo "skims-cus not found"'
            }
            sh 'git clone https://github.com/ByounggwanLee/skims.git'
            sh 'chmod +x skims/skimscus/gradlew'
            sh 'aws ecr get-login-password --region ap-northeast-2 | docker login --username AWS --password-stdin 504441673365.dkr.ecr.ap-northeast-2.amazonaws.com'
        }
        
        stage('build') {
            dir('./') {
                sh './build.sh skimscus ${BUILD_NUMBER}'
            }
        }
        
        stage('deploy to k8s') {
            sh 'envsubst <  /var/lib/jenkins/workspace/skims-cus/cus-deployment-template.yaml > /var/lib/jenkins/workspace/skims-cus/cus-deployment.yaml'
            sh '/var/lib/jenkins/bin/kubectl apply -f /var/lib/jenkins/workspace/skims-cus/cus-deployment.yaml'
        }
        
        stage('end') {
            echo 'skims-cus-pipeline end'
         }
        
}


##################################################################################################
# skimsfin
##################################################################################################

node {
        stage('git clone') {
            echo 'skims-fin-pipeline start'
            try {
                sh 'rm -rf skims'
            }catch(e)
            {
                sh 'echo "skims-fin not found"'
            }
            sh 'git clone https://github.com/ByounggwanLee/skims.git'
            sh 'chmod +x skims/skimsfin/gradlew'
            sh 'aws ecr get-login-password --region ap-northeast-2 | docker login --username AWS --password-stdin 504441673365.dkr.ecr.ap-northeast-2.amazonaws.com'
        }
        
        stage('build') {
            dir('./') {
                sh './fin-build.sh skimsfin ${BUILD_NUMBER}'
            }
        }
        
        stage('deploy to k8s') {
            sh 'envsubst <  /var/lib/jenkins/workspace/skims-fin/fin-deployment-template.yaml > /var/lib/jenkins/workspace/skims-fin/fin-deployment.yaml'
            sh '/var/lib/jenkins/bin/kubectl apply -f /var/lib/jenkins/workspace/skims-fin/fin-deployment.yaml'
        }
        
        stage('end') {
            echo 'skims-fin-pipeline end'
         }
        
}


##################################################################################################
# skimsfrontend
##################################################################################################

node {
        stage('git clone') {
            echo 'skims-frontend-pipeline start'
            try {
                sh 'rm -rf skims'
            }catch(e)
            {
                sh 'echo "skims-frontend not found"'
            }
            sh 'git clone https://github.com/ByounggwanLee/skims.git'
            sh 'chmod +x skims/skimsudw/gradlew'
            sh 'aws ecr get-login-password --region ap-northeast-2 | docker login --username AWS --password-stdin 504441673365.dkr.ecr.ap-northeast-2.amazonaws.com'
        }
		
		stage('docker build') {
            dir('skims/frontend') {
                sh 'docker build -t 504441673365.dkr.ecr.ap-northeast-2.amazonaws.com/frontend:ver-${BUILD_NUMBER} .'
				sh 'docker push 504441673365.dkr.ecr.ap-northeast-2.amazonaws.com/frontend:ver-${BUILD_NUMBER}'
            }
        }		
		
        stage('deploy to k8s') {
            sh 'envsubst <  /var/lib/jenkins/workspace/skims-frontend/frontend-deployment-template.yaml > /var/lib/jenkins/workspace/skims-frontend/frontend-deployment.yaml'
            sh '/var/lib/jenkins/bin/kubectl apply -f /var/lib/jenkins/workspace/skims-frontend/frontend-deployment.yaml'
        }
        
        stage('end') {
            echo 'skims-frontend-pipeline end'
         }
        
}


##################################################################################################
# skimsigd
##################################################################################################

node {
        stage('git clone') {
            echo 'skims-igd-pipeline start'
            try {
                sh 'rm -rf skims'
            }catch(e)
            {
                sh 'echo "skims-igd not found"'
            }
            sh 'git clone https://github.com/ByounggwanLee/skims.git'
            sh 'chmod +x skims/skimsigd/gradlew'
            sh 'aws ecr get-login-password --region ap-northeast-2 | docker login --username AWS --password-stdin 504441673365.dkr.ecr.ap-northeast-2.amazonaws.com'
        }
        
        stage('build') {
            dir('./') {
                sh './build.sh skimsigd ${BUILD_NUMBER}'
            }
        }
        
        stage('deploy to k8s') {
            sh 'envsubst <  /var/lib/jenkins/workspace/skims-igd/igd-deployment-template.yaml > /var/lib/jenkins/workspace/skims-igd/igd-deployment.yaml'
            sh '/var/lib/jenkins/bin/kubectl apply -f /var/lib/jenkins/workspace/skims-igd/igd-deployment.yaml'
        }
        
        stage('end') {
            echo 'skims-igd-pipeline end'
         }
        
}


##################################################################################################
# skimspay
##################################################################################################

node {
        stage('git clone') {
            echo 'skims-pay-pipeline start'
            try {
                sh 'rm -rf skims'
            }catch(e)
            {
                sh 'echo "skims-pay not found"'
            }
            sh 'git clone https://github.com/ByounggwanLee/skims.git'
            sh 'chmod +x skims/skimspay/gradlew'
            sh 'aws ecr get-login-password --region ap-northeast-2 | docker login --username AWS --password-stdin 504441673365.dkr.ecr.ap-northeast-2.amazonaws.com'
        }
        
        stage('build') {
            dir('./') {
                sh './pay-build.sh skimspay ${BUILD_NUMBER}'
            }
        }
        
        stage('deploy to k8s') {
            sh 'envsubst <  /var/lib/jenkins/workspace/skims-pay/pay-deployment-template.yaml > /var/lib/jenkins/workspace/skims-pay/pay-deployment.yaml'
            sh '/var/lib/jenkins/bin/kubectl apply -f /var/lib/jenkins/workspace/skims-pay/pay-deployment.yaml'
        }
        
        stage('end') {
            echo 'skims-pay-pipeline end'
         }
        
}


##################################################################################################
# skimspln
##################################################################################################

node {
        stage('git clone') {
            echo 'skims-pln-pipeline start'
            try {
                sh 'rm -rf skims'
            }catch(e)
            {
                sh 'echo "skims-pln not found"'
            }
            sh 'git clone https://github.com/ByounggwanLee/skims.git'
            sh 'chmod +x skims/skimspln/gradlew'
            sh 'aws ecr get-login-password --region ap-northeast-2 | docker login --username AWS --password-stdin 504441673365.dkr.ecr.ap-northeast-2.amazonaws.com'
        }
        
        stage('build') {
            dir('./') {
                sh './pln-build.sh skimspln ${BUILD_NUMBER}'
            }
        }
        
        stage('deploy to k8s') {
            sh 'envsubst <  /var/lib/jenkins/workspace/skims-pln/pln-deployment-template.yaml > /var/lib/jenkins/workspace/skims-pln/pln-deployment.yaml'
            sh '/var/lib/jenkins/bin/kubectl apply -f /var/lib/jenkins/workspace/skims-pln/pln-deployment.yaml'
        }
        
        stage('end') {
            echo 'skims-pln-pipeline end'
         }
        
}



##################################################################################################
# skimsudw
##################################################################################################

node {
        stage('git clone') {
            echo 'skims-udw-pipeline start'
            try {
                sh 'rm -rf skims'
            }catch(e)
            {
                sh 'echo "skims-udw not found"'
            }
            sh 'git clone https://github.com/ByounggwanLee/skims.git'
            sh 'chmod +x skims/skimsudw/gradlew'
            sh 'aws ecr get-login-password --region ap-northeast-2 | docker login --username AWS --password-stdin 504441673365.dkr.ecr.ap-northeast-2.amazonaws.com'
        }
        
        stage('build') {
            dir('./') {
                sh './udw-build.sh skimsudw ${BUILD_NUMBER}'
            }
        }
        
        stage('deploy to k8s') {
            sh 'envsubst <  /var/lib/jenkins/workspace/skims-udw/udw-deployment-template.yaml > /var/lib/jenkins/workspace/skims-udw/udw-deployment.yaml'
            sh '/var/lib/jenkins/bin/kubectl apply -f /var/lib/jenkins/workspace/skims-udw/udw-deployment.yaml'
        }
        
        stage('end') {
            echo 'skims-udw-pipeline end'
         }
        
}