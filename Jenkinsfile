pipeline {
    agent any

    environment {
        LANG = 'en_US.UTF-8'
        LC_ALL = 'en_US.UTF-8'
        APP_NAME = 'MavenAnsibleWebApp'
        TOMCAT_URL = 'http://localhost:9090'
    }

    tools {
        maven 'Maven'
    }

    stages {
        stage('Checkout') {
            steps {
                echo "🔄 Checking out source code..."
                git branch: 'master', url: 'https://github.com/srivallabha01/ansible1.git'
            }
        }

        stage('Build') {
            steps {
                echo "🔨 Building application with Maven..."
                sh 'mvn clean compile'
            }
        }

        stage('Test') {
            steps {
                echo "🧪 Running tests..."
                sh 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }

        stage('Package') {
            steps {
                echo "📦 Packaging application..."
                sh 'mvn package -DskipTests'
            }
        }

        stage('Archive Artifacts') {
            steps {
                echo "📚 Archiving build artifacts..."
                archiveArtifacts artifacts: 'target/*.war', fingerprint: true
            }
        }

        stage('Pre-deployment Health Check') {
            steps {
                echo "🔍 Checking Tomcat status before deployment..."
                script {
                    try {
                        sh 'curl -f ${TOMCAT_URL}/manager/text/list || echo "Tomcat manager not accessible"'
                    } catch (Exception e) {
                        echo "⚠️ Pre-deployment check completed with warnings"
                    }
                }
            }
        }

        stage('Deploy with Ansible') {
            steps {
                echo "🚀 Deploying application using Ansible..."
                dir('ansible') {
                    sh '''
                        ansible-playbook -i hosts.ini playbook.yml \
                        --tags "backup,deploy,verify" \
                        -v
                    '''
                }
            }
        }

        stage('Post-deployment Verification') {
            steps {
                echo "✅ Verifying deployment..."
                script {
                    sleep(time: 15, unit: "SECONDS")
                    def response = sh(
                        script: "curl -s -o /dev/null -w '%{http_code}' ${TOMCAT_URL}/${APP_NAME}",
                        returnStdout: true
                    ).trim()

                    if (response == '200') {
                        echo "✅ Application is running successfully!"
                        currentBuild.description = "Deployment Successful - ${APP_NAME}"
                    } else {
                        error "❌ Application health check failed. HTTP status: ${response}"
                    }
                }
            }
        }

        stage('Smoke Tests') {
            steps {
                echo "🔥 Running smoke tests..."
                script {
                    def testResults = sh(
                        script: """
                            curl -s ${TOMCAT_URL}/${APP_NAME} | grep -i "ansible" && echo "Content check passed" || echo "Content check failed"
                        """,
                        returnStdout: true
                    )
                    echo "Smoke test results: ${testResults}"
                }
            }
        }
    }

    post {
        always {
            echo "🧹 Cleaning up workspace..."
            cleanWs()
        }
        success {
            echo "🎉 Pipeline completed successfully!"
            script {
                currentBuild.displayName = "#${BUILD_NUMBER} - Success"
            }
        }
        failure {
            echo "❌ Pipeline failed!"
            script {
                currentBuild.displayName = "#${BUILD_NUMBER} - Failed"
            }
        }
        unstable {
            echo "⚠️ Pipeline completed with warnings!"
        }
    }
}
