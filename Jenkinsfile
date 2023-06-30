pipeline{
    agent {
		yaml '''
        apiVersion: v1
        kind: Pod
        metadata:
          labels:
            some-label: some-label-value
        spec:
          containers:
          - name: maven
            image: maven:alpine
            command:
            - cat
            tty: true
          - name: busybox
            image: busybox
            command:
            - cat
            tty: true
        '''
      retries 2
	}
	
    stages {
		stage("runner in default container"){
			steps {
				sh "echo The default container is $POD_CONTAINER"
			}
		}
		
		stage("runner in a specify container"){
			steps {
				container('maven'){
					sh "echo The default container is $POD_CONTAINER"
				}
				container('busybox'){
					sh "echo The default container is $POD_CONTAINER"
				}
			}
		}
	
        //由于源码和Jenkinsfile处于同一仓库，在Jenkins项目执行时，会先将Jenkinsfile所在的仓库克隆下来，为了简单，这里就不重复添加拉取源码的操作了
        //其它情况，如使用多个仓库一些构建的，这种就需要额外添加拉取代码的stage了。
		//stage('Build Artifact') {
            //steps{
                //sh label: 'maven building', script: 'mvn clean package -DskipTests'
            //}
        //}
        //stage('Build Image'){
            //steps{
                //sh label: 'image building', script: '/bin/bash java2dockerImage.sh'
            //}
        //}
        //stage('Deploy k8s'){
            //steps{
                //sh label: 'deploy image to k8s', script: '/bin/bash dockerImage2Kube.sh'
            //}
        //}
    }
    post {
        success{
            //成功清理工作空间，失败保留现场
            cleanWs()
        }
    }
}