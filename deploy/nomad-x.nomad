job "nomad-x-stack" {
  datacenters = ["dc1"]
  type = "service"

  group "backend-api" {
    count = 2

    network {
      port "http" {
        to = 8000
      }
    }

    task "api" {
      driver = "docker"

      config {
        image = "nomad-x-api:latest"
        ports = ["http"]
      }

      env {
        ENVIRONMENT = "production"
        API_PORT    = "8000"
      }

      resources {
        cpu    = 1024 # MHz
        memory = 512  # MB
      }
    }
  }
}
