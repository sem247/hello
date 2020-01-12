#!/usr/bin/env groovy

pipeline {
    agent { label "master" }

    options {
        disableConcurrentBuilds()
    }

    parameters {
        string(
                name: 'MY_BRANCH_NAME',
                defaultValue: 'develop',
                description: 'Which branch to deploy'
        )
        choice(
                name: 'MY_VERSION',
                choices: '2.0.0',
                description: 'My version'
        )
        extendedChoice(
                name: 'MY_PROJECT',
                type: 'PT_SINGLE_SELECT',
                groovyScript: '''
                    import groovy.json.JsonSlurper
                    String jRaw = "{'imageIds':[{'imageDigest':'sha256:99c6fb4377e9a420a1eb3b410a951c9f464eff3b7dbc76c65e434e39b94b6570','imageTag':'v1.13.8'},{'imageDigest':'sha256:99c6fb4377e9a420a1eb3b410a951c9f464eff3b7dbc76c65e434e39b94b6570','imageTag':'v1.13.7'},{'imageDigest':'sha256:4a1c6567c38904384ebc64e35b7eeddd8451110c299e3368d2210066487d97e5','imageTag':'v1.13.6'}]}"
                    def jsonSlurper = new JsonSlurper()
                    def artifactsJsonObject = jsonSlurper.parseText(jRaw)
                    def dataArray = artifactsJsonObject.imageIds
                    def results = ''
                    for(item in dataArray) {
                        results = item.imageTag + ','
                    }
                    
                    return results
                ''',
                defaultValue: 'B',
                visibleItemCount: 2,
                description: 'Select something'
        )
    }

    stages {
        stage('Initialize') {
            steps {
                sh '''
                    echo "Selected branch name = ${MY_BRANCH_NAME}"
                    echo "Selected version = ${MY_VERSION}"
                    echo "Selected project = ${MY_PROJECT}"
                    echo "PATH = ${PATH}"
                '''
            }
        }
    }
}