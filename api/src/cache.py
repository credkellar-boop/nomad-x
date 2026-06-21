import json
import os

class MemoryCacheManager:
    """
    Volatile in-memory operational cache. Employs fallbacks to prevent 
    redundant LLM context hits if Redis is temporarily unreachable.
    """
    def __init__(self):
        self._store = {}

    def get(self, key: str) -> dict | None:
        raw_val = self._store.get(key)
        if raw_val:
            return json.loads(raw_val)
        return None

    def set(self, key: str, val: dict, ttl_seconds: int = 300):
        # Primitive memory retention; replace with redis-py cluster client in production
        self._store[key] = json.dumps(val)

cache = MemoryCacheManager()
