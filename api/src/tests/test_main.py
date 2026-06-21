import pytest
from fastapi.testclient import TestClient
from src.main import app

client = TestClient(app)

def test_health_check_endpoint():
    response = client.get("/health")
    assert response.status_code == 200
    assert response.json() == {"status": "operational", "system": "Nomad-X"}

def test_translation_engine_routing():
    payload = {
        "text": "System optimization mandatory",
        "target_language": "German"
    }
    response = client.post("/api/v1/translate", json=payload)
    assert response.status_code == 200
    data = response.json()
    assert "translated" in data
    assert data["original"] == "System optimization mandatory"
