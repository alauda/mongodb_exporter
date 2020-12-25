library "alauda-cicd"
def language = "golang"
AlaudaPipeline {
    config = [
        agent: 'golang-1.13',
        folder: '.',
        scm: [
            credentials: 'alaudabot-gitlab'
        ],
        docker: [
            repository: "tdsql/mongodb-exporter",
            credentials: "tdsql-harbor-b",
            context: ".",
            dockerfile: "Dockerfile",
            enabled: true,
            armBuild: true
        ],
        sonar: [
            binding: "sonarqube",
            enabled: false
        ],
    ]
    env = [
        GO111MODULE: "on",
        GOPROXY: "https://athens.alauda.cn,https://goproxy.cn,direct",
        CGO_ENABLED: "0",
        GOOS: "linux",
    ]
}
