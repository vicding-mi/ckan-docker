group "default" {
  targets = ["ckan"]
}

target "ckan" {
  context = "./ckan"
  dockerfile = "Dockerfile"
  tags = ["vicding81/ckan-docker-ckan:2.10.1-2"]
  args = {
    TZ = "${TZ}"
  }
  platforms = ["linux/amd64", ]
}
