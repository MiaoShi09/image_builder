def os_versions =["16","18"]

def build_step(os){
 return{
   node{
      stage ("build image for Ubuntu ${os}"){
        withCredentials([usernamePassword(credentialsId:'dockerHubID',usernameVariable:'dockerID', passwordVariable:'dockerPW')]) {

           def package_location = sh(returnStdout:true, script: "readlink -f ../rust_aion_pipelineTest/package/aionr*").trim()
           echo "${package_location}"
           def dockerfile = "Dockerfile${os}_04_env-with_binary"
           echo "${dockerfile}"
           def docker_dir= "Dockerfiles/"
           echo "${docker_dir}"
           def aionrImage = docker.build("${dockerID}/ub${os}_aionr_binary:latest", "-f ${docker_dir}${dockerfile} --build-arg PACKAGE_LOCATION=${package_location} .")

           aionrImage.push()
         }
      }
   }
 }
}

parallel os_versions.collectEntries{
  ["echoing ${it}":build_step(it)]
}
