def os_versions =["16","18"]

def build_step(os){
 return{
   node{
      stage ("build image for Ubuntu ${os}"){
        withCredentials([usernamePassword(credentialsId:'dockerHubID',usernameVariable:'dockerID', passwordVariable:'dockerPW')]) {

           def package_location = sh(returnStdout:true, script: "readlink -f ../rust_aion_pipelineTest/package/aionr*")
           echo "${package_location}"
           def dockerfile = "Dockerfile${os}_04_env-with_binary"
           echo "${dockerfile}"
           def docker_dir= "./Dockerfiles"
           def aionrImage = docker.build("${dockerID}/ub${os}_aionr_binary", "-f ${dockerfile} --build-arg PACKAGE_LOCATION=${package_location} ${docker_dir}")

           aionrImage.push()
         }
      }
   }
 }
}

parallel os_versions.collectEntries{
  ["echoing ${it}":build_step(it)]
}
