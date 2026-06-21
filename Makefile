# Nomad-X Master Execution Pipeline
# For Ruthless Business Efficiency.

.PHONY: build deploy logs clean db-sync

build:
	@echo ">> Building Backend and Flutter Architectures..."
	./scripts/build_nomad_x.sh

deploy:
	@echo ">> Pushing strictly to Nomad Cluster..."
	nomad job run deploy/nomad-x.nomad
	nomad job run deploy/nomad-redis.nomad

db-sync:
	@echo ">> Synchronizing Database Schemas..."
	./scripts/db_migrate.sh

logs:
	@echo ">> Tailing Nomad cluster logs..."
	nomad alloc logs -f -job nomad-x-stack

clean:
	@echo ">> Purging all local caches and build artifacts..."
	cd app && flutter clean
	find . -type d -name "__pycache__" -exec rm -r {} +
	find . -type d -name ".pytest_cache" -exec rm -r {} +
