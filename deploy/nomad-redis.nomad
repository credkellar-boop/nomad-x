job "nomad-x-cache" {
  datacenters = ["dc1"]
  type = "service"

  group "redis" {
    count = 1

    network {
      port "redis" {
        to = 6379
      }
    }

    task "redis" {
      driver = "docker"

      config {
        image = "redis:7-alpine"
        ports = ["redis"]
        args = [
          "redis-server",
          "--maxmemory 256mb",
          "--maxmemory-policy allkeys-lru" # Ruthless key eviction for B2B scale
        ]
      }

      resources {
        cpu    = 500
        memory = 256
      }
      
      service {
        name = "redis-cache"
        port = "redis"
        check {
          type     = "tcp"
          interval = "10s"
          timeout  = "2s"
        }
      }
    }
  }
}
